import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';
import 'package:mofobank/l10n/quiz_l10n.dart';
import 'package:mofobank/features/shared/mission_progress_ui.dart';
import 'package:mofobank/features/shared/widgets/mission_complete_sheet.dart';
import 'package:mofobank/features/shared/widgets/mission_quiz_panel.dart';
import 'package:mofobank/features/shared/widgets/mission_scaffold.dart';
import 'package:mofobank/features/shared/widgets/section_header.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class SecurityMissionScreen extends ConsumerStatefulWidget {
  const SecurityMissionScreen({super.key});

  @override
  ConsumerState<SecurityMissionScreen> createState() =>
      _SecurityMissionScreenState();
}

class _SecurityMissionScreenState extends ConsumerState<SecurityMissionScreen> {
  late MissionQuizBank _bank;
  late List<int?> _answers;
  bool _quizInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_quizInitialized) {
      _bank = localizedQuizBank(context.l10n, MissionId.security);
      _answers = List<int?>.filled(_bank.length, null, growable: false);
      _quizInitialized = true;
    }
  }

  int _qIndex = 0;

  final _pin = TextEditingController();
  final _verify = TextEditingController();
  bool _pinSet = false;
  bool _pinOk = false;
  String? _status;

  bool get _quizComplete => _answers.every((a) => a != null);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final has = await ref.read(securityRepositoryProvider).hasPin();
    setState(() => _pinSet = has);
  }

  @override
  void dispose() {
    _pin.dispose();
    _verify.dispose();
    super.dispose();
  }

  Future<void> _finish(String missionTitle) async {
    var score = _bank.scoreRatio(_answers) * 0.7;
    if (_pinSet && _pinOk) {
      score += 0.3;
    }

    final settlement = await ref
        .read(bankRepositoryProvider)
        .completeMission(
          missionId: MissionId.security,
          performanceRatio: score.clamp(0.05, 1.0),
        );
    ref.invalidate(bankSnapshotProvider);
    final snap = await ref.read(bankRepositoryProvider).loadSnapshot();
    if (!mounted || snap == null) {
      return;
    }
    await showMissionCompleteSheet(
      context,
      settlement: settlement,
      currencyCode: snap.account.currencyCode,
      missionTitle: missionTitle,
    );
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final async = ref.watch(bankSnapshotProvider);
    return async.when(
      loading: () => MissionScaffold(
        title: l10n.security,
        body: Center(child: CircularProgressIndicator()),
        bottomBar: SizedBox.shrink(),
      ),
      error: (e, _) => MissionScaffold(
        title: l10n.security,
        body: Center(child: Text(localizedError(context.l10n, e))),
        bottomBar: const SizedBox.shrink(),
      ),
      data: (snap) {
        if (snap == null) {
          return MissionScaffold(
            title: l10n.security,
            body: SizedBox.shrink(),
            bottomBar: SizedBox.shrink(),
          );
        }
        final completed = missionIsCompleted(snap, MissionId.security);
        return MissionScaffold(
          title: l10n.security,
          statusSlot: Text(
            completed
                ? l10n.missionCompletedHint
                : (_status ?? l10n.securityInitialStatus),
            style: TextStyle(
              color: completed
                  ? MofoColors.of(context).success
                  : MofoColors.of(context).accent,
              fontSize: 13,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          bottomBar: ElevatedButton(
            onPressed: _quizComplete
                ? () => _finish(l10n.missionSecurityTitle)
                : null,
            child: Text(missionFinishLabel(l10n, completed: completed)),
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            children: [
              SectionHeader(
                l10n.pinAndFreeze,
                subtitle: l10n.pinAndFreezeSubtitle,
              ),
              TextField(
                controller: _pin,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  labelText: l10n.setPinLabel,
                  helperText: l10n.devicePinHelper,
                  counterText: '',
                ),
              ),
              OutlinedButton(
                onPressed: () async {
                  if (_pin.text.length < 4 || _pin.text.length > 6) {
                    return;
                  }
                  await ref.read(securityRepositoryProvider).setPin(_pin.text);
                  setState(() {
                    _pinSet = true;
                    _status = l10n.pinSaved;
                  });
                },
                child: Text(l10n.savePin),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _verify,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  labelText: l10n.verifyPin,
                  counterText: '',
                ),
              ),
              OutlinedButton(
                onPressed: () async {
                  final ok = await ref
                      .read(securityRepositoryProvider)
                      .verifyPin(_verify.text);
                  setState(() {
                    _pinOk = ok;
                    _status = ok ? l10n.pinVerified : l10n.wrongPin;
                  });
                },
                child: Text(l10n.verify),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.freezePrimaryCard),
                value: snap.cards.isNotEmpty && snap.cards.first.frozen,
                activeThumbColor: MofoColors.of(context).accent,
                onChanged: (v) async {
                  await ref.read(bankRepositoryProvider).freezePrimaryCard(v);
                  ref.invalidate(bankSnapshotProvider);
                  setState(() {
                    _status = v ? l10n.cardFrozen : l10n.cardUnfrozen;
                  });
                },
              ),
              const SizedBox(height: 12),
              MissionQuizPanel(
                bank: _bank,
                answers: _answers,
                currentIndex: _qIndex,
                onSelect: (i) => setState(() => _answers[_qIndex] = i),
                onPrev: () => setState(() => _qIndex--),
                onNext: () => setState(() => _qIndex++),
              ),
            ],
          ),
        );
      },
    );
  }
}
