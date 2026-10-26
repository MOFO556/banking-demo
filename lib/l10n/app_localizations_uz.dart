// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'MOFOBank';

  @override
  String get navHome => 'Bosh sahifa';

  @override
  String get navMissions => 'Missiyalar';

  @override
  String get navAccounts => 'Hisoblar';

  @override
  String get navWallet => 'Hamyon';

  @override
  String get settings => 'Sozlamalar';

  @override
  String get settingsSession => 'Sessiya';

  @override
  String get settingsAppearance => 'Ko‘rinish';

  @override
  String get settingsLanguage => 'Til';

  @override
  String get settingsTheme => 'Mavzu';

  @override
  String get themeDark => 'Qorong‘u';

  @override
  String get themeLight => 'Yorug‘';

  @override
  String get themeSystem => 'Tizim';

  @override
  String get langEn => 'English';

  @override
  String get langRu => 'Русский';

  @override
  String get langUz => 'O\'zbekcha';

  @override
  String get biometricUnlock => 'Biometriya bilan kirish';

  @override
  String get biometricAvailable =>
      'Qulf ekranida barmoq / yuz (PIN ham ishlaydi)';

  @override
  String get biometricUnavailable => 'Bu qurilmada mavjud emas';

  @override
  String get lockApp => 'Ilovani qulflash';

  @override
  String get createNewAccount => 'Yangi hisob yaratish';

  @override
  String get wipeSubtitle =>
      'Mahalliy ma’lumotlarni o‘chirish va qayta onboarding';

  @override
  String get wipeTitle => 'Qurilmadagi profilni o‘chirish?';

  @override
  String get wipeBody =>
      'Missiyalar, hamyon, kartalar va omonatlar o‘chiriladi.';

  @override
  String get cancel => 'Bekor qilish';

  @override
  String get wipe => 'O‘chirish';

  @override
  String get shop => 'Do‘kon';

  @override
  String get boostStore => 'Boost do‘koni';

  @override
  String get lockTitle => 'MOFOBank';

  @override
  String get welcomeBack => 'Xush kelibsiz';

  @override
  String hiUser(String name) {
    return 'Salom, $name';
  }

  @override
  String get pinLabel => 'PIN';

  @override
  String get pinHelper => '4-6 raqam';

  @override
  String get unlock => 'Ochish';

  @override
  String get useBiometrics => 'Biometriya';

  @override
  String get enableBiometricsHint =>
      'Barmoq / yuz uchun Sozlamalarda biometriyani yoqing.';

  @override
  String get wrongPin => 'Noto‘g‘ri PIN';

  @override
  String get enterPin => 'PIN kiriting (4-6 raqam)';

  @override
  String get bioCancelled => 'Biometriya bekor qilindi - PIN kiriting';

  @override
  String get onboardingBlurb =>
      'O‘quv bank profilini yarating. Keyingi safar PIN yoki biometriya bilan.';

  @override
  String get displayName => 'Ko‘rsatiladigan ism';

  @override
  String get handleLabel => 'MOFOBank laqab (@)';

  @override
  String get handleHelper => 'P2P o‘tkazmalar uchun';

  @override
  String get appPin => 'Ilova PIN';

  @override
  String get confirmPin => 'PIN ni tasdiqlang';

  @override
  String get confirmPinHelper => 'Xuddi shu 4-6 raqamni qayta kiritingg';

  @override
  String get unlockWithBiometrics => 'Biometriya bilan ochish';

  @override
  String get unlockWithBiometricsSub =>
      'Qo‘llab-quvvatlanadigan telefonlarda barmoq yoki yuz';

  @override
  String get homeMarket => 'Uy bozori';

  @override
  String get openMyWallet => 'Hamyonni ochish';

  @override
  String get pinMustBe4or6 => 'PIN 4-6 raqam bo‘lishi kerak';

  @override
  String get pinMismatch => 'PIN tasdiqi mos kelmadi';

  @override
  String get missionSettled => 'Missiya yakunlandi';

  @override
  String get performance => 'Natija';

  @override
  String get stake => 'Stavka';

  @override
  String get paidToWallet => 'Hamyonga tushdi';

  @override
  String get xp => 'XP';

  @override
  String get continueBtn => 'Davom etish';

  @override
  String challengeProgress(int current, int total) {
    return 'Savol $current / $total';
  }

  @override
  String answeredCount(int count) {
    return 'Javob berildi: $count';
  }

  @override
  String get previous => 'Oldingi';

  @override
  String get next => 'Keyingi';

  @override
  String hint(int count) {
    return 'Maslahat ($count)';
  }

  @override
  String retry(int count) {
    return 'Qayta ($count)';
  }

  @override
  String get settleMission => 'Missiya stavkasini yopish';

  @override
  String get missionCompleted => 'Yakunlangan';

  @override
  String get missionCompletedHint =>
      'Vazifa bajarildi. Qayta o‘ynash — maksimal stavkaning yarmi, faqat pul, XP yo‘q.';

  @override
  String get replayMission => 'Yarim stavka uchun qayta';

  @override
  String get missionReplaySettled => 'Qayta o‘yin hisoblandi';

  @override
  String get missionsReplayAvailable => 'Qayta · yarim stavka';

  @override
  String ledgerMissionReplay(String title, String percent) {
    return '$title qayta ($percent%)';
  }

  @override
  String get walletTitle => 'Hamyon va RPG';

  @override
  String get balance => 'Balans';

  @override
  String get balanceSubtitle => 'Hisobdagi pul.';

  @override
  String get ledger => 'Tranzaksiyalar';

  @override
  String get ledgerSubtitle => 'Kredit · debet';

  @override
  String get level => 'Daraja';

  @override
  String get efficiency => 'Samaradorlik';

  @override
  String efficiencyScore(String score) {
    return 'Samaradorlik: $score';
  }

  @override
  String get missionsTitle => 'Missiyalar';

  @override
  String get accountsTitle => 'Hisoblar';

  @override
  String get completeOnboarding => 'Onboardingni yakunlang';

  @override
  String errorPrefix(String error) {
    return 'Xato: $error';
  }

  @override
  String get tealBadge => 'nishon';

  @override
  String get allMissionsComplete =>
      'Barcha missiyalar tugadi - erkin vositalar doim ochiq.';

  @override
  String get quickTools => 'Tezkor vositalar';

  @override
  String get missionCardsTitle => 'Kartalar va pul asoslari';

  @override
  String get missionCardsSubtitle =>
      'Balanslar qanday saqlanadi va karta qanday ishlaydi';

  @override
  String get missionDepositsTitle => 'Omonatlar va soliq';

  @override
  String get missionDepositsSubtitle =>
      'APY, foiz va mamlakatlar bo‘yicha soliq';

  @override
  String get missionFxTitle => 'FX va valyuta';

  @override
  String get missionFxSubtitle =>
      'Jonli kurslar, konvertatsiya va bank ustamasi';

  @override
  String get missionAtmTitle => 'Bankomat naqd';

  @override
  String get missionAtmSubtitle => 'Kupyuralar - katta, kam yoki mayda';

  @override
  String get missionBudgetingTitle => 'Byudjet va cashflow';

  @override
  String get missionBudgetingSubtitle =>
      'Toifalar, daromad, xarajat va grafiklar';

  @override
  String get missionTransfersTitle => 'O‘tkazmalar va IBAN';

  @override
  String get missionTransfersSubtitle => 'O‘quv P2P va validatsiya UX';

  @override
  String get missionCreditTitle => 'Kredit vs debet';

  @override
  String get missionCreditSubtitle => 'Foiz va minimal to‘lov tuzog‘i';

  @override
  String get missionSecurityTitle => 'Firibgarlik va xavfsizlik';

  @override
  String get missionSecuritySubtitle => 'PIN, muzlatish va fishing';

  @override
  String get missionSavingsTitle => 'Jamg‘arma maqsadlari';

  @override
  String get missionSavingsSubtitle => 'Maqsad idishlari va progress';

  @override
  String get marketRu => 'Rossiya';

  @override
  String get marketUs => 'AQSH';

  @override
  String get marketEu => 'Yevrozona';

  @override
  String get marketUk => 'Birlashgan Qirollik';

  @override
  String get marketUz => 'O‘zbekiston';

  @override
  String get marketJp => 'Yaponiya';

  @override
  String get marketTr => 'Turkiya';

  @override
  String get marketKz => 'Qozog‘iston';

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
  String get lockTooltip => 'Qulflash';

  @override
  String get learnerDefault => 'O‘quvchi';

  @override
  String marketTaxSummary(String code, String rate) {
    return '$code · foiz solig‘i ~$rate%';
  }

  @override
  String get continueLearning => 'O‘rganishni davom ettirish';

  @override
  String get continueLearningSubtitle =>
      'Missiyalar tartib bilan ochiladi; sinov vositalari ochiq qoladi.';

  @override
  String get card => 'Karta';

  @override
  String get fx => 'Valyuta';

  @override
  String get atm => 'Bankomat';

  @override
  String get transfer => 'O‘tkazma';

  @override
  String get boosts => 'Boostlar';

  @override
  String get wipeAndCreate => 'O‘chirib, yaratish';

  @override
  String get yourPots => 'Hisoblaringiz';

  @override
  String get yourPotsSubtitle =>
      'Bu qurilmadagi hamyon, kartalar va omonatlar.';

  @override
  String get cards => 'Kartalar';

  @override
  String get cardLabel => 'Karta nomi';

  @override
  String get virtualDebit => 'Virtual debet';

  @override
  String get issueNewCard => 'Yangi karta chiqarish';

  @override
  String get deposits => 'Omonatlar';

  @override
  String get openDeposit => 'Omonat ochish';

  @override
  String get transferMoney => 'Pul o‘tkazish';

  @override
  String get create => 'Yaratish';

  @override
  String get couldNotLoadCard => 'Karta ma’lumotlarini yuklab bo‘lmadi';

  @override
  String get cardNotFound => 'Karta topilmadi';

  @override
  String get loadingCardDetails => 'Karta ma’lumotlari yuklanmoqda...';

  @override
  String get cardFrozen => 'Karta muzlatilgan';

  @override
  String get tapCardToFlip => 'Kartani aylantirish uchun bosing';

  @override
  String get unfreezeCard => 'Kartani eritish';

  @override
  String get freezeCard => 'Kartani muzlatish';

  @override
  String get yourCard => 'Kartangiz';

  @override
  String get yourCardSubtitle =>
      'Orqa tomonini ko‘rish uchun aylantiring. Ma’lumotlar ko‘rsatilguncha maxfiy.';

  @override
  String get pickDepositProduct =>
      'Mahsulotni tanlang · oylik yoki kunlik stavka';

  @override
  String get depositProducts => 'Omonat mahsulotlari';

  @override
  String get fundFrom => 'Mablag‘ manbasi';

  @override
  String get principalMajor => 'Asosiy summa';

  @override
  String get pickMofoUser => 'MOFOBank foydalanuvchisini tanlang';

  @override
  String get pickDestination => 'Qabul qiluvchini tanlang';

  @override
  String get transferSubtitle =>
      'Hisoblaringiz orasida yoki MOFOBank foydalanuvchisiga pul o‘tkazing';

  @override
  String get sendTransfer => 'O‘tkazmani yuborish';

  @override
  String get from => 'Qayerdan';

  @override
  String get sourceAccount => 'Manba hisob';

  @override
  String get toMofoUser => 'MOFOBank foydalanuvchisiga';

  @override
  String get betweenMyAccounts => 'Hisoblarim orasida';

  @override
  String get recipient => 'Qabul qiluvchi';

  @override
  String get destination => 'Manzil';

  @override
  String get amountMajor => 'Summa';

  @override
  String get budgeting => 'Byudjet';

  @override
  String incomeExpenses(String income, String expenses) {
    return 'Daromad $income · Xarajat $expenses';
  }

  @override
  String get cashflow => 'Pul oqimi';

  @override
  String get cashflowSubtitle =>
      'Toifalar qo‘shing - daromad xarajatdan ko‘p bo‘lsin.';

  @override
  String get inLabel => 'Kirim';

  @override
  String get outLabel => 'Chiqim';

  @override
  String get category => 'Toifa';

  @override
  String amountCurrencyMajor(String code) {
    return 'Summa ($code)';
  }

  @override
  String get income => 'Daromad';

  @override
  String get expense => 'Xarajat';

  @override
  String get addItem => 'Qo‘shish';

  @override
  String get loading => 'Yuklanmoqda...';

  @override
  String get hideDetails => 'Ma’lumotlarni yashirish';

  @override
  String get showCardNumber => 'Karta raqamini ko‘rsatish';

  @override
  String get frozen => 'MUZLATILGAN';

  @override
  String get cvvWarning => 'CVV kodini hech kimga bermang.';

  @override
  String get openAccountsFirst => 'Avval Hisoblar bo‘limida karta chiqaring';

  @override
  String get loadingYourCard => 'Karta yuklanmoqda...';

  @override
  String get exploreCardChallenge => 'Kartani o‘rganib, topshiriqni yakunlang';

  @override
  String get yourDebitCard => 'Debet kartangiz';

  @override
  String get yourDebitCardSubtitle =>
      'Balans eng kichik birliklarda saqlanadi. Aylantirish uchun bosing.';

  @override
  String get credit => 'Kredit';

  @override
  String interestPaid(String amount) {
    return 'To‘langan foiz: $amount';
  }

  @override
  String get minimumPaymentTrap => 'Minimal to‘lov tuzog‘i';

  @override
  String get minimumPaymentTrapSubtitle =>
      'Debet o‘z pulingizni, kredit esa foizli qarzni sarflaydi.';

  @override
  String creditStartSummary(String amount) {
    return 'Boshlanish: $amount, yillik 22%, oyiga ~2% minimum';
  }

  @override
  String paidOffMonths(int count) {
    return '$count oyda yopildi';
  }

  @override
  String stillOpenMonths(int count) {
    return '$count oydan keyin ham qarz bor';
  }

  @override
  String get depositsAndTax => 'Omonatlar va soliq';

  @override
  String get compareTaxDrag =>
      'Soliq ta’sirini solishtirib, topshiriqni yakunlang';

  @override
  String get marketPickedQuiz =>
      'Bozor tanlandi · barcha savollarga javob bering';

  @override
  String get lodgementSandbox => 'Omonat sinovi';

  @override
  String get lodgementSandboxSubtitle =>
      'Asosiy summa va APY bir xil; faqat soliq farq qiladi.';

  @override
  String principalApy(String amount, String apy) {
    return 'Asosiy summa: $amount, APY $apy%';
  }

  @override
  String homeNetTax(String net, String tax) {
    return 'Uy bozori sof daromadi $net (soliq $tax)';
  }

  @override
  String get lowestTaxDrag => 'Eng past soliq';

  @override
  String get lowestTaxDragSubtitle => 'Qaysi bozorda sof foiz daromadi yuqori?';

  @override
  String get couldNotLoadRate => 'Valyuta kursini yuklab bo‘lmadi';

  @override
  String fxSpreadDescription(String pair) {
    return 'Konvertatsiya marjasi ($pair)';
  }

  @override
  String get updatingRate => 'Kurs yangilanmoqda...';

  @override
  String get cachedRate => 'Keshlangan kurs';

  @override
  String get liveRate => 'Joriy kurs';

  @override
  String get exchange => 'Ayirboshlash';

  @override
  String get exchangeSubtitle =>
      'Valyutalarni kichik bank ustamasi bilan ayirboshlang.';

  @override
  String amountCurrency(String code) {
    return 'Summa ($code)';
  }

  @override
  String get convertTo => 'Qaysi valyutaga';

  @override
  String get cashDispensed => 'Naqd pul berildi - topshiriqni yakunlang';

  @override
  String availableAmount(String amount) {
    return 'Mavjud $amount';
  }

  @override
  String get dispense => 'Berish';

  @override
  String get settle => 'Yakunlash';

  @override
  String get withdrawCash => 'Naqd pul olish';

  @override
  String get withdrawCashSubtitle =>
      'Hamyondan summa va kupyura tanlash usulini belgilang.';

  @override
  String notesInCassette(String notes, String code) {
    return 'Kassetadagi kupyuralar: $notes $code';
  }

  @override
  String multiplesMax(int step, int max) {
    return '$step ga karrali, maksimum $max';
  }

  @override
  String get largeBills => 'Katta kupyuralar';

  @override
  String get largeBillsSubtitle => 'Avval eng katta nominallar';

  @override
  String get fewestNotes => 'Eng kam kupyura';

  @override
  String get fewestNotesSubtitle => 'Optimal kassetali tanlov';

  @override
  String get smallerNotes => 'Kichik kupyuralar';

  @override
  String get smallerNotesSubtitle => 'Xarajat uchun qaytimga qulay';

  @override
  String noteCountBreakdown(int count, String breakdown) {
    return '$count kupyura - $breakdown';
  }

  @override
  String get cannotMakeAmount => 'Bu usul bilan summani berib bo‘lmaydi';

  @override
  String get security => 'Xavfsizlik';

  @override
  String get securityInitialStatus =>
      'PIN o‘rnating, tekshiring va kartani muzlating';

  @override
  String get pinAndFreeze => 'PIN va muzlatish';

  @override
  String get pinAndFreezeSubtitle =>
      'PIN lokal xeshda saqlanadi. Muzlatish - karta belgisi.';

  @override
  String get pinSaved => 'PIN saqlandi (xesh)';

  @override
  String get savePin => 'PIN saqlash';

  @override
  String get verifyPin => 'PIN tekshirish';

  @override
  String get pinVerified => 'PIN tasdiqlandi';

  @override
  String get cardUnfrozen => 'Karta eritildi';

  @override
  String get transfers => 'O‘tkazmalar';

  @override
  String get p2pTransfer => 'P2P o‘tkazma';

  @override
  String get transferPosted => 'O‘tkazma ledgerga yozildi';

  @override
  String get validateThenSend => 'IBAN va summani tekshirib yuboring';

  @override
  String get send => 'Yuborish';

  @override
  String get simulatedP2p => 'O‘quv P2P';

  @override
  String get simulatedP2pSubtitle => 'IBAN tekshiruvi va ledger debeti.';

  @override
  String get beneficiaryIban => 'Qabul qiluvchi IBAN';

  @override
  String get inventory => 'Inventar';

  @override
  String get inventorySubtitle => 'Boostlar ixtiyoriy. Asosiy darslar bepul.';

  @override
  String inventorySummary(int hints, int retries, String badge) {
    return 'Maslahatlar: $hints · Qayta urinishlar: $retries · Nishon: $badge';
  }

  @override
  String get on => 'yoqilgan';

  @override
  String get off => 'o‘chirilgan';

  @override
  String get buy => 'Sotib olish';

  @override
  String get owned => 'Sotib olingan';

  @override
  String purchased(String title) {
    return 'Sotib olindi: $title';
  }

  @override
  String countryFlag(String code) {
    return '$code bayrog‘i';
  }

  @override
  String get confirmIdentity => 'Shaxsingizni tasdiqlang';

  @override
  String get devicePinHelper => '4-6 raqam';

  @override
  String get savings => 'Jamg‘arma';

  @override
  String get savingsGoals => 'Jamg‘arma maqsadlari';

  @override
  String get savingsGoalsSubtitle =>
      'Hamyondan to‘ldiring va jarayonni kuzating.';

  @override
  String get goalName => 'Maqsad nomi';

  @override
  String targetCurrencyMajor(String code) {
    return 'Maqsad ($code)';
  }

  @override
  String get createGoal => 'Maqsad yaratish';

  @override
  String fundAmount(String amount) {
    return '$amount qo‘shish';
  }

  @override
  String get setPinLabel => '4-6 raqamli PIN o‘rnating';

  @override
  String get verify => 'Tekshirish';

  @override
  String get freezePrimaryCard => 'Asosiy kartani muzlatish';

  @override
  String get goalFunded => 'Maqsad hamyondan to‘ldirildi';

  @override
  String get createThenFund => 'Jamg‘arma yarating va to‘ldiring';

  @override
  String get goalPots => 'Jamg‘armalar';

  @override
  String get emergencyPot => 'Favqulodda zaxira';

  @override
  String fundGoalDescription(String title) {
    return 'Maqsadni to‘ldirish: $title';
  }

  @override
  String atmCashDescription(String pack, String notes) {
    return 'Bankomat naqd puli: $pack · $notes';
  }

  @override
  String get showingCachedRate => 'Oxirgi ma’lum kurs ko‘rsatilmoqda';

  @override
  String get showingEstimatedRate => 'Taxminiy kurs - saqlangan kurs yo‘q';

  @override
  String get ratesReady => 'Kurslar tayyor';

  @override
  String get includesBankSpread => 'Bank ustamasi bilan';

  @override
  String youReceive(String amount) {
    return 'Siz olasiz ≈ $amount';
  }

  @override
  String walletAmount(String amount) {
    return 'Hamyon: $amount';
  }

  @override
  String get cvvLabel => 'CVV';

  @override
  String get boostHintTitle => 'Maslahatlar to‘plami';

  @override
  String get boostHintDescription =>
      'To‘g‘ri javobni bir marta yoritadi (3 ta maslahat).';

  @override
  String get boostRetryTitle => 'Viktorinani qayta';

  @override
  String get boostRetryDescription =>
      'Joriy viktorina javoblarini tozalaydi (1 marta).';

  @override
  String get boostBadgeTitle => 'Teal nishon';

  @override
  String get boostBadgeDescription => 'Bosh sahifadagi kosmetik nishon.';

  @override
  String get depositFlexTitle => 'Flex Daily';

  @override
  String get depositFlexSubtitle => 'Moslashuvchan omonat · har kuni foiz';

  @override
  String get depositSaverTitle => 'Saver Daily';

  @override
  String get depositSaverSubtitle => 'Yuqori kunlik stavka · hali likvid';

  @override
  String get depositTermTitle => 'Term Monthly';

  @override
  String get depositTermSubtitle => 'Klassik muddatli · oyiga to‘lov';

  @override
  String get depositPremiumTitle => 'Premium Monthly';

  @override
  String get depositPremiumSubtitle => 'Eng yaxshi oylik stavka · o‘quv demo';

  @override
  String ratePerDay(String pct) {
    return '$pct% / kun';
  }

  @override
  String ratePerMonth(String pct) {
    return '$pct% / oy';
  }

  @override
  String errorGeneric(String error) {
    return 'Xatolik yuz berdi: $error';
  }

  @override
  String get ledgerWelcome => 'Xush kelibsiz balansi';

  @override
  String get ledgerDepositOpened => 'Omonat ochildi';

  @override
  String ledgerOpenDeposit(String title) {
    return 'Omonat ochish: $title';
  }

  @override
  String ledgerAccrued(String title) {
    return 'Hisoblandi: $title';
  }

  @override
  String ledgerLevelStipend(String level) {
    return '$level-daraja stipendiyasi';
  }

  @override
  String ledgerBoost(String title) {
    return 'Boost: $title';
  }

  @override
  String get ledgerTransferOut => 'Chiquvchi o‘tkazma';

  @override
  String get ledgerTransferIn => 'Kiruvchi o‘tkazma';

  @override
  String ledgerP2pTo(String handle) {
    return 'P2P @$handle ga';
  }

  @override
  String ledgerMissionSettle(String title, String percent) {
    return '$title yakuni ($percent%)';
  }

  @override
  String ledgerFxSpread(String pair) {
    return 'FX ustama ($pair)';
  }

  @override
  String ledgerAtmCash(String pack, String notes) {
    return 'Bankomat $pack · $notes';
  }

  @override
  String ledgerGoalFund(String title) {
    return 'Maqsadni to‘ldirish: $title';
  }

  @override
  String get ledgerTypeStipend => 'Stipendiya';

  @override
  String get ledgerTypeMission => 'Missiya';

  @override
  String get ledgerTypeTransferOut => 'Chiquvchi';

  @override
  String get ledgerTypeTransferIn => 'Kiruvchi';

  @override
  String get ledgerTypeFx => 'FX';

  @override
  String get ledgerTypeAtm => 'Bankomat';

  @override
  String get ledgerTypeBoost => 'Boost';

  @override
  String get ledgerTypeGoal => 'Maqsad';

  @override
  String get ledgerTypeDepositInterest => 'Omonat foizi';

  @override
  String get ledgerTypeCreditCharge => 'Kredit yechimi';

  @override
  String get ledgerTypeCreditPayment => 'Kredit to‘lovi';

  @override
  String get ledgerTypeOther => 'Boshqa';

  @override
  String get accountMainWallet => 'Asosiy hamyon';

  @override
  String get cardDebitPrimary => 'Debet · Asosiy';

  @override
  String get errorNotOnboarded => 'Avval onboardingni yakunlang';

  @override
  String get errorPrincipalPositive => 'Omonat summasi musbat bo‘lishi kerak';

  @override
  String get errorAmountPositive => 'Summa musbat bo‘lishi kerak';

  @override
  String get errorInsufficientFunds => 'Mablag‘ yetarli emas';

  @override
  String get errorInsufficientFundsBoost =>
      'Bu boost uchun mablag‘ yetarli emas';

  @override
  String get errorChooseDifferentAccounts => 'Turli hisoblarni tanlang';

  @override
  String get errorCrossCurrency =>
      'Demo’da valyutalararo o‘tkazma qo‘llab-quvvatlanmaydi';

  @override
  String get errorSourceCardFrozen => 'Manba karta muzlatilgan';

  @override
  String errorUserNotFound(String handle) {
    return 'MOFOBank foydalanuvchisi @$handle topilmadi';
  }

  @override
  String get errorCardTokenNotFound => 'Karta ma’lumotlari omborda topilmadi';

  @override
  String get errorInvalidDepositProduct => 'Noma’lum omonat mahsuloti';

  @override
  String get errorInvalidAccountNameKey => 'Noma’lum hisob nomi kaliti';

  @override
  String get errorInvalidLedgerType => 'Noma’lum ledger turi';

  @override
  String get errorInvalidLedgerDescription => 'Noma’lum ledger tavsifi kaliti';

  @override
  String get errorInvalidAtmPack => 'Noma’lum bankomat kupyura to‘plami';

  @override
  String get errorCurrencyMismatch => 'Valyutalar mos kelmaydi';

  @override
  String get errorUnknown => 'Xatolik yuz berdi';
}
