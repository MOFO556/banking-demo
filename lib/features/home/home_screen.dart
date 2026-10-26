import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/money/format.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/rpg/leveling.dart';
import 'package:mofobank/data/repositories/session_controller.dart';
import 'package:mofobank/features/shared/widgets/country_flag.dart';
import 'package:mofobank/features/shared/widgets/mofo_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final async = ref.watch(bankSnapshotProvider);

    return MofoScaffold(
      title: l10n.appTitle,
      actions: [
        IconButton(
          tooltip: l10n.lockTooltip,
          icon: const Icon(Icons.lock_outline),
          onPressed: () {
            ref.read(sessionControllerProvider.notifier).logout();
            context.go('/lock');
          },
        ),
        IconButton(
          tooltip: l10n.settings,
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => context.push('/settings'),
        ),
      ],
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(l10n.errorPrefix('$e'))),
        data: (snap) {
          if (snap == null) {
            return Center(child: Text(l10n.completeOnboarding));
          }
          final currency = snap.account.currencyCode;
          MissionDef? nextMission;
          for (final m in Curriculum.missions) {
            final p = snap.missionProgress
                .where((x) => x.missionId == m.id.name)
                .firstOrNull;
            if (p != null && p.unlocked && !p.completed) {
              nextMission = m;
              break;
            }
          }

          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              Row(
                spacing: 5,
                children: [
                  Text(
                    l10n.hiUser(snap.profile.displayName),
                    style: TextStyle(
                      color: MofoColors.of(context).textSecondary,
                    ),
                  ),
                  if (snap.profile.themeBadge)
                    Badge(
                      label: Text(l10n.tealBadge),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      backgroundColor: MofoColors.of(context).accent,
                      textColor: MofoColors.of(context).textAlt,
                    ),
                ],
              ),
              Text(
                '@${snap.profile.handle}',
                style: TextStyle(
                  color: MofoColors.of(context).accent,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 6),
              TweenAnimationBuilder<double>(
                tween: Tween(
                  begin: 0,
                  end: snap.account.balanceMinor.toDouble(),
                ),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                builder: (context, value, _) {
                  return Text(
                    formatMinor(value.round(), currency),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1,
                    ),
                  );
                },
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  CountryFlag(marketId: snap.market.id, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    '${localizedMarketName(l10n, snap.market.id)} · ${l10n.level} ${snap.level}',
                    style: TextStyle(
                      color: MofoColors.of(context).textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value:
                      Leveling.xpIntoCurrentLevel(snap.profile.xp) /
                      Leveling.xpPerLevel,
                  minHeight: 8,
                  backgroundColor: MofoColors.of(context).surfaceElevated,
                  color: MofoColors.of(context).accent,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${Leveling.xpIntoCurrentLevel(snap.profile.xp)} / ${Leveling.xpPerLevel} ${l10n.xp} · ${l10n.efficiency} ${snap.efficiencyScore.toStringAsFixed(0)}',
                style: TextStyle(
                  color: MofoColors.of(context).textSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 28),
              SectionHeader(
                l10n.continueLearning,
                subtitle: l10n.continueLearningSubtitle,
              ),
              if (nextMission case final mission?)
                _MissionCard(
                  title: localizedMission(l10n, mission.id).$1,
                  subtitle: localizedMission(l10n, mission.id).$2,
                  onTap: () => context.push(mission.routePath),
                )
              else
                Text(
                  l10n.allMissionsComplete,
                  style: TextStyle(color: MofoColors.of(context).textSecondary),
                ),
              const SizedBox(height: 28),
              SectionHeader(l10n.quickTools),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _ToolChip(
                    label: l10n.card,
                    icon: Icons.credit_card,
                    onTap: () => context.push('/mission/cards'),
                  ),
                  _ToolChip(
                    label: l10n.fx,
                    icon: Icons.currency_exchange,
                    onTap: () => context.push('/mission/fx'),
                  ),
                  _ToolChip(
                    label: l10n.atm,
                    icon: Icons.local_atm,
                    onTap: () => context.push('/mission/atm'),
                  ),
                  _ToolChip(
                    label: l10n.navAccounts,
                    icon: Icons.account_balance,
                    onTap: () => context.go('/accounts'),
                  ),
                  _ToolChip(
                    label: l10n.transfer,
                    icon: Icons.swap_horiz,
                    onTap: () => context.push('/banking/transfer'),
                  ),
                  _ToolChip(
                    label: l10n.boosts,
                    icon: Icons.storefront_outlined,
                    onTap: () => context.push('/boosts'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MissionCard extends StatelessWidget {
  const _MissionCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MofoColors.of(context).surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: MofoColors.of(context).accentDim
                      .withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: MofoColors.of(context).accent,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: MofoColors.of(context).textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: MofoColors.of(context).textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToolChip extends StatelessWidget {
  const _ToolChip({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18, color: MofoColors.of(context).accent),
      label: Text(label),
      backgroundColor: MofoColors.of(context).surfaceElevated,
      side: BorderSide(color: MofoColors.of(context).border),
      onPressed: onTap,
    );
  }
}
