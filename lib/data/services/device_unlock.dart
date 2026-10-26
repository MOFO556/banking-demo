import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mofobank/l10n/l10n_ext.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mofobank/data/repositories/security_repository.dart';

/// Cross-platform unlock helper.
///
/// Android / iOS use OS biometrics via [LocalAuthentication].
/// Windows / web / desktop fall back to a short PIN re-confirm dialog
class DeviceUnlock {
  DeviceUnlock(this._security);

  final SecurityRepository _security;
  final LocalAuthentication _auth = LocalAuthentication();

  bool get usesOsBiometrics {
    if (kIsWeb) {
      return false;
    }
    try {
      return Platform.isAndroid || Platform.isIOS;
    } catch (_) {
      return false;
    }
  }

  /// Whether OS biometrics (fingerprint / face / device credential) are usable.
  Future<bool> isAvailable() async {
    if (!usesOsBiometrics) {
      return false;
    }
    try {
      final canCheck = await _auth.canCheckBiometrics;
      final supported = await _auth.isDeviceSupported();
      return canCheck || supported;
    } catch (_) {
      return false;
    }
  }

  Future<bool> authenticate({
    required BuildContext context,
    required String reason,
  }) async {
    if (usesOsBiometrics) {
      try {
        return await _auth.authenticate(
          localizedReason: reason,
          biometricOnly: false,
        );
      } catch (_) {
        return false;
      }
    }

    if (!context.mounted) return false;
    final l10n = context.l10n;
    final pinCtrl = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: Text(l10n.confirmIdentity),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(reason, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 12),
              TextField(
                controller: pinCtrl,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: l10n.appPin,
                  counterText: '',
                  helperText: l10n.devicePinHelper,
                ),
                onSubmitted: (_) async {
                  final valid = await _security.verifyPin(pinCtrl.text);
                  if (ctx.mounted) {
                    Navigator.pop(ctx, valid);
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () async {
                final valid = await _security.verifyPin(pinCtrl.text);
                if (ctx.mounted) {
                  Navigator.pop(ctx, valid);
                }
              },
              child: Text(l10n.unlock),
            ),
          ],
        );
      },
    );
    pinCtrl.dispose();
    return ok ?? false;
  }
}
