// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'MOFOBank';

  @override
  String get navHome => 'Главная';

  @override
  String get navMissions => 'Задания';

  @override
  String get navAccounts => 'Счета';

  @override
  String get navWallet => 'Кошелёк';

  @override
  String get settings => 'Настройки';

  @override
  String get settingsSession => 'Сессия';

  @override
  String get settingsAppearance => 'Оформление';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeSystem => 'Системная';

  @override
  String get langEn => 'English';

  @override
  String get langRu => 'Русский';

  @override
  String get langUz => 'O\'zbekcha';

  @override
  String get biometricUnlock => 'Вход по биометрии';

  @override
  String get biometricAvailable =>
      'Отпечаток / лицо на экране блокировки (PIN тоже работает)';

  @override
  String get biometricUnavailable => 'Недоступно на этом устройстве';

  @override
  String get lockApp => 'Заблокировать';

  @override
  String get createNewAccount => 'Создать новый аккаунт';

  @override
  String get wipeSubtitle =>
      'Стереть локальные данные и пройти онбординг заново';

  @override
  String get wipeTitle => 'Стереть профиль на устройстве?';

  @override
  String get wipeBody =>
      'Задания, кошелёк, карты и вклады на этом устройстве будут удалены.';

  @override
  String get cancel => 'Отмена';

  @override
  String get wipe => 'Стереть';

  @override
  String get shop => 'Магазин';

  @override
  String get boostStore => 'Магазин бустов';

  @override
  String get lockTitle => 'MOFOBank';

  @override
  String get welcomeBack => 'С возвращением';

  @override
  String hiUser(String name) {
    return 'Привет, $name';
  }

  @override
  String get pinLabel => 'PIN';

  @override
  String get pinHelper => '4-6 цифр';

  @override
  String get unlock => 'Разблокировать';

  @override
  String get useBiometrics => 'Биометрия';

  @override
  String get enableBiometricsHint =>
      'Включите биометрию в Настройках для входа отпечатком / лицом.';

  @override
  String get wrongPin => 'Неверный PIN';

  @override
  String get enterPin => 'Введите PIN (4-6 цифр)';

  @override
  String get bioCancelled => 'Биометрия отменена - введите PIN';

  @override
  String get onboardingBlurb =>
      'Создайте банковский профиль. В следующий раз вход по PIN или биометрии.';

  @override
  String get displayName => 'Отображаемое имя';

  @override
  String get handleLabel => 'Никнейм MOFOBank (@)';

  @override
  String get handleHelper => 'Для P2P-переводов';

  @override
  String get appPin => 'PIN приложения';

  @override
  String get confirmPin => 'Подтвердите PIN';

  @override
  String get confirmPinHelper => 'Повторите те же 4-6 цифр';

  @override
  String get unlockWithBiometrics => 'Вход по биометрии';

  @override
  String get unlockWithBiometricsSub =>
      'Отпечаток или лицо на поддерживаемых телефонах';

  @override
  String get homeMarket => 'Домашний рынок';

  @override
  String get openMyWallet => 'Открыть кошелёк';

  @override
  String get pinMustBe4or6 => 'PIN должен состоять из 4-6 цифр';

  @override
  String get pinMismatch => 'Подтверждение PIN не совпадает';

  @override
  String get missionSettled => 'Задание завершено';

  @override
  String get performance => 'Результат';

  @override
  String get stake => 'Ставка';

  @override
  String get paidToWallet => 'Зачислено';

  @override
  String get xp => 'XP';

  @override
  String get continueBtn => 'Продолжить';

  @override
  String challengeProgress(int current, int total) {
    return 'Вопрос $current / $total';
  }

  @override
  String answeredCount(int count) {
    return 'Отвечено: $count';
  }

  @override
  String get previous => 'Назад';

  @override
  String get next => 'Далее';

  @override
  String hint(int count) {
    return 'Подсказка ($count)';
  }

  @override
  String retry(int count) {
    return 'Повтор ($count)';
  }

  @override
  String get settleMission => 'Закрыть задание';

  @override
  String get missionCompleted => 'Завершено';

  @override
  String get missionCompletedHint =>
      'Задание пройдено. Повтор даёт половину макс. ставки — только деньги, без XP.';

  @override
  String get replayMission => 'Повтор за полставки';

  @override
  String get missionReplaySettled => 'Повтор засчитан';

  @override
  String get missionsReplayAvailable => 'Повтор · полставки';

  @override
  String ledgerMissionReplay(String title, String percent) {
    return '$title повтор ($percent%)';
  }

  @override
  String get walletTitle => 'Кошелёк и RPG';

  @override
  String get balance => 'Баланс';

  @override
  String get balanceSubtitle => 'Деньги на счёте.';

  @override
  String get ledger => 'Транзакции';

  @override
  String get ledgerSubtitle => 'Кредиты · дебеты';

  @override
  String get level => 'Уровень';

  @override
  String get efficiency => 'Эффективность';

  @override
  String efficiencyScore(String score) {
    return 'Эффективность: $score';
  }

  @override
  String get missionsTitle => 'Задания';

  @override
  String get accountsTitle => 'Счета';

  @override
  String get completeOnboarding => 'Завершите онбординг';

  @override
  String errorPrefix(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get tealBadge => 'бейдж';

  @override
  String get allMissionsComplete =>
      'Все задания пройдены - свободные инструменты доступны всегда.';

  @override
  String get quickTools => 'Быстрые инструменты';

  @override
  String get missionCardsTitle => 'Карты и основы денег';

  @override
  String get missionCardsSubtitle =>
      'Как хранятся балансы и как устроена карта';

  @override
  String get missionDepositsTitle => 'Вклады и налог';

  @override
  String get missionDepositsSubtitle =>
      'APY, проценты и удержание налога по странам';

  @override
  String get missionFxTitle => 'FX и валюта';

  @override
  String get missionFxSubtitle =>
      'Курсы валют, конвертация и банковская наценка';

  @override
  String get missionAtmTitle => 'Наличные в банкомате';

  @override
  String get missionAtmSubtitle =>
      'Выдача купюр - крупные, минимум купюр или мелкими';

  @override
  String get missionBudgetingTitle => 'Бюджет и кэшфлоу';

  @override
  String get missionBudgetingSubtitle => 'Категории, доходы, расходы и графики';

  @override
  String get missionTransfersTitle => 'Переводы и IBAN';

  @override
  String get missionTransfersSubtitle => 'P2P и UX валидации';

  @override
  String get missionCreditTitle => 'Кредит vs дебет';

  @override
  String get missionCreditSubtitle => 'Проценты и ловушка минимального платежа';

  @override
  String get missionSecurityTitle => 'Мошенничество и безопасность';

  @override
  String get missionSecuritySubtitle => 'PIN, заморозка и фишинг';

  @override
  String get missionSavingsTitle => 'Цели накоплений';

  @override
  String get missionSavingsSubtitle => 'Копилки и прогресс';

  @override
  String get marketRu => 'Россия';

  @override
  String get marketUs => 'США';

  @override
  String get marketEu => 'Еврозона';

  @override
  String get marketUk => 'Великобритания';

  @override
  String get marketUz => 'Узбекистан';

  @override
  String get marketJp => 'Япония';

  @override
  String get marketTr => 'Турция';

  @override
  String get marketKz => 'Казахстан';

  @override
  String get quiz_cards_0_prompt =>
      'What should a bank app store for a card at rest?';

  @override
  String get quiz_cards_0_opt0 => 'Full PAN + CVV in plaintext';

  @override
  String get quiz_cards_0_opt1 => 'A token / reference - never raw CVV';

  @override
  String get quiz_cards_0_opt2 => 'Only the cardholder selfie';

  @override
  String get quiz_cards_0_opt3 => 'The magnetic stripe image';

  @override
  String get quiz_cards_1_prompt =>
      'Balances in MOFOBank are best stored as...';

  @override
  String get quiz_cards_1_opt0 => 'Floating-point dollars';

  @override
  String get quiz_cards_1_opt1 => 'Integer minor units (cents / kopecks)';

  @override
  String get quiz_cards_1_opt2 => 'Formatted strings like \"\$12.00\"';

  @override
  String get quiz_cards_1_opt3 => 'Blockchain hashes only';

  @override
  String get quiz_cards_2_prompt =>
      'Where does the CVV usually live on a physical card?';

  @override
  String get quiz_cards_2_opt0 => 'Front, next to the chip';

  @override
  String get quiz_cards_2_opt1 => 'Back, near the signature strip';

  @override
  String get quiz_cards_2_opt2 => 'Inside the chip only';

  @override
  String get quiz_cards_2_opt3 => 'Printed on the receipt';

  @override
  String get quiz_cards_3_prompt => 'Why freeze a card in the app?';

  @override
  String get quiz_cards_3_opt0 => 'To earn more interest';

  @override
  String get quiz_cards_3_opt1 => 'To block new spend if lost or stolen';

  @override
  String get quiz_cards_3_opt2 => 'To change your IBAN';

  @override
  String get quiz_cards_3_opt3 => 'To reset FX markup';

  @override
  String get quiz_deposits_0_prompt => 'Gross interest before tax is...';

  @override
  String get quiz_deposits_0_opt0 => 'Principal × APY';

  @override
  String get quiz_deposits_0_opt1 => 'Principal - APY';

  @override
  String get quiz_deposits_0_opt2 => 'Tax × APY';

  @override
  String get quiz_deposits_0_opt3 => 'Always zero';

  @override
  String get quiz_deposits_1_prompt =>
      'Withholding tax on deposit interest means...';

  @override
  String get quiz_deposits_1_opt0 => 'The bank pays you more';

  @override
  String get quiz_deposits_1_opt1 =>
      'Part of interest is taken before you receive it';

  @override
  String get quiz_deposits_1_opt2 => 'Your principal is frozen';

  @override
  String get quiz_deposits_1_opt3 => 'FX rates get cheaper';

  @override
  String get quiz_deposits_2_prompt =>
      'If two countries share the same APY, who nets more interest?';

  @override
  String get quiz_deposits_2_opt0 => 'The higher tax rate';

  @override
  String get quiz_deposits_2_opt1 => 'The lower tax rate';

  @override
  String get quiz_deposits_2_opt2 => 'Always the Eurozone';

  @override
  String get quiz_deposits_2_opt3 => 'It never differs';

  @override
  String get quiz_deposits_3_prompt => 'APY is closest to...';

  @override
  String get quiz_deposits_3_opt0 => 'Annual percentage yield on the deposit';

  @override
  String get quiz_deposits_3_opt1 => 'A one-time ATM fee';

  @override
  String get quiz_deposits_3_opt2 => 'Your credit score';

  @override
  String get quiz_deposits_3_opt3 => 'The card CVV';

  @override
  String get quiz_fx_0_prompt => 'Mid-market FX rate is...';

  @override
  String get quiz_fx_0_opt0 => 'The rate banks usually charge retail clients';

  @override
  String get quiz_fx_0_opt1 => 'A reference rate between buy and sell';

  @override
  String get quiz_fx_0_opt2 => 'Always equal to 1.0';

  @override
  String get quiz_fx_0_opt3 => 'Only used for cash ATMs';

  @override
  String get quiz_fx_1_prompt =>
      'A bank markup / spread means you typically...';

  @override
  String get quiz_fx_1_opt0 => 'Get a better rate than mid-market';

  @override
  String get quiz_fx_1_opt1 => 'Pay worse than mid-market';

  @override
  String get quiz_fx_1_opt2 => 'Avoid all fees forever';

  @override
  String get quiz_fx_1_opt3 => 'Lock tax rates';

  @override
  String get quiz_fx_2_prompt =>
      'Holding foreign currency can change value because...';

  @override
  String get quiz_fx_2_opt0 => 'Exchange rates move over time';

  @override
  String get quiz_fx_2_opt1 => 'PINs expire daily';

  @override
  String get quiz_fx_2_opt2 => 'IBANs reset monthly';

  @override
  String get quiz_fx_2_opt3 => 'Cards cannot freeze';

  @override
  String get quiz_fx_3_prompt =>
      'If the app is offline, a good FX feature should...';

  @override
  String get quiz_fx_3_opt0 => 'Crash immediately';

  @override
  String get quiz_fx_3_opt1 => 'Use a cached or fallback rate and say so';

  @override
  String get quiz_fx_3_opt2 => 'Invent random rates silently';

  @override
  String get quiz_fx_3_opt3 => 'Delete your wallet';

  @override
  String get quiz_atm_0_prompt => 'You cannot withdraw more cash than...';

  @override
  String get quiz_atm_0_opt0 =>
      'Your available wallet balance (and ATM limits)';

  @override
  String get quiz_atm_0_opt1 => 'Yesterday’s FX mid-market';

  @override
  String get quiz_atm_0_opt2 => 'Your credit APR × 12';

  @override
  String get quiz_atm_0_opt3 => 'The number of missions completed';

  @override
  String get quiz_atm_1_prompt => '“Large bills” at an ATM usually means...';

  @override
  String get quiz_atm_1_opt0 => 'Prefer higher-denomination notes';

  @override
  String get quiz_atm_1_opt1 => 'Only coins are dispensed';

  @override
  String get quiz_atm_1_opt2 => 'Always empty the cassette';

  @override
  String get quiz_atm_1_opt3 => 'Ignore your balance';

  @override
  String get quiz_atm_2_prompt =>
      'Why might two ATM dispense options show different note mixes?';

  @override
  String get quiz_atm_2_opt0 =>
      'Different note-picking strategies / machine settings';

  @override
  String get quiz_atm_2_opt1 => 'Because IBANs differ';

  @override
  String get quiz_atm_2_opt2 => 'Because CVV changes';

  @override
  String get quiz_atm_2_opt3 => 'Random wallpaper themes';

  @override
  String get quiz_atm_3_prompt => 'Cash withdrawals typically...';

  @override
  String get quiz_atm_3_opt0 => 'Increase your deposit APY';

  @override
  String get quiz_atm_3_opt1 => 'Reduce the money left in your account';

  @override
  String get quiz_atm_3_opt2 => 'Create foreign tax credits automatically';

  @override
  String get quiz_atm_3_opt3 => 'Unlock phishing links';

  @override
  String get quiz_budgeting_0_prompt => 'Positive cashflow means...';

  @override
  String get quiz_budgeting_0_opt0 => 'Expenses exceed income';

  @override
  String get quiz_budgeting_0_opt1 => 'Income exceeds expenses';

  @override
  String get quiz_budgeting_0_opt2 => 'Balance is exactly zero';

  @override
  String get quiz_budgeting_0_opt3 => 'You only use credit';

  @override
  String get quiz_budgeting_1_prompt => 'Categorizing spend helps you...';

  @override
  String get quiz_budgeting_1_opt0 => 'See where money goes';

  @override
  String get quiz_budgeting_1_opt1 => 'Change the mid-market FX feed';

  @override
  String get quiz_budgeting_1_opt2 => 'Reset your PIN automatically';

  @override
  String get quiz_budgeting_1_opt3 => 'Skip KYC forever';

  @override
  String get quiz_budgeting_2_prompt => 'A budget chart is most useful when...';

  @override
  String get quiz_budgeting_2_opt0 =>
      'You have both income and expense entries';

  @override
  String get quiz_budgeting_2_opt1 => 'You hide all numbers';

  @override
  String get quiz_budgeting_2_opt2 => 'You only track one ATM fee';

  @override
  String get quiz_budgeting_2_opt3 => 'You never save';

  @override
  String get quiz_transfers_0_prompt =>
      'A valid IBAN-like id usually starts with...';

  @override
  String get quiz_transfers_0_opt0 => 'Two letters (country) + check digits';

  @override
  String get quiz_transfers_0_opt1 => 'Only emoji';

  @override
  String get quiz_transfers_0_opt2 => 'Your CVV';

  @override
  String get quiz_transfers_0_opt3 => 'A random GUID with spaces only';

  @override
  String get quiz_transfers_1_prompt =>
      'Before sending a transfer the app should check...';

  @override
  String get quiz_transfers_1_opt0 => 'Format + sufficient funds';

  @override
  String get quiz_transfers_1_opt1 => 'Only the weather';

  @override
  String get quiz_transfers_1_opt2 => 'Only your XP level';

  @override
  String get quiz_transfers_1_opt3 => 'Nothing - send immediately';

  @override
  String get quiz_transfers_2_prompt =>
      'A ledger debit for a transfer should be...';

  @override
  String get quiz_transfers_2_opt0 => 'Negative amount out of your wallet';

  @override
  String get quiz_transfers_2_opt1 => 'Always positive interest';

  @override
  String get quiz_transfers_2_opt2 => 'Stored as a floating string';

  @override
  String get quiz_transfers_2_opt3 => 'Written to the CVV field';

  @override
  String get quiz_transfers_3_prompt => 'Idempotency keys help prevent...';

  @override
  String get quiz_transfers_3_opt0 => 'Double-posting the same transfer';

  @override
  String get quiz_transfers_3_opt1 => 'Emoji flags on Windows';

  @override
  String get quiz_transfers_3_opt2 => 'Card flip animations';

  @override
  String get quiz_transfers_3_opt3 => 'Deposit APY';

  @override
  String get quiz_credit_0_prompt =>
      'Paying only the minimum on a credit balance often...';

  @override
  String get quiz_credit_0_opt0 => 'Maximizes interest paid over time';

  @override
  String get quiz_credit_0_opt1 => 'Deletes the debt instantly';

  @override
  String get quiz_credit_0_opt2 => 'Raises deposit APY';

  @override
  String get quiz_credit_0_opt3 => 'Removes FX markup';

  @override
  String get quiz_credit_1_prompt => 'Debit cards spend...';

  @override
  String get quiz_credit_1_opt0 => 'Your own account money';

  @override
  String get quiz_credit_1_opt1 => 'Only the bank’s money forever';

  @override
  String get quiz_credit_1_opt2 => 'Unrelated IBANs';

  @override
  String get quiz_credit_1_opt3 => 'Cached FX rates';

  @override
  String get quiz_credit_2_prompt => 'APR on credit is closest to...';

  @override
  String get quiz_credit_2_opt0 => 'Annual cost of borrowing';

  @override
  String get quiz_credit_2_opt1 => 'Your card’s CVV';

  @override
  String get quiz_credit_2_opt2 => 'ATM cassette capacity';

  @override
  String get quiz_credit_2_opt3 => 'Mission XP';

  @override
  String get quiz_security_0_prompt =>
      'A good way to store a PIN locally is...';

  @override
  String get quiz_security_0_opt0 => 'Plain text in a screenshot';

  @override
  String get quiz_security_0_opt1 => 'A salted hash - never the raw PIN';

  @override
  String get quiz_security_0_opt2 => 'Inside the card PAN field';

  @override
  String get quiz_security_0_opt3 => 'In the FX cache table';

  @override
  String get quiz_security_1_prompt =>
      'A phishing SMS with a lookalike domain should be...';

  @override
  String get quiz_security_1_opt0 => 'Opened immediately';

  @override
  String get quiz_security_1_opt1 => 'Ignored / reported - do not tap';

  @override
  String get quiz_security_1_opt2 => 'Forwarded with your CVV';

  @override
  String get quiz_security_1_opt3 => 'Used to reset APY';

  @override
  String get quiz_security_2_prompt => 'Freezing a card is useful when...';

  @override
  String get quiz_security_2_opt0 => 'You suspect loss or theft';

  @override
  String get quiz_security_2_opt1 => 'You want higher interest';

  @override
  String get quiz_security_2_opt2 => 'You change home markets';

  @override
  String get quiz_security_2_opt3 => 'You complete a budget pie chart';

  @override
  String get quiz_security_3_prompt => 'MOFOBank never asks you for...';

  @override
  String get quiz_security_3_opt0 => 'Real bank credentials / KYC documents';

  @override
  String get quiz_security_3_opt1 => 'A display name';

  @override
  String get quiz_security_3_opt2 => 'A home market';

  @override
  String get quiz_security_3_opt3 => 'Quiz answers';

  @override
  String get quiz_savings_0_prompt => 'Funding a savings pot typically...';

  @override
  String get quiz_savings_0_opt0 =>
      'Moves money from your wallet into the goal';

  @override
  String get quiz_savings_0_opt1 => 'Prints cash at the ATM';

  @override
  String get quiz_savings_0_opt2 => 'Increases FX markup';

  @override
  String get quiz_savings_0_opt3 => 'Unlocks phishing links';

  @override
  String get quiz_savings_1_prompt => 'A progress ring on a goal shows...';

  @override
  String get quiz_savings_1_opt0 => 'Saved amount vs target';

  @override
  String get quiz_savings_1_opt1 => 'Your CVV';

  @override
  String get quiz_savings_1_opt2 => 'Live mid-market only';

  @override
  String get quiz_savings_1_opt3 => 'Credit APR';

  @override
  String get quiz_savings_2_prompt =>
      'Why separate goal pots from spending money?';

  @override
  String get quiz_savings_2_opt0 =>
      'Makes intentions visible and harder to overspend casually';

  @override
  String get quiz_savings_2_opt1 => 'Deletes the ledger';

  @override
  String get quiz_savings_2_opt2 => 'Removes tax forever';

  @override
  String get quiz_savings_2_opt3 => 'Disables transfers';

  @override
  String get lockTooltip => 'Заблокировать';

  @override
  String get learnerDefault => 'Ученик';

  @override
  String marketTaxSummary(String code, String rate) {
    return '$code · НДС ~$rate%';
  }

  @override
  String get continueLearning => 'Продолжить обучение';

  @override
  String get continueLearningSubtitle =>
      'Задания открываются по порядку; песочницы остаются доступны.';

  @override
  String get card => 'Карта';

  @override
  String get fx => 'Валюта';

  @override
  String get atm => 'Банкомат';

  @override
  String get transfer => 'Перевод';

  @override
  String get boosts => 'Бусты';

  @override
  String get wipeAndCreate => 'Стереть и создать';

  @override
  String get yourPots => 'Ваши счета';

  @override
  String get yourPotsSubtitle => 'Кошелёк, карты и вклады на этом устройстве.';

  @override
  String get cards => 'Карты';

  @override
  String get cardLabel => 'Название карты';

  @override
  String get virtualDebit => 'Виртуальная дебетовая';

  @override
  String get issueNewCard => 'Выпустить карту';

  @override
  String get deposits => 'Вклады';

  @override
  String get openDeposit => 'Открыть вклад';

  @override
  String get transferMoney => 'Перевести деньги';

  @override
  String get create => 'Создать';

  @override
  String get couldNotLoadCard => 'Не удалось загрузить данные карты';

  @override
  String get cardNotFound => 'Карта не найдена';

  @override
  String get loadingCardDetails => 'Загрузка данных карты...';

  @override
  String get cardFrozen => 'Карта заморожена';

  @override
  String get tapCardToFlip => 'Нажмите на карту, чтобы перевернуть';

  @override
  String get unfreezeCard => 'Разморозить карту';

  @override
  String get freezeCard => 'Заморозить карту';

  @override
  String get yourCard => 'Ваша карта';

  @override
  String get yourCardSubtitle => 'Переверните карту. Данные скрыты до показа.';

  @override
  String get pickDepositProduct =>
      'Выберите продукт · ежемесячная или ежедневная ставка';

  @override
  String get depositProducts => 'Вкладные продукты';

  @override
  String get fundFrom => 'Списать со счёта';

  @override
  String get principalMajor => 'Сумма вклада';

  @override
  String get pickMofoUser => 'Выберите пользователя MOFOBank';

  @override
  String get pickDestination => 'Выберите получателя';

  @override
  String get transferSubtitle =>
      'Переводите между своими счетами или пользователю MOFOBank';

  @override
  String get sendTransfer => 'Отправить перевод';

  @override
  String get from => 'Откуда';

  @override
  String get sourceAccount => 'Счёт списания';

  @override
  String get toMofoUser => 'Пользователю MOFOBank';

  @override
  String get betweenMyAccounts => 'Между моими счетами';

  @override
  String get recipient => 'Получатель';

  @override
  String get destination => 'Счёт назначения';

  @override
  String get amountMajor => 'Сумма';

  @override
  String get budgeting => 'Бюджет';

  @override
  String incomeExpenses(String income, String expenses) {
    return 'Доходы $income · Расходы $expenses';
  }

  @override
  String get cashflow => 'Денежный поток';

  @override
  String get cashflowSubtitle =>
      'Добавьте категории - стремитесь к доходам выше расходов.';

  @override
  String get inLabel => 'Вход';

  @override
  String get outLabel => 'Выход';

  @override
  String get category => 'Категория';

  @override
  String amountCurrencyMajor(String code) {
    return 'Сумма ($code)';
  }

  @override
  String get income => 'Доход';

  @override
  String get expense => 'Расход';

  @override
  String get addItem => 'Добавить';

  @override
  String get loading => 'Загрузка...';

  @override
  String get hideDetails => 'Скрыть данные';

  @override
  String get showCardNumber => 'Показать номер карты';

  @override
  String get frozen => 'ЗАМОРОЖЕНА';

  @override
  String get cvvWarning => 'Никому не сообщайте CVV.';

  @override
  String get openAccountsFirst => 'Сначала выпустите карту в разделе «Счета»';

  @override
  String get loadingYourCard => 'Загрузка карты...';

  @override
  String get exploreCardChallenge => 'Изучите карту и завершите задание';

  @override
  String get yourDebitCard => 'Ваша дебетовая карта';

  @override
  String get yourDebitCardSubtitle =>
      'Баланс хранится в целых минимальных единицах. Нажмите, чтобы перевернуть.';

  @override
  String get credit => 'Кредит';

  @override
  String interestPaid(String amount) {
    return 'Уплачено процентов: $amount';
  }

  @override
  String get minimumPaymentTrap => 'Ловушка минимального платежа';

  @override
  String get minimumPaymentTrapSubtitle =>
      'Дебет тратит ваши деньги, кредит - заёмные с процентами.';

  @override
  String creditStartSummary(String amount) {
    return 'Начало: $amount под 22% годовых, минимум ~2%/мес.';
  }

  @override
  String paidOffMonths(int count) {
    return 'Погашено за $count мес.';
  }

  @override
  String stillOpenMonths(int count) {
    return 'Долг остался через $count мес.';
  }

  @override
  String get depositsAndTax => 'Вклады и налог';

  @override
  String get compareTaxDrag => 'Сравните налоги и завершите задание';

  @override
  String get marketPickedQuiz => 'Рынок выбран · ответьте на все вопросы';

  @override
  String get lodgementSandbox => 'Песочница вкладов';

  @override
  String get lodgementSandboxSubtitle =>
      'Одинаковые сумма и APY; отличается только налог.';

  @override
  String principalApy(String amount, String apy) {
    return 'Сумма: $amount под $apy% APY';
  }

  @override
  String homeNetTax(String net, String tax) {
    return 'Чистый доход дома: $net (налог $tax)';
  }

  @override
  String get lowestTaxDrag => 'Минимальный налог';

  @override
  String get lowestTaxDragSubtitle => 'Где чистый процентный доход выше?';

  @override
  String get couldNotLoadRate => 'Не удалось загрузить курс';

  @override
  String fxSpreadDescription(String pair) {
    return 'Маржа конвертации ($pair)';
  }

  @override
  String get updatingRate => 'Обновление курса...';

  @override
  String get cachedRate => 'Кэшированный курс';

  @override
  String get liveRate => 'Текущий курс';

  @override
  String get exchange => 'Обмен';

  @override
  String get exchangeSubtitle =>
      'Конвертация валют с небольшой банковской маржой.';

  @override
  String amountCurrency(String code) {
    return 'Сумма ($code)';
  }

  @override
  String get convertTo => 'Конвертировать в';

  @override
  String get cashDispensed => 'Наличные выданы - завершите задание';

  @override
  String availableAmount(String amount) {
    return 'Доступно $amount';
  }

  @override
  String get dispense => 'Выдать';

  @override
  String get settle => 'Завершить';

  @override
  String get withdrawCash => 'Снять наличные';

  @override
  String get withdrawCashSubtitle => 'Выберите сумму и способ подбора купюр.';

  @override
  String notesInCassette(String notes, String code) {
    return 'Купюры в кассете: $notes $code';
  }

  @override
  String multiplesMax(int step, int max) {
    return 'Кратно $step, максимум $max';
  }

  @override
  String get largeBills => 'Крупные купюры';

  @override
  String get largeBillsSubtitle => 'Сначала самые крупные номиналы';

  @override
  String get fewestNotes => 'Минимум купюр';

  @override
  String get fewestNotesSubtitle => 'Оптимальный набор кассеты';

  @override
  String get smallerNotes => 'Мелкие купюры';

  @override
  String get smallerNotesSubtitle => 'Удобно для последующих покупок';

  @override
  String noteCountBreakdown(int count, String breakdown) {
    return '$count купюр - $breakdown';
  }

  @override
  String get cannotMakeAmount => 'Эту сумму нельзя выдать выбранным способом';

  @override
  String get security => 'Безопасность';

  @override
  String get securityInitialStatus =>
      'Задайте PIN, проверьте его и заморозьте карту';

  @override
  String get pinAndFreeze => 'PIN и заморозка';

  @override
  String get pinAndFreezeSubtitle =>
      'PIN хранится как хеш. Заморозка - локальный флаг карты.';

  @override
  String get pinSaved => 'PIN сохранён (хеш)';

  @override
  String get savePin => 'Сохранить PIN';

  @override
  String get verifyPin => 'Проверить PIN';

  @override
  String get pinVerified => 'PIN подтверждён';

  @override
  String get cardUnfrozen => 'Карта разморожена';

  @override
  String get transfers => 'Переводы';

  @override
  String get p2pTransfer => 'P2P-перевод';

  @override
  String get transferPosted => 'Перевод записан в леджер';

  @override
  String get validateThenSend => 'Проверьте IBAN и сумму, затем отправьте';

  @override
  String get send => 'Отправить';

  @override
  String get simulatedP2p => 'Учебный P2P';

  @override
  String get simulatedP2pSubtitle => 'Проверка IBAN и списание в леджере.';

  @override
  String get beneficiaryIban => 'IBAN получателя';

  @override
  String get inventory => 'Инвентарь';

  @override
  String get inventorySubtitle =>
      'Бусты необязательны. Основные уроки бесплатны.';

  @override
  String inventorySummary(int hints, int retries, String badge) {
    return 'Подсказки: $hints · Повторы: $retries · Значок: $badge';
  }

  @override
  String get on => 'вкл.';

  @override
  String get off => 'выкл.';

  @override
  String get buy => 'Купить';

  @override
  String get owned => 'Куплено';

  @override
  String purchased(String title) {
    return 'Куплено: $title';
  }

  @override
  String countryFlag(String code) {
    return 'Флаг: $code';
  }

  @override
  String get confirmIdentity => 'Подтвердите личность';

  @override
  String get devicePinHelper => '4-6 цифр';

  @override
  String get savings => 'Накопления';

  @override
  String get savingsGoals => 'Цели накоплений';

  @override
  String get savingsGoalsSubtitle =>
      'Пополняйте из кошелька и следите за прогрессом.';

  @override
  String get goalName => 'Название цели';

  @override
  String targetCurrencyMajor(String code) {
    return 'Цель ($code)';
  }

  @override
  String get createGoal => 'Создать цель';

  @override
  String fundAmount(String amount) {
    return 'Пополнить на $amount';
  }

  @override
  String get setPinLabel => 'Задайте PIN из 4-6 цифр';

  @override
  String get verify => 'Проверить';

  @override
  String get freezePrimaryCard => 'Заморозить основную карту';

  @override
  String get goalFunded => 'Цель пополнена из кошелька';

  @override
  String get createThenFund => 'Создайте копилку и пополните её';

  @override
  String get goalPots => 'Копилки';

  @override
  String get emergencyPot => 'Резерв';

  @override
  String fundGoalDescription(String title) {
    return 'Пополнение цели: $title';
  }

  @override
  String atmCashDescription(String pack, String notes) {
    return 'Наличные в банкомате: $pack · $notes';
  }

  @override
  String get showingCachedRate => 'Показан последний известный курс';

  @override
  String get showingEstimatedRate => 'Оценочный курс - сохранённого нет';

  @override
  String get ratesReady => 'Курсы готовы';

  @override
  String get includesBankSpread => 'С учётом банковской маржи';

  @override
  String youReceive(String amount) {
    return 'Вы получите ≈ $amount';
  }

  @override
  String walletAmount(String amount) {
    return 'Кошелёк: $amount';
  }

  @override
  String get cvvLabel => 'CVV';

  @override
  String get boostHintTitle => 'Пакет подсказок';

  @override
  String get boostHintDescription =>
      'Один раз подсвечивает правильный ответ (3 подсказки).';

  @override
  String get boostRetryTitle => 'Повтор квиза';

  @override
  String get boostRetryDescription =>
      'Сбрасывает ответы текущего квиза (1 использование).';

  @override
  String get boostBadgeTitle => 'Teal-бейдж';

  @override
  String get boostBadgeDescription => 'Косметический бейдж на главной.';

  @override
  String get depositFlexTitle => 'Flex Daily';

  @override
  String get depositFlexSubtitle => 'Гибкий вклад · проценты каждый день';

  @override
  String get depositSaverTitle => 'Saver Daily';

  @override
  String get depositSaverSubtitle => 'Выше дневная ставка · всё ещё ликвидный';

  @override
  String get depositTermTitle => 'Term Monthly';

  @override
  String get depositTermSubtitle =>
      'Классический срочный · выплата раз в месяц';

  @override
  String get depositPremiumTitle => 'Premium Monthly';

  @override
  String get depositPremiumSubtitle => 'Лучшая месячная ставка · учебный демо';

  @override
  String ratePerDay(String pct) {
    return '$pct% / день';
  }

  @override
  String ratePerMonth(String pct) {
    return '$pct% / месяц';
  }

  @override
  String errorGeneric(String error) {
    return 'Что-то пошло не так: $error';
  }

  @override
  String get ledgerWelcome => 'Приветственный баланс';

  @override
  String get ledgerDepositOpened => 'Вклад открыт';

  @override
  String ledgerOpenDeposit(String title) {
    return 'Открытие вклада: $title';
  }

  @override
  String ledgerAccrued(String title) {
    return 'Начислено: $title';
  }

  @override
  String ledgerLevelStipend(String level) {
    return 'Стипендия за уровень $level';
  }

  @override
  String ledgerBoost(String title) {
    return 'Буст: $title';
  }

  @override
  String get ledgerTransferOut => 'Исходящий перевод';

  @override
  String get ledgerTransferIn => 'Входящий перевод';

  @override
  String ledgerP2pTo(String handle) {
    return 'P2P для @$handle';
  }

  @override
  String ledgerMissionSettle(String title, String percent) {
    return 'Итог «$title» ($percent%)';
  }

  @override
  String ledgerFxSpread(String pair) {
    return 'Маржа FX ($pair)';
  }

  @override
  String ledgerAtmCash(String pack, String notes) {
    return 'Банкомат $pack · $notes';
  }

  @override
  String ledgerGoalFund(String title) {
    return 'Пополнение цели: $title';
  }

  @override
  String get ledgerTypeStipend => 'Стипендия';

  @override
  String get ledgerTypeMission => 'Задание';

  @override
  String get ledgerTypeTransferOut => 'Исходящий';

  @override
  String get ledgerTypeTransferIn => 'Входящий';

  @override
  String get ledgerTypeFx => 'Валюта';

  @override
  String get ledgerTypeAtm => 'Банкомат';

  @override
  String get ledgerTypeBoost => 'Буст';

  @override
  String get ledgerTypeGoal => 'Цель';

  @override
  String get ledgerTypeDepositInterest => 'Проценты по вкладу';

  @override
  String get ledgerTypeCreditCharge => 'Кредитное списание';

  @override
  String get ledgerTypeCreditPayment => 'Платёж по кредиту';

  @override
  String get ledgerTypeOther => 'Прочее';

  @override
  String get accountMainWallet => 'Основной кошелёк';

  @override
  String get cardDebitPrimary => 'Дебет · Основная';

  @override
  String get errorNotOnboarded => 'Сначала завершите онбординг';

  @override
  String get errorPrincipalPositive => 'Сумма вклада должна быть положительной';

  @override
  String get errorAmountPositive => 'Сумма должна быть положительной';

  @override
  String get errorInsufficientFunds => 'Недостаточно средств';

  @override
  String get errorInsufficientFundsBoost =>
      'Недостаточно средств для этого буста';

  @override
  String get errorChooseDifferentAccounts => 'Выберите разные счета';

  @override
  String get errorCrossCurrency =>
      'Перевод между валютами в демо не поддерживается';

  @override
  String get errorSourceCardFrozen => 'Карта списания заморожена';

  @override
  String errorUserNotFound(String handle) {
    return 'Пользователь MOFOBank @$handle не найден';
  }

  @override
  String get errorCardTokenNotFound => 'Данные карты не найдены в хранилище';

  @override
  String get errorInvalidDepositProduct => 'Неизвестный вклад';

  @override
  String get errorInvalidAccountNameKey => 'Неизвестный ключ названия счёта';

  @override
  String get errorInvalidLedgerType => 'Неизвестный тип записи леджера';

  @override
  String get errorInvalidLedgerDescription =>
      'Неизвестный ключ описания леджера';

  @override
  String get errorInvalidAtmPack => 'Неизвестный набор купюр';

  @override
  String get errorCurrencyMismatch => 'Валюты не совпадают';

  @override
  String get errorUnknown => 'Что-то пошло не так';
}
