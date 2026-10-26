import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/data/repositories/session_controller.dart';
import 'package:mofobank/features/shared/widgets/appearance_prefs.dart';
import 'package:mofobank/features/shared/widgets/mofo_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final session = ref.watch(sessionControllerProvider);
    final snap = ref.watch(bankSnapshotProvider).valueOrNull;
    final c = MofoColors.of(context);

    return MofoScaffold(
      title: l10n.settings,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SectionHeader(l10n.settingsAppearance),
          const AppearancePrefs(),
          const SizedBox(height: 16),
          SectionHeader(l10n.settingsSession),
          if (snap != null) ...[
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(snap.profile.displayName),
              subtitle: Text('@${snap.profile.handle}'),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.biometricUnlock),
              subtitle: Text(
                session.biometricsAvailable
                    ? l10n.biometricAvailable
                    : l10n.biometricUnavailable,
              ),
              value:
                  snap.profile.biometricsEnabled && session.biometricsAvailable,
              activeThumbColor: c.accent,
              onChanged: !session.biometricsAvailable
                  ? null
                  : (v) async {
                      await ref
                          .read(bankRepositoryProvider)
                          .setBiometricsEnabled(v);
                      ref.invalidate(bankSnapshotProvider);
                    },
            ),
          ],
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.lock_outline),
            title: Text(l10n.lockApp),
            onTap: () {
              ref.read(sessionControllerProvider.notifier).logout();
              context.go('/lock');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.logout, color: c.danger),
            title: Text(l10n.createNewAccount),
            subtitle: Text(l10n.wipeSubtitle),
            onTap: () async {
              final ok = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(l10n.wipeTitle),
                  content: Text(l10n.wipeBody),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, false),
                      child: Text(l10n.cancel),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, true),
                      child: Text(l10n.wipe),
                    ),
                  ],
                ),
              );
              if (ok == true) {
                await ref
                    .read(sessionControllerProvider.notifier)
                    .createNewAccount();
                if (context.mounted) context.go('/onboarding');
              }
            },
          ),
          const SizedBox(height: 24),
          SectionHeader(l10n.shop),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.storefront_outlined),
            title: Text(l10n.boostStore),
            onTap: () => context.push('/boosts'),
          ),
        ],
      ),
    );
  }
}
