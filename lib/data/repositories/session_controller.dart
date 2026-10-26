import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofobank/data/repositories/bank_repository.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/data/repositories/security_repository.dart';
import 'package:mofobank/data/services/device_unlock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionState {
  const SessionState({
    required this.onboarded,
    required this.unlocked,
    required this.biometricsAvailable,
  });

  final bool onboarded;
  final bool unlocked;
  final bool biometricsAvailable;

  SessionState copyWith({
    bool? onboarded,
    bool? unlocked,
    bool? biometricsAvailable,
  }) {
    return SessionState(
      onboarded: onboarded ?? this.onboarded,
      unlocked: unlocked ?? this.unlocked,
      biometricsAvailable: biometricsAvailable ?? this.biometricsAvailable,
    );
  }
}

class SessionController extends StateNotifier<SessionState> {
  SessionController(this._ref)
    : super(
        const SessionState(
          onboarded: false,
          unlocked: false,
          biometricsAvailable: false,
        ),
      ) {
    _bootstrap();
  }

  final Ref _ref;

  static const _prefsOnboarded = 'mofobank_onboarded_v2';

  BankRepository get _bank => _ref.read(bankRepositoryProvider);
  SecurityRepository get _security => _ref.read(securityRepositoryProvider);
  DeviceUnlock get _deviceUnlock => DeviceUnlock(_security);

  Future<void> _bootstrap() async {
    final prefs = await SharedPreferences.getInstance();
    final dbOnboarded = await _bank.isOnboarded();
    final prefsOnboarded = prefs.getBool(_prefsOnboarded) ?? false;
    final onboarded = dbOnboarded || prefsOnboarded;
    final bio = await _deviceUnlock.isAvailable();

    state = state.copyWith(
      onboarded: onboarded,
      unlocked: false,
      biometricsAvailable: bio,
    );
  }

  Future<void> markOnboarded() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsOnboarded, true);
    state = state.copyWith(onboarded: true, unlocked: true);
  }

  Future<bool> unlockWithPin(String pin) async {
    if (pin.length < 4 || pin.length > 6) {
      return false;
    }
    final ok = await _security.verifyPin(pin);
    if (ok) {
      state = state.copyWith(unlocked: true);
    }
    return ok;
  }

  Future<bool> unlockWithBiometrics(BuildContext context) async {
    try {
      final snap = await _bank.loadSnapshot();
      if (snap == null || !snap.profile.biometricsEnabled) {
        return false;
      }
      if (!state.biometricsAvailable) {
        return false;
      }
      if (!context.mounted) {
        return false;
      }
      final ok = await _deviceUnlock.authenticate(
        context: context,
        reason: 'Unlock MOFOBank',
      );
      if (ok) {
        state = state.copyWith(unlocked: true);
      }
      return ok;
    } catch (_) {
      return false;
    }
  }

  void lock() {
    state = state.copyWith(unlocked: false);
  }

  void logout() => lock();

  Future<void> createNewAccount() async {
    await _bank.resetAllData();
    await _security.clearPin();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsOnboarded, false);
    state = state.copyWith(onboarded: false, unlocked: false);
    _ref.invalidate(bankSnapshotProvider);
    _ref.invalidate(onboardedProvider);
  }

  Future<void> refresh() => _bootstrap();
}

final sessionControllerProvider =
    StateNotifierProvider<SessionController, SessionState>((ref) {
      return SessionController(ref);
    });
