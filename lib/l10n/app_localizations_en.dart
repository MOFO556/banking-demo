// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'MOFOBank';

  @override
  String get navHome => 'Home';

  @override
  String get navMissions => 'Missions';

  @override
  String get navAccounts => 'Accounts';

  @override
  String get navWallet => 'Wallet';

  @override
  String get settings => 'Settings';

  @override
  String get settingsSession => 'Session';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';

  @override
  String get themeSystem => 'System';

  @override
  String get langEn => 'English';

  @override
  String get langRu => 'Русский';

  @override
  String get langUz => 'O\'zbekcha';

  @override
  String get biometricUnlock => 'Biometric unlock';

  @override
  String get biometricAvailable =>
      'Fingerprint / face on lock screen (PIN still works)';

  @override
  String get biometricUnavailable => 'Not available on this device';

  @override
  String get lockApp => 'Lock app';

  @override
  String get createNewAccount => 'Create new account';

  @override
  String get wipeSubtitle => 'Wipe local data and re-onboard';

  @override
  String get wipeTitle => 'Wipe this device profile?';

  @override
  String get wipeBody =>
      'Missions, wallet, cards, and deposits on this device will be deleted.';

  @override
  String get cancel => 'Cancel';

  @override
  String get wipe => 'Wipe';

  @override
  String get shop => 'Shop';

  @override
  String get boostStore => 'Boost store';

  @override
  String get lockTitle => 'MOFOBank';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String hiUser(String name) {
    return 'Hi, $name';
  }

  @override
  String get pinLabel => 'PIN';

  @override
  String get pinHelper => '4-6 digits';

  @override
  String get unlock => 'Unlock';

  @override
  String get useBiometrics => 'Use biometrics';

  @override
  String get enableBiometricsHint =>
      'Turn on biometrics in Settings for fingerprint / face unlock.';

  @override
  String get wrongPin => 'Wrong PIN';

  @override
  String get enterPin => 'Enter your PIN (4-6 digits)';

  @override
  String get bioCancelled => 'Biometrics cancelled - enter PIN';

  @override
  String get onboardingBlurb =>
      'Create your bank profile. Unlock next time with your PIN or biometrics.';

  @override
  String get displayName => 'Display name';

  @override
  String get handleLabel => 'MOFOBank handle (@)';

  @override
  String get handleHelper => 'Used for P2P transfers';

  @override
  String get appPin => 'App PIN';

  @override
  String get confirmPin => 'Confirm PIN';

  @override
  String get confirmPinHelper => 'Re-enter the same 4-6 digits';

  @override
  String get unlockWithBiometrics => 'Unlock with biometrics';

  @override
  String get unlockWithBiometricsSub =>
      'Fingerprint or face on supported phones';

  @override
  String get homeMarket => 'Home market';

  @override
  String get openMyWallet => 'Open my wallet';

  @override
  String get pinMustBe4or6 => 'PIN must be 4-6 digits';

  @override
  String get pinMismatch => 'PIN confirmation does not match';

  @override
  String get missionSettled => 'Mission settled';

  @override
  String get performance => 'Performance';

  @override
  String get stake => 'Stake';

  @override
  String get paidToWallet => 'Paid to wallet';

  @override
  String get xp => 'XP';

  @override
  String get continueBtn => 'Continue';

  @override
  String challengeProgress(int current, int total) {
    return 'Challenge $current / $total';
  }

  @override
  String answeredCount(int count) {
    return '$count answered';
  }

  @override
  String get previous => 'Previous';

  @override
  String get next => 'Next';

  @override
  String hint(int count) {
    return 'Hint ($count)';
  }

  @override
  String retry(int count) {
    return 'Retry ($count)';
  }

  @override
  String get settleMission => 'Settle mission stake';

  @override
  String get missionCompleted => 'Completed';

  @override
  String get missionCompletedHint =>
      'Mission completed. Replay pays half the max stake — money only, no XP.';

  @override
  String get replayMission => 'Replay for half stake';

  @override
  String get missionReplaySettled => 'Replay settled';

  @override
  String get missionsReplayAvailable => 'Replay · half stake';

  @override
  String ledgerMissionReplay(String title, String percent) {
    return '$title replay ($percent%)';
  }

  @override
  String get walletTitle => 'Wallet & RPG';

  @override
  String get balance => 'Balance';

  @override
  String get balanceSubtitle => 'Play money on a ledger.';

  @override
  String get ledger => 'Ledger';

  @override
  String get ledgerSubtitle => 'Credits in · debits out';

  @override
  String get level => 'Level';

  @override
  String get efficiency => 'Efficiency';

  @override
  String efficiencyScore(String score) {
    return 'Efficiency score: $score';
  }

  @override
  String get missionsTitle => 'Missions';

  @override
  String get accountsTitle => 'Accounts';

  @override
  String get completeOnboarding => 'Complete onboarding';

  @override
  String errorPrefix(String error) {
    return 'Error: $error';
  }

  @override
  String get tealBadge => 'badge';

  @override
  String get allMissionsComplete =>
      'All missions complete - explore free-roam tools anytime.';

  @override
  String get quickTools => 'Quick tools';

  @override
  String get missionCardsTitle => 'Cards & money basics';

  @override
  String get missionCardsSubtitle =>
      'How balances live, and how a bank card works front & back';

  @override
  String get missionDepositsTitle => 'Deposits & tax';

  @override
  String get missionDepositsSubtitle =>
      'APY, interest, and how countries withhold tax';

  @override
  String get missionFxTitle => 'FX & foreign holdings';

  @override
  String get missionFxSubtitle => 'Live rates, conversion, and bank markup';

  @override
  String get missionAtmTitle => 'ATM cash';

  @override
  String get missionAtmSubtitle =>
      'Withdraw real notes - large bills, fewest notes, or change';

  @override
  String get missionBudgetingTitle => 'Budgeting & cashflow';

  @override
  String get missionBudgetingSubtitle =>
      'Categories, income, expenses, and charts';

  @override
  String get missionTransfersTitle => 'Transfers & IBAN';

  @override
  String get missionTransfersSubtitle => 'Simulated P2P and validation UX';

  @override
  String get missionCreditTitle => 'Credit vs debit';

  @override
  String get missionCreditSubtitle => 'Interest and the minimum-payment trap';

  @override
  String get missionSecurityTitle => 'Fraud & security';

  @override
  String get missionSecuritySubtitle => 'PIN, freeze, and phishing hygiene';

  @override
  String get missionSavingsTitle => 'Savings goals';

  @override
  String get missionSavingsSubtitle => 'Goal pots and progress rings';

  @override
  String get marketRu => 'Russia';

  @override
  String get marketUs => 'United States';

  @override
  String get marketEu => 'Eurozone';

  @override
  String get marketUk => 'United Kingdom';

  @override
  String get marketUz => 'Uzbekistan';

  @override
  String get marketJp => 'Japan';

  @override
  String get marketTr => 'Türkiye';

  @override
  String get marketKz => 'Kazakhstan';

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
  String get lockTooltip => 'Lock';

  @override
  String get learnerDefault => 'Learner';

  @override
  String marketTaxSummary(String code, String rate) {
    return '$code · interest tax ~$rate%';
  }

  @override
  String get continueLearning => 'Continue learning';

  @override
  String get continueLearningSubtitle =>
      'Missions unlock in order; sandboxes stay open after intro.';

  @override
  String get card => 'Card';

  @override
  String get fx => 'FX';

  @override
  String get atm => 'ATM';

  @override
  String get transfer => 'Transfer';

  @override
  String get boosts => 'Boosts';

  @override
  String get wipeAndCreate => 'Wipe & create';

  @override
  String get yourPots => 'Your pots';

  @override
  String get yourPotsSubtitle => 'Wallet, cards, and deposits on this device.';

  @override
  String get cards => 'Cards';

  @override
  String get cardLabel => 'Card label';

  @override
  String get virtualDebit => 'Virtual Debit';

  @override
  String get issueNewCard => 'Issue new card';

  @override
  String get deposits => 'Deposits';

  @override
  String get openDeposit => 'Open deposit';

  @override
  String get transferMoney => 'Transfer money';

  @override
  String get create => 'Create';

  @override
  String get couldNotLoadCard => 'Could not load card details';

  @override
  String get cardNotFound => 'Card not found';

  @override
  String get loadingCardDetails => 'Loading card details...';

  @override
  String get cardFrozen => 'Card is frozen';

  @override
  String get tapCardToFlip => 'Tap card to flip';

  @override
  String get unfreezeCard => 'Unfreeze card';

  @override
  String get freezeCard => 'Freeze card';

  @override
  String get yourCard => 'Your card';

  @override
  String get yourCardSubtitle =>
      'Flip to see the back. Details stay private until shown.';

  @override
  String get pickDepositProduct =>
      'Pick a product · 1 monthly + 2-3 daily rate styles';

  @override
  String get depositProducts => 'Deposit products';

  @override
  String get fundFrom => 'Fund from';

  @override
  String get principalMajor => 'Principal (major)';

  @override
  String get pickMofoUser => 'Pick a MOFOBank user';

  @override
  String get pickDestination => 'Pick a destination';

  @override
  String get transferSubtitle =>
      'Move money between your pots or to another MOFOBank user';

  @override
  String get sendTransfer => 'Send transfer';

  @override
  String get from => 'From';

  @override
  String get sourceAccount => 'Source account';

  @override
  String get toMofoUser => 'To MOFOBank user';

  @override
  String get betweenMyAccounts => 'Between my accounts';

  @override
  String get recipient => 'Recipient';

  @override
  String get destination => 'Destination';

  @override
  String get amountMajor => 'Amount (major)';

  @override
  String get budgeting => 'Budgeting';

  @override
  String incomeExpenses(String income, String expenses) {
    return 'Income $income · Expenses $expenses';
  }

  @override
  String get cashflow => 'Cashflow';

  @override
  String get cashflowSubtitle => 'Add categories - aim for income > expenses.';

  @override
  String get inLabel => 'In';

  @override
  String get outLabel => 'Out';

  @override
  String get category => 'Category';

  @override
  String amountCurrencyMajor(String code) {
    return 'Amount ($code major)';
  }

  @override
  String get income => 'Income';

  @override
  String get expense => 'Expense';

  @override
  String get addItem => 'Add item';

  @override
  String get loading => 'Loading...';

  @override
  String get hideDetails => 'Hide details';

  @override
  String get showCardNumber => 'Show card number';

  @override
  String get frozen => 'FROZEN';

  @override
  String get cvvWarning => 'CVV - never share it.';

  @override
  String get openAccountsFirst => 'Open Accounts to issue a card first';

  @override
  String get loadingYourCard => 'Loading your card...';

  @override
  String get exploreCardChallenge =>
      'Explore the card, then finish the challenge';

  @override
  String get yourDebitCard => 'Your debit card';

  @override
  String get yourDebitCardSubtitle =>
      'Balances live as integer minor units. Tap the card to flip.';

  @override
  String get credit => 'Credit';

  @override
  String interestPaid(String amount) {
    return 'Interest paid: $amount';
  }

  @override
  String get minimumPaymentTrap => 'Minimum-payment trap';

  @override
  String get minimumPaymentTrapSubtitle =>
      'Debit spends yours. Credit borrows - interest accrues.';

  @override
  String creditStartSummary(String amount) {
    return 'Start $amount @ 22% APR, ~2%/mo minimum';
  }

  @override
  String paidOffMonths(int count) {
    return 'Paid off in $count months';
  }

  @override
  String stillOpenMonths(int count) {
    return 'Still open after $count months';
  }

  @override
  String get depositsAndTax => 'Deposits & tax';

  @override
  String get compareTaxDrag => 'Compare tax drag, then finish the challenge';

  @override
  String get marketPickedQuiz => 'Market picked · answer every quiz question';

  @override
  String get lodgementSandbox => 'Lodgement sandbox';

  @override
  String get lodgementSandboxSubtitle =>
      'Same principal & APY; only withholding tax differs by country.';

  @override
  String principalApy(String amount, String apy) {
    return 'Principal: $amount @ $apy% APY';
  }

  @override
  String homeNetTax(String net, String tax) {
    return 'Home net $net (tax $tax)';
  }

  @override
  String get lowestTaxDrag => 'Lowest tax drag';

  @override
  String get lowestTaxDragSubtitle =>
      'Which market leaves the highest net interest?';

  @override
  String get couldNotLoadRate => 'Could not load exchange rate';

  @override
  String fxSpreadDescription(String pair) {
    return 'FX conversion spread ($pair)';
  }

  @override
  String get updatingRate => 'Updating exchange rate...';

  @override
  String get cachedRate => 'Cached rate';

  @override
  String get liveRate => 'Live rate';

  @override
  String get exchange => 'Exchange';

  @override
  String get exchangeSubtitle =>
      'Convert between currencies. The bank rate includes a small spread.';

  @override
  String amountCurrency(String code) {
    return 'Amount ($code)';
  }

  @override
  String get convertTo => 'Convert to';

  @override
  String get cashDispensed => 'Cash dispensed - finish the challenge to settle';

  @override
  String availableAmount(String amount) {
    return 'Available $amount';
  }

  @override
  String get dispense => 'Dispense';

  @override
  String get settle => 'Settle';

  @override
  String get withdrawCash => 'Withdraw cash';

  @override
  String get withdrawCashSubtitle =>
      'Pick an amount from your wallet. The ATM offers different note packs - large bills, fewest notes, or smaller notes for change.';

  @override
  String notesInCassette(String notes, String code) {
    return 'Notes in cassette: $notes $code';
  }

  @override
  String multiplesMax(int step, int max) {
    return 'Multiples of $step - max $max';
  }

  @override
  String get largeBills => 'Large bills';

  @override
  String get largeBillsSubtitle => 'Fast pick - highest denominations first';

  @override
  String get fewestNotes => 'Fewest notes';

  @override
  String get fewestNotesSubtitle =>
      'Optimal cassette mix (may take longer to compute)';

  @override
  String get smallerNotes => 'Smaller notes';

  @override
  String get smallerNotesSubtitle => 'Useful when you want change for spending';

  @override
  String noteCountBreakdown(int count, String breakdown) {
    return '$count notes - $breakdown';
  }

  @override
  String get cannotMakeAmount => 'Cannot make this amount with this pack';

  @override
  String get security => 'Security';

  @override
  String get securityInitialStatus => 'Set a PIN, verify it, try freeze';

  @override
  String get pinAndFreeze => 'PIN & freeze';

  @override
  String get pinAndFreezeSubtitle =>
      'PIN is hashed locally. Freeze is a local card flag.';

  @override
  String get pinSaved => 'PIN saved (hashed)';

  @override
  String get savePin => 'Save PIN';

  @override
  String get verifyPin => 'Verify PIN';

  @override
  String get pinVerified => 'PIN verified';

  @override
  String get cardUnfrozen => 'Card unfrozen';

  @override
  String get transfers => 'Transfers';

  @override
  String get p2pTransfer => 'P2P transfer';

  @override
  String get transferPosted => 'Transfer posted to ledger';

  @override
  String get validateThenSend => 'Validate IBAN + amount, then send';

  @override
  String get send => 'Send';

  @override
  String get simulatedP2p => 'Simulated P2P';

  @override
  String get simulatedP2pSubtitle => 'IBAN-like validation + ledger debit.';

  @override
  String get beneficiaryIban => 'Beneficiary IBAN';

  @override
  String get inventory => 'Inventory';

  @override
  String get inventorySubtitle =>
      'Boosts are optional. Core lessons stay free.';

  @override
  String inventorySummary(int hints, int retries, String badge) {
    return 'Hints: $hints · Retries: $retries · Badge: $badge';
  }

  @override
  String get on => 'on';

  @override
  String get off => 'off';

  @override
  String get buy => 'Buy';

  @override
  String get owned => 'Owned';

  @override
  String purchased(String title) {
    return 'Purchased $title';
  }

  @override
  String countryFlag(String code) {
    return '$code flag';
  }

  @override
  String get confirmIdentity => 'Confirm it\'s you';

  @override
  String get devicePinHelper => '4-6 digits';

  @override
  String get savings => 'Savings';

  @override
  String get savingsGoals => 'Savings goals';

  @override
  String get savingsGoalsSubtitle => 'Fund from wallet - progress rings.';

  @override
  String get goalName => 'Goal name';

  @override
  String targetCurrencyMajor(String code) {
    return 'Target ($code major)';
  }

  @override
  String get createGoal => 'Create goal';

  @override
  String fundAmount(String amount) {
    return 'Fund +$amount';
  }

  @override
  String get setPinLabel => 'Set 4-6-digit PIN';

  @override
  String get verify => 'Verify';

  @override
  String get freezePrimaryCard => 'Freeze primary card';

  @override
  String get goalFunded => 'Goal funded from wallet';

  @override
  String get createThenFund => 'Create a pot, then fund it';

  @override
  String get goalPots => 'Goal pots';

  @override
  String get emergencyPot => 'Emergency pot';

  @override
  String fundGoalDescription(String title) {
    return 'Fund goal: $title';
  }

  @override
  String atmCashDescription(String pack, String notes) {
    return 'ATM cash $pack · $notes';
  }

  @override
  String get showingCachedRate => 'Showing last known rate';

  @override
  String get showingEstimatedRate => 'Estimated rate - nothing saved yet';

  @override
  String get ratesReady => 'Rates ready';

  @override
  String get includesBankSpread => 'Includes bank spread';

  @override
  String youReceive(String amount) {
    return 'You receive ≈ $amount';
  }

  @override
  String walletAmount(String amount) {
    return 'Wallet: $amount';
  }

  @override
  String get cvvLabel => 'CVV';

  @override
  String get boostHintTitle => 'Hint pack';

  @override
  String get boostHintDescription =>
      'Highlights the correct quiz answer once (3 hints).';

  @override
  String get boostRetryTitle => 'Quiz retry';

  @override
  String get boostRetryDescription =>
      'Clears your current quiz answers to try again (1 use).';

  @override
  String get boostBadgeTitle => 'Teal badge';

  @override
  String get boostBadgeDescription => 'Cosmetic badge on Home.';

  @override
  String get depositFlexTitle => 'Flex Daily';

  @override
  String get depositFlexSubtitle => 'Spend-friendly pot · interest every day';

  @override
  String get depositSaverTitle => 'Saver Daily';

  @override
  String get depositSaverSubtitle => 'Higher daily rate · still liquid';

  @override
  String get depositTermTitle => 'Term Monthly';

  @override
  String get depositTermSubtitle => 'Classic term-style · paid monthly';

  @override
  String get depositPremiumTitle => 'Premium Monthly';

  @override
  String get depositPremiumSubtitle => 'Best monthly rate · educational demo';

  @override
  String ratePerDay(String pct) {
    return '$pct% / day';
  }

  @override
  String ratePerMonth(String pct) {
    return '$pct% / month';
  }

  @override
  String errorGeneric(String error) {
    return 'Something went wrong: $error';
  }

  @override
  String get ledgerWelcome => 'Welcome balance';

  @override
  String get ledgerDepositOpened => 'Deposit opened';

  @override
  String ledgerOpenDeposit(String title) {
    return 'Open deposit: $title';
  }

  @override
  String ledgerAccrued(String title) {
    return 'Accrued $title';
  }

  @override
  String ledgerLevelStipend(String level) {
    return 'Level $level stipend';
  }

  @override
  String ledgerBoost(String title) {
    return 'Boost: $title';
  }

  @override
  String get ledgerTransferOut => 'Transfer out';

  @override
  String get ledgerTransferIn => 'Transfer in';

  @override
  String ledgerP2pTo(String handle) {
    return 'P2P to @$handle';
  }

  @override
  String ledgerMissionSettle(String title, String percent) {
    return '$title settlement ($percent%)';
  }

  @override
  String ledgerFxSpread(String pair) {
    return 'FX conversion spread ($pair)';
  }

  @override
  String ledgerAtmCash(String pack, String notes) {
    return 'ATM cash $pack · $notes';
  }

  @override
  String ledgerGoalFund(String title) {
    return 'Fund goal: $title';
  }

  @override
  String get ledgerTypeStipend => 'Stipend';

  @override
  String get ledgerTypeMission => 'Mission';

  @override
  String get ledgerTypeTransferOut => 'Transfer out';

  @override
  String get ledgerTypeTransferIn => 'Transfer in';

  @override
  String get ledgerTypeFx => 'FX';

  @override
  String get ledgerTypeAtm => 'ATM';

  @override
  String get ledgerTypeBoost => 'Boost';

  @override
  String get ledgerTypeGoal => 'Goal';

  @override
  String get ledgerTypeDepositInterest => 'Deposit interest';

  @override
  String get ledgerTypeCreditCharge => 'Credit charge';

  @override
  String get ledgerTypeCreditPayment => 'Credit payment';

  @override
  String get ledgerTypeOther => 'Other';

  @override
  String get accountMainWallet => 'Main wallet';

  @override
  String get cardDebitPrimary => 'Debit · Primary';

  @override
  String get errorNotOnboarded => 'Finish onboarding first';

  @override
  String get errorPrincipalPositive => 'Principal must be positive';

  @override
  String get errorAmountPositive => 'Amount must be positive';

  @override
  String get errorInsufficientFunds => 'Insufficient funds';

  @override
  String get errorInsufficientFundsBoost => 'Insufficient funds for this boost';

  @override
  String get errorChooseDifferentAccounts => 'Choose different accounts';

  @override
  String get errorCrossCurrency =>
      'Cross-currency transfer is not supported in this demo';

  @override
  String get errorSourceCardFrozen => 'Source card is frozen';

  @override
  String errorUserNotFound(String handle) {
    return 'MOFOBank user @$handle not found';
  }

  @override
  String get errorCardTokenNotFound =>
      'Card details were not found in the vault';

  @override
  String get errorInvalidDepositProduct => 'Unknown deposit product';

  @override
  String get errorInvalidAccountNameKey => 'Unknown account label key';

  @override
  String get errorInvalidLedgerType => 'Unknown ledger type';

  @override
  String get errorInvalidLedgerDescription => 'Unknown ledger description key';

  @override
  String get errorInvalidAtmPack => 'Unknown ATM note pack';

  @override
  String get errorCurrencyMismatch => 'Currency mismatch';

  @override
  String get errorUnknown => 'Something went wrong';
}
