import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/data/repositories/session_controller.dart';
import 'package:mofobank/l10n/app_localizations.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class LockScreen extends ConsumerStatefulWidget {
  const LockScreen({super.key});

  @override
  ConsumerState<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends ConsumerState<LockScreen> {
  final _pin = TextEditingController();
  String? _error;
  bool _busy = false;
  bool _bioPrompted = false;

  @override
  void dispose() {
    _pin.dispose();
    super.dispose();
  }

  Future<void> _unlockPin(AppLocalizations l10n) async {
    if (_pin.text.length < 4) {
      setState(() => _error = context.l10n.enterPin);
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    final ok = await ref
        .read(sessionControllerProvider.notifier)
        .unlockWithPin(_pin.text);
    if (!mounted) return;
    setState(() {
      _busy = false;
      if (!ok) {
        _error = l10n.wrongPin;
      }
    });
  }

  Future<void> _unlockBio(AppLocalizations l10n) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    final ok = await ref
        .read(sessionControllerProvider.notifier)
        .unlockWithBiometrics(context);
    if (!mounted) return;
    setState(() {
      _busy = false;
      if (!ok) {
        _error = l10n.bioCancelled;
      }
    });
  }

  bool _canUseBio(SessionState session, bool profileEnabled) =>
      session.biometricsAvailable && profileEnabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final session = ref.watch(sessionControllerProvider);
    final snap = ref.watch(bankSnapshotProvider).valueOrNull;
    final bioEnabled = snap?.profile.biometricsEnabled ?? false;
    final showBio = _canUseBio(session, bioEnabled);

    if (showBio && !_bioPrompted && !_busy) {
      _bioPrompted = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _unlockBio(l10n);
        }
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                l10n.lockTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: MofoColors.of(context).accent,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                snap == null
                    ? l10n.welcomeBack
                    : l10n.hiUser(snap.profile.displayName),
                textAlign: TextAlign.center,
                style: TextStyle(color: MofoColors.of(context).textSecondary),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: _pin,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: l10n.pinLabel,
                  helperText: l10n.devicePinHelper,
                  counterText: '',
                  errorText: _error,
                ),
                onChanged: (v) {
                  if (v.length == 6) {
                    _unlockPin(l10n);
                  }
                },
                onSubmitted: (_) => _unlockPin(l10n),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _busy ? null : () => _unlockPin(l10n),
                child: _busy
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(l10n.unlock),
              ),
              if (showBio) ...[
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: _busy ? null : () => _unlockBio(l10n),
                  icon: Icon(Icons.fingerprint),
                  label: Text(l10n.useBiometrics),
                ),
              ] else if (session.biometricsAvailable && !bioEnabled) ...[
                const SizedBox(height: 10),
                Text(
                  l10n.enableBiometricsHint,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MofoColors.of(context).textSecondary
                        .withValues(alpha: 0.9),
                    fontSize: 12,
                  ),
                ),
              ],
              const Spacer(),
              TextButton(
                onPressed: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(l10n.createNewAccount),
                      content: Text(l10n.wipeSubtitle),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: Text(l10n.cancel),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          child: Text(l10n.wipeAndCreate),
                        ),
                      ],
                    ),
                  );
                  if (confirm == true) {
                    await ref
                        .read(sessionControllerProvider.notifier)
                        .createNewAccount();
                  }
                },
                child: Text(l10n.createNewAccount),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
