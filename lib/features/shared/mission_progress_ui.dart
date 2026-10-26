import 'package:mofobank/data/repositories/bank_repository.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/l10n/app_localizations.dart';

bool missionIsCompleted(BankSnapshot snap, MissionId id) {
  return snap.missionProgress.any(
    (p) => p.missionId == id.name && p.completed,
  );
}

String missionFinishLabel(AppLocalizations l10n, {required bool completed}) {
  return completed ? l10n.replayMission : l10n.settleMission;
}
