import 'package:mofobank/domain/missions/mission_def.dart';
import 'package:mofobank/domain/missions/quiz_models.dart';

abstract final class QuizBanks {
  static List<QuizQuestionSpec> forMission(MissionId id) {
    return switch (id) {
      MissionId.cards => _cards,
      MissionId.deposits => _deposits,
      MissionId.fx => _fx,
      MissionId.atm => _atm,
      MissionId.budgeting => _budgeting,
      MissionId.transfers => _transfers,
      MissionId.credit => _credit,
      MissionId.security => _security,
      MissionId.savingsGoals => _savings,
    };
  }

  static const _cards = <QuizQuestionSpec>[
    QuizQuestionSpec(
      promptKey: 'quiz_cards_0_prompt',
      optionKeys: [
        'quiz_cards_0_opt0',
        'quiz_cards_0_opt1',
        'quiz_cards_0_opt2',
        'quiz_cards_0_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_cards_1_prompt',
      optionKeys: [
        'quiz_cards_1_opt0',
        'quiz_cards_1_opt1',
        'quiz_cards_1_opt2',
        'quiz_cards_1_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_cards_2_prompt',
      optionKeys: [
        'quiz_cards_2_opt0',
        'quiz_cards_2_opt1',
        'quiz_cards_2_opt2',
        'quiz_cards_2_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_cards_3_prompt',
      optionKeys: [
        'quiz_cards_3_opt0',
        'quiz_cards_3_opt1',
        'quiz_cards_3_opt2',
        'quiz_cards_3_opt3',
      ],
      correctIndex: 1,
    ),
  ];

  static const _deposits = <QuizQuestionSpec>[
    QuizQuestionSpec(
      promptKey: 'quiz_deposits_0_prompt',
      optionKeys: [
        'quiz_deposits_0_opt0',
        'quiz_deposits_0_opt1',
        'quiz_deposits_0_opt2',
        'quiz_deposits_0_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_deposits_1_prompt',
      optionKeys: [
        'quiz_deposits_1_opt0',
        'quiz_deposits_1_opt1',
        'quiz_deposits_1_opt2',
        'quiz_deposits_1_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_deposits_2_prompt',
      optionKeys: [
        'quiz_deposits_2_opt0',
        'quiz_deposits_2_opt1',
        'quiz_deposits_2_opt2',
        'quiz_deposits_2_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_deposits_3_prompt',
      optionKeys: [
        'quiz_deposits_3_opt0',
        'quiz_deposits_3_opt1',
        'quiz_deposits_3_opt2',
        'quiz_deposits_3_opt3',
      ],
      correctIndex: 0,
    ),
  ];

  static const _fx = <QuizQuestionSpec>[
    QuizQuestionSpec(
      promptKey: 'quiz_fx_0_prompt',
      optionKeys: [
        'quiz_fx_0_opt0',
        'quiz_fx_0_opt1',
        'quiz_fx_0_opt2',
        'quiz_fx_0_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_fx_1_prompt',
      optionKeys: [
        'quiz_fx_1_opt0',
        'quiz_fx_1_opt1',
        'quiz_fx_1_opt2',
        'quiz_fx_1_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_fx_2_prompt',
      optionKeys: [
        'quiz_fx_2_opt0',
        'quiz_fx_2_opt1',
        'quiz_fx_2_opt2',
        'quiz_fx_2_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_fx_3_prompt',
      optionKeys: [
        'quiz_fx_3_opt0',
        'quiz_fx_3_opt1',
        'quiz_fx_3_opt2',
        'quiz_fx_3_opt3',
      ],
      correctIndex: 1,
    ),
  ];

  static const _atm = <QuizQuestionSpec>[
    QuizQuestionSpec(
      promptKey: 'quiz_atm_0_prompt',
      optionKeys: [
        'quiz_atm_0_opt0',
        'quiz_atm_0_opt1',
        'quiz_atm_0_opt2',
        'quiz_atm_0_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_atm_1_prompt',
      optionKeys: [
        'quiz_atm_1_opt0',
        'quiz_atm_1_opt1',
        'quiz_atm_1_opt2',
        'quiz_atm_1_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_atm_2_prompt',
      optionKeys: [
        'quiz_atm_2_opt0',
        'quiz_atm_2_opt1',
        'quiz_atm_2_opt2',
        'quiz_atm_2_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_atm_3_prompt',
      optionKeys: [
        'quiz_atm_3_opt0',
        'quiz_atm_3_opt1',
        'quiz_atm_3_opt2',
        'quiz_atm_3_opt3',
      ],
      correctIndex: 1,
    ),
  ];

  static const _budgeting = <QuizQuestionSpec>[
    QuizQuestionSpec(
      promptKey: 'quiz_budgeting_0_prompt',
      optionKeys: [
        'quiz_budgeting_0_opt0',
        'quiz_budgeting_0_opt1',
        'quiz_budgeting_0_opt2',
        'quiz_budgeting_0_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_budgeting_1_prompt',
      optionKeys: [
        'quiz_budgeting_1_opt0',
        'quiz_budgeting_1_opt1',
        'quiz_budgeting_1_opt2',
        'quiz_budgeting_1_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_budgeting_2_prompt',
      optionKeys: [
        'quiz_budgeting_2_opt0',
        'quiz_budgeting_2_opt1',
        'quiz_budgeting_2_opt2',
        'quiz_budgeting_2_opt3',
      ],
      correctIndex: 0,
    ),
  ];

  static const _transfers = <QuizQuestionSpec>[
    QuizQuestionSpec(
      promptKey: 'quiz_transfers_0_prompt',
      optionKeys: [
        'quiz_transfers_0_opt0',
        'quiz_transfers_0_opt1',
        'quiz_transfers_0_opt2',
        'quiz_transfers_0_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_transfers_1_prompt',
      optionKeys: [
        'quiz_transfers_1_opt0',
        'quiz_transfers_1_opt1',
        'quiz_transfers_1_opt2',
        'quiz_transfers_1_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_transfers_2_prompt',
      optionKeys: [
        'quiz_transfers_2_opt0',
        'quiz_transfers_2_opt1',
        'quiz_transfers_2_opt2',
        'quiz_transfers_2_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_transfers_3_prompt',
      optionKeys: [
        'quiz_transfers_3_opt0',
        'quiz_transfers_3_opt1',
        'quiz_transfers_3_opt2',
        'quiz_transfers_3_opt3',
      ],
      correctIndex: 0,
    ),
  ];

  static const _credit = <QuizQuestionSpec>[
    QuizQuestionSpec(
      promptKey: 'quiz_credit_0_prompt',
      optionKeys: [
        'quiz_credit_0_opt0',
        'quiz_credit_0_opt1',
        'quiz_credit_0_opt2',
        'quiz_credit_0_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_credit_1_prompt',
      optionKeys: [
        'quiz_credit_1_opt0',
        'quiz_credit_1_opt1',
        'quiz_credit_1_opt2',
        'quiz_credit_1_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_credit_2_prompt',
      optionKeys: [
        'quiz_credit_2_opt0',
        'quiz_credit_2_opt1',
        'quiz_credit_2_opt2',
        'quiz_credit_2_opt3',
      ],
      correctIndex: 0,
    ),
  ];

  static const _security = <QuizQuestionSpec>[
    QuizQuestionSpec(
      promptKey: 'quiz_security_0_prompt',
      optionKeys: [
        'quiz_security_0_opt0',
        'quiz_security_0_opt1',
        'quiz_security_0_opt2',
        'quiz_security_0_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_security_1_prompt',
      optionKeys: [
        'quiz_security_1_opt0',
        'quiz_security_1_opt1',
        'quiz_security_1_opt2',
        'quiz_security_1_opt3',
      ],
      correctIndex: 1,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_security_2_prompt',
      optionKeys: [
        'quiz_security_2_opt0',
        'quiz_security_2_opt1',
        'quiz_security_2_opt2',
        'quiz_security_2_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_security_3_prompt',
      optionKeys: [
        'quiz_security_3_opt0',
        'quiz_security_3_opt1',
        'quiz_security_3_opt2',
        'quiz_security_3_opt3',
      ],
      correctIndex: 0,
    ),
  ];

  static const _savings = <QuizQuestionSpec>[
    QuizQuestionSpec(
      promptKey: 'quiz_savings_0_prompt',
      optionKeys: [
        'quiz_savings_0_opt0',
        'quiz_savings_0_opt1',
        'quiz_savings_0_opt2',
        'quiz_savings_0_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_savings_1_prompt',
      optionKeys: [
        'quiz_savings_1_opt0',
        'quiz_savings_1_opt1',
        'quiz_savings_1_opt2',
        'quiz_savings_1_opt3',
      ],
      correctIndex: 0,
    ),
    QuizQuestionSpec(
      promptKey: 'quiz_savings_2_prompt',
      optionKeys: [
        'quiz_savings_2_opt0',
        'quiz_savings_2_opt1',
        'quiz_savings_2_opt2',
        'quiz_savings_2_opt3',
      ],
      correctIndex: 0,
    ),
  ];
}
