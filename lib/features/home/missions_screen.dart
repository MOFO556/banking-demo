import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/features/shared/widgets/mofo_scaffold.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class MissionsScreen extends ConsumerWidget {
  const MissionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final async = ref.watch(bankSnapshotProvider);

    return MofoScaffold(
      title: l10n.missionsTitle,
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(localizedError(context.l10n, e))),
        data: (snap) {
          if (snap == null) return const SizedBox.shrink();
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: Curriculum.missions.length,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final m = Curriculum.missions[index];
              final p = snap.missionProgress
                  .where((x) => x.missionId == m.id.name)
                  .firstOrNull;
              final unlocked = p?.unlocked ?? false;
              final completed = p?.completed ?? false;

              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: MofoColors.of(context).border),
                ),
                tileColor: MofoColors.of(context).surface,
                leading: CircleAvatar(
                  backgroundColor: completed
                      ? MofoColors.of(context).success.withValues(alpha: 0.2)
                      : unlocked
                      ? MofoColors.of(context).accentDim.withValues(alpha: 0.35)
                      : MofoColors.of(context).surfaceElevated,
                  child: Icon(
                    completed
                        ? Icons.check
                        : unlocked
                        ? Icons.lock_open
                        : Icons.lock_outline,
                    color: completed
                        ? MofoColors.of(context).success
                        : unlocked
                        ? MofoColors.of(context).accent
                        : MofoColors.of(context).textSecondary,
                  ),
                ),
                title: Text(localizedMission(l10n, m.id).$1),
                subtitle: Text(
                  localizedMission(l10n, m.id).$2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: completed
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            l10n.missionCompleted,
                            style: TextStyle(
                              color: MofoColors.of(context).success,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            l10n.missionsReplayAvailable,
                            style: TextStyle(
                              color: MofoColors.of(context).accent,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      )
                    : null,
                onTap: unlocked ? () => context.push(m.routePath) : null,
              );
            },
          );
        },
      ),
    );
  }
}
