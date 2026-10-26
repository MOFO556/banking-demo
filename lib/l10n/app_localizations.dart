import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'MOFOBank'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navMissions.
  ///
  /// In en, this message translates to:
  /// **'Missions'**
  String get navMissions;

  /// No description provided for @navAccounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get navAccounts;

  /// No description provided for @navWallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get navWallet;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settingsSession.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get settingsSession;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @langEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEn;

  /// No description provided for @langRu.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get langRu;

  /// No description provided for @langUz.
  ///
  /// In en, this message translates to:
  /// **'O\'zbekcha'**
  String get langUz;

  /// No description provided for @biometricUnlock.
  ///
  /// In en, this message translates to:
  /// **'Biometric unlock'**
  String get biometricUnlock;

  /// No description provided for @biometricAvailable.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint / face on lock screen (PIN still works)'**
  String get biometricAvailable;

  /// No description provided for @biometricUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Not available on this device'**
  String get biometricUnavailable;

  /// No description provided for @lockApp.
  ///
  /// In en, this message translates to:
  /// **'Lock app'**
  String get lockApp;

  /// No description provided for @createNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get createNewAccount;

  /// No description provided for @wipeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Wipe local data and re-onboard'**
  String get wipeSubtitle;

  /// No description provided for @wipeTitle.
  ///
  /// In en, this message translates to:
  /// **'Wipe this device profile?'**
  String get wipeTitle;

  /// No description provided for @wipeBody.
  ///
  /// In en, this message translates to:
  /// **'Missions, wallet, cards, and deposits on this device will be deleted.'**
  String get wipeBody;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @wipe.
  ///
  /// In en, this message translates to:
  /// **'Wipe'**
  String get wipe;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @boostStore.
  ///
  /// In en, this message translates to:
  /// **'Boost store'**
  String get boostStore;

  /// No description provided for @lockTitle.
  ///
  /// In en, this message translates to:
  /// **'MOFOBank'**
  String get lockTitle;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @hiUser.
  ///
  /// In en, this message translates to:
  /// **'Hi, {name}'**
  String hiUser(String name);

  /// No description provided for @pinLabel.
  ///
  /// In en, this message translates to:
  /// **'PIN'**
  String get pinLabel;

  /// No description provided for @pinHelper.
  ///
  /// In en, this message translates to:
  /// **'4-6 digits'**
  String get pinHelper;

  /// No description provided for @unlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlock;

  /// No description provided for @useBiometrics.
  ///
  /// In en, this message translates to:
  /// **'Use biometrics'**
  String get useBiometrics;

  /// No description provided for @enableBiometricsHint.
  ///
  /// In en, this message translates to:
  /// **'Turn on biometrics in Settings for fingerprint / face unlock.'**
  String get enableBiometricsHint;

  /// No description provided for @wrongPin.
  ///
  /// In en, this message translates to:
  /// **'Wrong PIN'**
  String get wrongPin;

  /// No description provided for @enterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN (4-6 digits)'**
  String get enterPin;

  /// No description provided for @bioCancelled.
  ///
  /// In en, this message translates to:
  /// **'Biometrics cancelled - enter PIN'**
  String get bioCancelled;

  /// No description provided for @onboardingBlurb.
  ///
  /// In en, this message translates to:
  /// **'Create your bank profile. Unlock next time with your PIN or biometrics.'**
  String get onboardingBlurb;

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get displayName;

  /// No description provided for @handleLabel.
  ///
  /// In en, this message translates to:
  /// **'MOFOBank handle (@)'**
  String get handleLabel;

  /// No description provided for @handleHelper.
  ///
  /// In en, this message translates to:
  /// **'Used for P2P transfers'**
  String get handleHelper;

  /// No description provided for @appPin.
  ///
  /// In en, this message translates to:
  /// **'App PIN'**
  String get appPin;

  /// No description provided for @confirmPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get confirmPin;

  /// No description provided for @confirmPinHelper.
  ///
  /// In en, this message translates to:
  /// **'Re-enter the same 4-6 digits'**
  String get confirmPinHelper;

  /// No description provided for @unlockWithBiometrics.
  ///
  /// In en, this message translates to:
  /// **'Unlock with biometrics'**
  String get unlockWithBiometrics;

  /// No description provided for @unlockWithBiometricsSub.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint or face on supported phones'**
  String get unlockWithBiometricsSub;

  /// No description provided for @homeMarket.
  ///
  /// In en, this message translates to:
  /// **'Home market'**
  String get homeMarket;

  /// No description provided for @openMyWallet.
  ///
  /// In en, this message translates to:
  /// **'Open my wallet'**
  String get openMyWallet;

  /// No description provided for @pinMustBe4or6.
  ///
  /// In en, this message translates to:
  /// **'PIN must be 4-6 digits'**
  String get pinMustBe4or6;

  /// No description provided for @pinMismatch.
  ///
  /// In en, this message translates to:
  /// **'PIN confirmation does not match'**
  String get pinMismatch;

  /// No description provided for @missionSettled.
  ///
  /// In en, this message translates to:
  /// **'Mission settled'**
  String get missionSettled;

  /// No description provided for @performance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get performance;

  /// No description provided for @stake.
  ///
  /// In en, this message translates to:
  /// **'Stake'**
  String get stake;

  /// No description provided for @paidToWallet.
  ///
  /// In en, this message translates to:
  /// **'Paid to wallet'**
  String get paidToWallet;

  /// No description provided for @xp.
  ///
  /// In en, this message translates to:
  /// **'XP'**
  String get xp;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @challengeProgress.
  ///
  /// In en, this message translates to:
  /// **'Challenge {current} / {total}'**
  String challengeProgress(int current, int total);

  /// No description provided for @answeredCount.
  ///
  /// In en, this message translates to:
  /// **'{count} answered'**
  String answeredCount(int count);

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @hint.
  ///
  /// In en, this message translates to:
  /// **'Hint ({count})'**
  String hint(int count);

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry ({count})'**
  String retry(int count);

  /// No description provided for @settleMission.
  ///
  /// In en, this message translates to:
  /// **'Settle mission stake'**
  String get settleMission;

  /// No description provided for @missionCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get missionCompleted;

  /// No description provided for @missionCompletedHint.
  ///
  /// In en, this message translates to:
  /// **'Mission completed. Replay pays half the max stake — money only, no XP.'**
  String get missionCompletedHint;

  /// No description provided for @replayMission.
  ///
  /// In en, this message translates to:
  /// **'Replay for half stake'**
  String get replayMission;

  /// No description provided for @missionReplaySettled.
  ///
  /// In en, this message translates to:
  /// **'Replay settled'**
  String get missionReplaySettled;

  /// No description provided for @missionsReplayAvailable.
  ///
  /// In en, this message translates to:
  /// **'Replay · half stake'**
  String get missionsReplayAvailable;

  /// No description provided for @ledgerMissionReplay.
  ///
  /// In en, this message translates to:
  /// **'{title} replay ({percent}%)'**
  String ledgerMissionReplay(String title, String percent);

  /// No description provided for @walletTitle.
  ///
  /// In en, this message translates to:
  /// **'Wallet & RPG'**
  String get walletTitle;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @balanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Play money on a ledger.'**
  String get balanceSubtitle;

  /// No description provided for @ledger.
  ///
  /// In en, this message translates to:
  /// **'Ledger'**
  String get ledger;

  /// No description provided for @ledgerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Credits in · debits out'**
  String get ledgerSubtitle;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @efficiency.
  ///
  /// In en, this message translates to:
  /// **'Efficiency'**
  String get efficiency;

  /// No description provided for @efficiencyScore.
  ///
  /// In en, this message translates to:
  /// **'Efficiency score: {score}'**
  String efficiencyScore(String score);

  /// No description provided for @missionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Missions'**
  String get missionsTitle;

  /// No description provided for @accountsTitle.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get accountsTitle;

  /// No description provided for @completeOnboarding.
  ///
  /// In en, this message translates to:
  /// **'Complete onboarding'**
  String get completeOnboarding;

  /// No description provided for @errorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorPrefix(String error);

  /// No description provided for @tealBadge.
  ///
  /// In en, this message translates to:
  /// **'badge'**
  String get tealBadge;

  /// No description provided for @allMissionsComplete.
  ///
  /// In en, this message translates to:
  /// **'All missions complete - explore free-roam tools anytime.'**
  String get allMissionsComplete;

  /// No description provided for @quickTools.
  ///
  /// In en, this message translates to:
  /// **'Quick tools'**
  String get quickTools;

  /// No description provided for @missionCardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Cards & money basics'**
  String get missionCardsTitle;

  /// No description provided for @missionCardsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How balances live, and how a bank card works front & back'**
  String get missionCardsSubtitle;

  /// No description provided for @missionDepositsTitle.
  ///
  /// In en, this message translates to:
  /// **'Deposits & tax'**
  String get missionDepositsTitle;

  /// No description provided for @missionDepositsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'APY, interest, and how countries withhold tax'**
  String get missionDepositsSubtitle;

  /// No description provided for @missionFxTitle.
  ///
  /// In en, this message translates to:
  /// **'FX & foreign holdings'**
  String get missionFxTitle;

  /// No description provided for @missionFxSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Live rates, conversion, and bank markup'**
  String get missionFxSubtitle;

  /// No description provided for @missionAtmTitle.
  ///
  /// In en, this message translates to:
  /// **'ATM cash'**
  String get missionAtmTitle;

  /// No description provided for @missionAtmSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Withdraw real notes - large bills, fewest notes, or change'**
  String get missionAtmSubtitle;

  /// No description provided for @missionBudgetingTitle.
  ///
  /// In en, this message translates to:
  /// **'Budgeting & cashflow'**
  String get missionBudgetingTitle;

  /// No description provided for @missionBudgetingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Categories, income, expenses, and charts'**
  String get missionBudgetingSubtitle;

  /// No description provided for @missionTransfersTitle.
  ///
  /// In en, this message translates to:
  /// **'Transfers & IBAN'**
  String get missionTransfersTitle;

  /// No description provided for @missionTransfersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Simulated P2P and validation UX'**
  String get missionTransfersSubtitle;

  /// No description provided for @missionCreditTitle.
  ///
  /// In en, this message translates to:
  /// **'Credit vs debit'**
  String get missionCreditTitle;

  /// No description provided for @missionCreditSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Interest and the minimum-payment trap'**
  String get missionCreditSubtitle;

  /// No description provided for @missionSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Fraud & security'**
  String get missionSecurityTitle;

  /// No description provided for @missionSecuritySubtitle.
  ///
  /// In en, this message translates to:
  /// **'PIN, freeze, and phishing hygiene'**
  String get missionSecuritySubtitle;

  /// No description provided for @missionSavingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Savings goals'**
  String get missionSavingsTitle;

  /// No description provided for @missionSavingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Goal pots and progress rings'**
  String get missionSavingsSubtitle;

  /// No description provided for @marketRu.
  ///
  /// In en, this message translates to:
  /// **'Russia'**
  String get marketRu;

  /// No description provided for @marketUs.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get marketUs;

  /// No description provided for @marketEu.
  ///
  /// In en, this message translates to:
  /// **'Eurozone'**
  String get marketEu;

  /// No description provided for @marketUk.
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get marketUk;

  /// No description provided for @marketUz.
  ///
  /// In en, this message translates to:
  /// **'Uzbekistan'**
  String get marketUz;

  /// No description provided for @marketJp.
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get marketJp;

  /// No description provided for @marketTr.
  ///
  /// In en, this message translates to:
  /// **'Türkiye'**
  String get marketTr;

  /// No description provided for @marketKz.
  ///
  /// In en, this message translates to:
  /// **'Kazakhstan'**
  String get marketKz;

  /// No description provided for @quiz_cards_0_prompt.
  ///
  /// In en, this message translates to:
  /// **'What should a bank app store for a card at rest?'**
  String get quiz_cards_0_prompt;

  /// No description provided for @quiz_cards_0_opt0.
  ///
  /// In en, this message translates to:
  /// **'Full PAN + CVV in plaintext'**
  String get quiz_cards_0_opt0;

  /// No description provided for @quiz_cards_0_opt1.
  ///
  /// In en, this message translates to:
  /// **'A token / reference - never raw CVV'**
  String get quiz_cards_0_opt1;

  /// No description provided for @quiz_cards_0_opt2.
  ///
  /// In en, this message translates to:
  /// **'Only the cardholder selfie'**
  String get quiz_cards_0_opt2;

  /// No description provided for @quiz_cards_0_opt3.
  ///
  /// In en, this message translates to:
  /// **'The magnetic stripe image'**
  String get quiz_cards_0_opt3;

  /// No description provided for @quiz_cards_1_prompt.
  ///
  /// In en, this message translates to:
  /// **'Balances in MOFOBank are best stored as...'**
  String get quiz_cards_1_prompt;

  /// No description provided for @quiz_cards_1_opt0.
  ///
  /// In en, this message translates to:
  /// **'Floating-point dollars'**
  String get quiz_cards_1_opt0;

  /// No description provided for @quiz_cards_1_opt1.
  ///
  /// In en, this message translates to:
  /// **'Integer minor units (cents / kopecks)'**
  String get quiz_cards_1_opt1;

  /// No description provided for @quiz_cards_1_opt2.
  ///
  /// In en, this message translates to:
  /// **'Formatted strings like \"\$12.00\"'**
  String get quiz_cards_1_opt2;

  /// No description provided for @quiz_cards_1_opt3.
  ///
  /// In en, this message translates to:
  /// **'Blockchain hashes only'**
  String get quiz_cards_1_opt3;

  /// No description provided for @quiz_cards_2_prompt.
  ///
  /// In en, this message translates to:
  /// **'Where does the CVV usually live on a physical card?'**
  String get quiz_cards_2_prompt;

  /// No description provided for @quiz_cards_2_opt0.
  ///
  /// In en, this message translates to:
  /// **'Front, next to the chip'**
  String get quiz_cards_2_opt0;

  /// No description provided for @quiz_cards_2_opt1.
  ///
  /// In en, this message translates to:
  /// **'Back, near the signature strip'**
  String get quiz_cards_2_opt1;

  /// No description provided for @quiz_cards_2_opt2.
  ///
  /// In en, this message translates to:
  /// **'Inside the chip only'**
  String get quiz_cards_2_opt2;

  /// No description provided for @quiz_cards_2_opt3.
  ///
  /// In en, this message translates to:
  /// **'Printed on the receipt'**
  String get quiz_cards_2_opt3;

  /// No description provided for @quiz_cards_3_prompt.
  ///
  /// In en, this message translates to:
  /// **'Why freeze a card in the app?'**
  String get quiz_cards_3_prompt;

  /// No description provided for @quiz_cards_3_opt0.
  ///
  /// In en, this message translates to:
  /// **'To earn more interest'**
  String get quiz_cards_3_opt0;

  /// No description provided for @quiz_cards_3_opt1.
  ///
  /// In en, this message translates to:
  /// **'To block new spend if lost or stolen'**
  String get quiz_cards_3_opt1;

  /// No description provided for @quiz_cards_3_opt2.
  ///
  /// In en, this message translates to:
  /// **'To change your IBAN'**
  String get quiz_cards_3_opt2;

  /// No description provided for @quiz_cards_3_opt3.
  ///
  /// In en, this message translates to:
  /// **'To reset FX markup'**
  String get quiz_cards_3_opt3;

  /// No description provided for @quiz_deposits_0_prompt.
  ///
  /// In en, this message translates to:
  /// **'Gross interest before tax is...'**
  String get quiz_deposits_0_prompt;

  /// No description provided for @quiz_deposits_0_opt0.
  ///
  /// In en, this message translates to:
  /// **'Principal × APY'**
  String get quiz_deposits_0_opt0;

  /// No description provided for @quiz_deposits_0_opt1.
  ///
  /// In en, this message translates to:
  /// **'Principal - APY'**
  String get quiz_deposits_0_opt1;

  /// No description provided for @quiz_deposits_0_opt2.
  ///
  /// In en, this message translates to:
  /// **'Tax × APY'**
  String get quiz_deposits_0_opt2;

  /// No description provided for @quiz_deposits_0_opt3.
  ///
  /// In en, this message translates to:
  /// **'Always zero'**
  String get quiz_deposits_0_opt3;

  /// No description provided for @quiz_deposits_1_prompt.
  ///
  /// In en, this message translates to:
  /// **'Withholding tax on deposit interest means...'**
  String get quiz_deposits_1_prompt;

  /// No description provided for @quiz_deposits_1_opt0.
  ///
  /// In en, this message translates to:
  /// **'The bank pays you more'**
  String get quiz_deposits_1_opt0;

  /// No description provided for @quiz_deposits_1_opt1.
  ///
  /// In en, this message translates to:
  /// **'Part of interest is taken before you receive it'**
  String get quiz_deposits_1_opt1;

  /// No description provided for @quiz_deposits_1_opt2.
  ///
  /// In en, this message translates to:
  /// **'Your principal is frozen'**
  String get quiz_deposits_1_opt2;

  /// No description provided for @quiz_deposits_1_opt3.
  ///
  /// In en, this message translates to:
  /// **'FX rates get cheaper'**
  String get quiz_deposits_1_opt3;

  /// No description provided for @quiz_deposits_2_prompt.
  ///
  /// In en, this message translates to:
  /// **'If two countries share the same APY, who nets more interest?'**
  String get quiz_deposits_2_prompt;

  /// No description provided for @quiz_deposits_2_opt0.
  ///
  /// In en, this message translates to:
  /// **'The higher tax rate'**
  String get quiz_deposits_2_opt0;

  /// No description provided for @quiz_deposits_2_opt1.
  ///
  /// In en, this message translates to:
  /// **'The lower tax rate'**
  String get quiz_deposits_2_opt1;

  /// No description provided for @quiz_deposits_2_opt2.
  ///
  /// In en, this message translates to:
  /// **'Always the Eurozone'**
  String get quiz_deposits_2_opt2;

  /// No description provided for @quiz_deposits_2_opt3.
  ///
  /// In en, this message translates to:
  /// **'It never differs'**
  String get quiz_deposits_2_opt3;

  /// No description provided for @quiz_deposits_3_prompt.
  ///
  /// In en, this message translates to:
  /// **'APY is closest to...'**
  String get quiz_deposits_3_prompt;

  /// No description provided for @quiz_deposits_3_opt0.
  ///
  /// In en, this message translates to:
  /// **'Annual percentage yield on the deposit'**
  String get quiz_deposits_3_opt0;

  /// No description provided for @quiz_deposits_3_opt1.
  ///
  /// In en, this message translates to:
  /// **'A one-time ATM fee'**
  String get quiz_deposits_3_opt1;

  /// No description provided for @quiz_deposits_3_opt2.
  ///
  /// In en, this message translates to:
  /// **'Your credit score'**
  String get quiz_deposits_3_opt2;

  /// No description provided for @quiz_deposits_3_opt3.
  ///
  /// In en, this message translates to:
  /// **'The card CVV'**
  String get quiz_deposits_3_opt3;

  /// No description provided for @quiz_fx_0_prompt.
  ///
  /// In en, this message translates to:
  /// **'Mid-market FX rate is...'**
  String get quiz_fx_0_prompt;

  /// No description provided for @quiz_fx_0_opt0.
  ///
  /// In en, this message translates to:
  /// **'The rate banks usually charge retail clients'**
  String get quiz_fx_0_opt0;

  /// No description provided for @quiz_fx_0_opt1.
  ///
  /// In en, this message translates to:
  /// **'A reference rate between buy and sell'**
  String get quiz_fx_0_opt1;

  /// No description provided for @quiz_fx_0_opt2.
  ///
  /// In en, this message translates to:
  /// **'Always equal to 1.0'**
  String get quiz_fx_0_opt2;

  /// No description provided for @quiz_fx_0_opt3.
  ///
  /// In en, this message translates to:
  /// **'Only used for cash ATMs'**
  String get quiz_fx_0_opt3;

  /// No description provided for @quiz_fx_1_prompt.
  ///
  /// In en, this message translates to:
  /// **'A bank markup / spread means you typically...'**
  String get quiz_fx_1_prompt;

  /// No description provided for @quiz_fx_1_opt0.
  ///
  /// In en, this message translates to:
  /// **'Get a better rate than mid-market'**
  String get quiz_fx_1_opt0;

  /// No description provided for @quiz_fx_1_opt1.
  ///
  /// In en, this message translates to:
  /// **'Pay worse than mid-market'**
  String get quiz_fx_1_opt1;

  /// No description provided for @quiz_fx_1_opt2.
  ///
  /// In en, this message translates to:
  /// **'Avoid all fees forever'**
  String get quiz_fx_1_opt2;

  /// No description provided for @quiz_fx_1_opt3.
  ///
  /// In en, this message translates to:
  /// **'Lock tax rates'**
  String get quiz_fx_1_opt3;

  /// No description provided for @quiz_fx_2_prompt.
  ///
  /// In en, this message translates to:
  /// **'Holding foreign currency can change value because...'**
  String get quiz_fx_2_prompt;

  /// No description provided for @quiz_fx_2_opt0.
  ///
  /// In en, this message translates to:
  /// **'Exchange rates move over time'**
  String get quiz_fx_2_opt0;

  /// No description provided for @quiz_fx_2_opt1.
  ///
  /// In en, this message translates to:
  /// **'PINs expire daily'**
  String get quiz_fx_2_opt1;

  /// No description provided for @quiz_fx_2_opt2.
  ///
  /// In en, this message translates to:
  /// **'IBANs reset monthly'**
  String get quiz_fx_2_opt2;

  /// No description provided for @quiz_fx_2_opt3.
  ///
  /// In en, this message translates to:
  /// **'Cards cannot freeze'**
  String get quiz_fx_2_opt3;

  /// No description provided for @quiz_fx_3_prompt.
  ///
  /// In en, this message translates to:
  /// **'If the app is offline, a good FX feature should...'**
  String get quiz_fx_3_prompt;

  /// No description provided for @quiz_fx_3_opt0.
  ///
  /// In en, this message translates to:
  /// **'Crash immediately'**
  String get quiz_fx_3_opt0;

  /// No description provided for @quiz_fx_3_opt1.
  ///
  /// In en, this message translates to:
  /// **'Use a cached or fallback rate and say so'**
  String get quiz_fx_3_opt1;

  /// No description provided for @quiz_fx_3_opt2.
  ///
  /// In en, this message translates to:
  /// **'Invent random rates silently'**
  String get quiz_fx_3_opt2;

  /// No description provided for @quiz_fx_3_opt3.
  ///
  /// In en, this message translates to:
  /// **'Delete your wallet'**
  String get quiz_fx_3_opt3;

  /// No description provided for @quiz_atm_0_prompt.
  ///
  /// In en, this message translates to:
  /// **'You cannot withdraw more cash than...'**
  String get quiz_atm_0_prompt;

  /// No description provided for @quiz_atm_0_opt0.
  ///
  /// In en, this message translates to:
  /// **'Your available wallet balance (and ATM limits)'**
  String get quiz_atm_0_opt0;

  /// No description provided for @quiz_atm_0_opt1.
  ///
  /// In en, this message translates to:
  /// **'Yesterday’s FX mid-market'**
  String get quiz_atm_0_opt1;

  /// No description provided for @quiz_atm_0_opt2.
  ///
  /// In en, this message translates to:
  /// **'Your credit APR × 12'**
  String get quiz_atm_0_opt2;

  /// No description provided for @quiz_atm_0_opt3.
  ///
  /// In en, this message translates to:
  /// **'The number of missions completed'**
  String get quiz_atm_0_opt3;

  /// No description provided for @quiz_atm_1_prompt.
  ///
  /// In en, this message translates to:
  /// **'“Large bills” at an ATM usually means...'**
  String get quiz_atm_1_prompt;

  /// No description provided for @quiz_atm_1_opt0.
  ///
  /// In en, this message translates to:
  /// **'Prefer higher-denomination notes'**
  String get quiz_atm_1_opt0;

  /// No description provided for @quiz_atm_1_opt1.
  ///
  /// In en, this message translates to:
  /// **'Only coins are dispensed'**
  String get quiz_atm_1_opt1;

  /// No description provided for @quiz_atm_1_opt2.
  ///
  /// In en, this message translates to:
  /// **'Always empty the cassette'**
  String get quiz_atm_1_opt2;

  /// No description provided for @quiz_atm_1_opt3.
  ///
  /// In en, this message translates to:
  /// **'Ignore your balance'**
  String get quiz_atm_1_opt3;

  /// No description provided for @quiz_atm_2_prompt.
  ///
  /// In en, this message translates to:
  /// **'Why might two ATM dispense options show different note mixes?'**
  String get quiz_atm_2_prompt;

  /// No description provided for @quiz_atm_2_opt0.
  ///
  /// In en, this message translates to:
  /// **'Different note-picking strategies / machine settings'**
  String get quiz_atm_2_opt0;

  /// No description provided for @quiz_atm_2_opt1.
  ///
  /// In en, this message translates to:
  /// **'Because IBANs differ'**
  String get quiz_atm_2_opt1;

  /// No description provided for @quiz_atm_2_opt2.
  ///
  /// In en, this message translates to:
  /// **'Because CVV changes'**
  String get quiz_atm_2_opt2;

  /// No description provided for @quiz_atm_2_opt3.
  ///
  /// In en, this message translates to:
  /// **'Random wallpaper themes'**
  String get quiz_atm_2_opt3;

  /// No description provided for @quiz_atm_3_prompt.
  ///
  /// In en, this message translates to:
  /// **'Cash withdrawals typically...'**
  String get quiz_atm_3_prompt;

  /// No description provided for @quiz_atm_3_opt0.
  ///
  /// In en, this message translates to:
  /// **'Increase your deposit APY'**
  String get quiz_atm_3_opt0;

  /// No description provided for @quiz_atm_3_opt1.
  ///
  /// In en, this message translates to:
  /// **'Reduce the money left in your account'**
  String get quiz_atm_3_opt1;

  /// No description provided for @quiz_atm_3_opt2.
  ///
  /// In en, this message translates to:
  /// **'Create foreign tax credits automatically'**
  String get quiz_atm_3_opt2;

  /// No description provided for @quiz_atm_3_opt3.
  ///
  /// In en, this message translates to:
  /// **'Unlock phishing links'**
  String get quiz_atm_3_opt3;

  /// No description provided for @quiz_budgeting_0_prompt.
  ///
  /// In en, this message translates to:
  /// **'Positive cashflow means...'**
  String get quiz_budgeting_0_prompt;

  /// No description provided for @quiz_budgeting_0_opt0.
  ///
  /// In en, this message translates to:
  /// **'Expenses exceed income'**
  String get quiz_budgeting_0_opt0;

  /// No description provided for @quiz_budgeting_0_opt1.
  ///
  /// In en, this message translates to:
  /// **'Income exceeds expenses'**
  String get quiz_budgeting_0_opt1;

  /// No description provided for @quiz_budgeting_0_opt2.
  ///
  /// In en, this message translates to:
  /// **'Balance is exactly zero'**
  String get quiz_budgeting_0_opt2;

  /// No description provided for @quiz_budgeting_0_opt3.
  ///
  /// In en, this message translates to:
  /// **'You only use credit'**
  String get quiz_budgeting_0_opt3;

  /// No description provided for @quiz_budgeting_1_prompt.
  ///
  /// In en, this message translates to:
  /// **'Categorizing spend helps you...'**
  String get quiz_budgeting_1_prompt;

  /// No description provided for @quiz_budgeting_1_opt0.
  ///
  /// In en, this message translates to:
  /// **'See where money goes'**
  String get quiz_budgeting_1_opt0;

  /// No description provided for @quiz_budgeting_1_opt1.
  ///
  /// In en, this message translates to:
  /// **'Change the mid-market FX feed'**
  String get quiz_budgeting_1_opt1;

  /// No description provided for @quiz_budgeting_1_opt2.
  ///
  /// In en, this message translates to:
  /// **'Reset your PIN automatically'**
  String get quiz_budgeting_1_opt2;

  /// No description provided for @quiz_budgeting_1_opt3.
  ///
  /// In en, this message translates to:
  /// **'Skip KYC forever'**
  String get quiz_budgeting_1_opt3;

  /// No description provided for @quiz_budgeting_2_prompt.
  ///
  /// In en, this message translates to:
  /// **'A budget chart is most useful when...'**
  String get quiz_budgeting_2_prompt;

  /// No description provided for @quiz_budgeting_2_opt0.
  ///
  /// In en, this message translates to:
  /// **'You have both income and expense entries'**
  String get quiz_budgeting_2_opt0;

  /// No description provided for @quiz_budgeting_2_opt1.
  ///
  /// In en, this message translates to:
  /// **'You hide all numbers'**
  String get quiz_budgeting_2_opt1;

  /// No description provided for @quiz_budgeting_2_opt2.
  ///
  /// In en, this message translates to:
  /// **'You only track one ATM fee'**
  String get quiz_budgeting_2_opt2;

  /// No description provided for @quiz_budgeting_2_opt3.
  ///
  /// In en, this message translates to:
  /// **'You never save'**
  String get quiz_budgeting_2_opt3;

  /// No description provided for @quiz_transfers_0_prompt.
  ///
  /// In en, this message translates to:
  /// **'A valid IBAN-like id usually starts with...'**
  String get quiz_transfers_0_prompt;

  /// No description provided for @quiz_transfers_0_opt0.
  ///
  /// In en, this message translates to:
  /// **'Two letters (country) + check digits'**
  String get quiz_transfers_0_opt0;

  /// No description provided for @quiz_transfers_0_opt1.
  ///
  /// In en, this message translates to:
  /// **'Only emoji'**
  String get quiz_transfers_0_opt1;

  /// No description provided for @quiz_transfers_0_opt2.
  ///
  /// In en, this message translates to:
  /// **'Your CVV'**
  String get quiz_transfers_0_opt2;

  /// No description provided for @quiz_transfers_0_opt3.
  ///
  /// In en, this message translates to:
  /// **'A random GUID with spaces only'**
  String get quiz_transfers_0_opt3;

  /// No description provided for @quiz_transfers_1_prompt.
  ///
  /// In en, this message translates to:
  /// **'Before sending a transfer the app should check...'**
  String get quiz_transfers_1_prompt;

  /// No description provided for @quiz_transfers_1_opt0.
  ///
  /// In en, this message translates to:
  /// **'Format + sufficient funds'**
  String get quiz_transfers_1_opt0;

  /// No description provided for @quiz_transfers_1_opt1.
  ///
  /// In en, this message translates to:
  /// **'Only the weather'**
  String get quiz_transfers_1_opt1;

  /// No description provided for @quiz_transfers_1_opt2.
  ///
  /// In en, this message translates to:
  /// **'Only your XP level'**
  String get quiz_transfers_1_opt2;

  /// No description provided for @quiz_transfers_1_opt3.
  ///
  /// In en, this message translates to:
  /// **'Nothing - send immediately'**
  String get quiz_transfers_1_opt3;

  /// No description provided for @quiz_transfers_2_prompt.
  ///
  /// In en, this message translates to:
  /// **'A ledger debit for a transfer should be...'**
  String get quiz_transfers_2_prompt;

  /// No description provided for @quiz_transfers_2_opt0.
  ///
  /// In en, this message translates to:
  /// **'Negative amount out of your wallet'**
  String get quiz_transfers_2_opt0;

  /// No description provided for @quiz_transfers_2_opt1.
  ///
  /// In en, this message translates to:
  /// **'Always positive interest'**
  String get quiz_transfers_2_opt1;

  /// No description provided for @quiz_transfers_2_opt2.
  ///
  /// In en, this message translates to:
  /// **'Stored as a floating string'**
  String get quiz_transfers_2_opt2;

  /// No description provided for @quiz_transfers_2_opt3.
  ///
  /// In en, this message translates to:
  /// **'Written to the CVV field'**
  String get quiz_transfers_2_opt3;

  /// No description provided for @quiz_transfers_3_prompt.
  ///
  /// In en, this message translates to:
  /// **'Idempotency keys help prevent...'**
  String get quiz_transfers_3_prompt;

  /// No description provided for @quiz_transfers_3_opt0.
  ///
  /// In en, this message translates to:
  /// **'Double-posting the same transfer'**
  String get quiz_transfers_3_opt0;

  /// No description provided for @quiz_transfers_3_opt1.
  ///
  /// In en, this message translates to:
  /// **'Emoji flags on Windows'**
  String get quiz_transfers_3_opt1;

  /// No description provided for @quiz_transfers_3_opt2.
  ///
  /// In en, this message translates to:
  /// **'Card flip animations'**
  String get quiz_transfers_3_opt2;

  /// No description provided for @quiz_transfers_3_opt3.
  ///
  /// In en, this message translates to:
  /// **'Deposit APY'**
  String get quiz_transfers_3_opt3;

  /// No description provided for @quiz_credit_0_prompt.
  ///
  /// In en, this message translates to:
  /// **'Paying only the minimum on a credit balance often...'**
  String get quiz_credit_0_prompt;

  /// No description provided for @quiz_credit_0_opt0.
  ///
  /// In en, this message translates to:
  /// **'Maximizes interest paid over time'**
  String get quiz_credit_0_opt0;

  /// No description provided for @quiz_credit_0_opt1.
  ///
  /// In en, this message translates to:
  /// **'Deletes the debt instantly'**
  String get quiz_credit_0_opt1;

  /// No description provided for @quiz_credit_0_opt2.
  ///
  /// In en, this message translates to:
  /// **'Raises deposit APY'**
  String get quiz_credit_0_opt2;

  /// No description provided for @quiz_credit_0_opt3.
  ///
  /// In en, this message translates to:
  /// **'Removes FX markup'**
  String get quiz_credit_0_opt3;

  /// No description provided for @quiz_credit_1_prompt.
  ///
  /// In en, this message translates to:
  /// **'Debit cards spend...'**
  String get quiz_credit_1_prompt;

  /// No description provided for @quiz_credit_1_opt0.
  ///
  /// In en, this message translates to:
  /// **'Your own account money'**
  String get quiz_credit_1_opt0;

  /// No description provided for @quiz_credit_1_opt1.
  ///
  /// In en, this message translates to:
  /// **'Only the bank’s money forever'**
  String get quiz_credit_1_opt1;

  /// No description provided for @quiz_credit_1_opt2.
  ///
  /// In en, this message translates to:
  /// **'Unrelated IBANs'**
  String get quiz_credit_1_opt2;

  /// No description provided for @quiz_credit_1_opt3.
  ///
  /// In en, this message translates to:
  /// **'Cached FX rates'**
  String get quiz_credit_1_opt3;

  /// No description provided for @quiz_credit_2_prompt.
  ///
  /// In en, this message translates to:
  /// **'APR on credit is closest to...'**
  String get quiz_credit_2_prompt;

  /// No description provided for @quiz_credit_2_opt0.
  ///
  /// In en, this message translates to:
  /// **'Annual cost of borrowing'**
  String get quiz_credit_2_opt0;

  /// No description provided for @quiz_credit_2_opt1.
  ///
  /// In en, this message translates to:
  /// **'Your card’s CVV'**
  String get quiz_credit_2_opt1;

  /// No description provided for @quiz_credit_2_opt2.
  ///
  /// In en, this message translates to:
  /// **'ATM cassette capacity'**
  String get quiz_credit_2_opt2;

  /// No description provided for @quiz_credit_2_opt3.
  ///
  /// In en, this message translates to:
  /// **'Mission XP'**
  String get quiz_credit_2_opt3;

  /// No description provided for @quiz_security_0_prompt.
  ///
  /// In en, this message translates to:
  /// **'A good way to store a PIN locally is...'**
  String get quiz_security_0_prompt;

  /// No description provided for @quiz_security_0_opt0.
  ///
  /// In en, this message translates to:
  /// **'Plain text in a screenshot'**
  String get quiz_security_0_opt0;

  /// No description provided for @quiz_security_0_opt1.
  ///
  /// In en, this message translates to:
  /// **'A salted hash - never the raw PIN'**
  String get quiz_security_0_opt1;

  /// No description provided for @quiz_security_0_opt2.
  ///
  /// In en, this message translates to:
  /// **'Inside the card PAN field'**
  String get quiz_security_0_opt2;

  /// No description provided for @quiz_security_0_opt3.
  ///
  /// In en, this message translates to:
  /// **'In the FX cache table'**
  String get quiz_security_0_opt3;

  /// No description provided for @quiz_security_1_prompt.
  ///
  /// In en, this message translates to:
  /// **'A phishing SMS with a lookalike domain should be...'**
  String get quiz_security_1_prompt;

  /// No description provided for @quiz_security_1_opt0.
  ///
  /// In en, this message translates to:
  /// **'Opened immediately'**
  String get quiz_security_1_opt0;

  /// No description provided for @quiz_security_1_opt1.
  ///
  /// In en, this message translates to:
  /// **'Ignored / reported - do not tap'**
  String get quiz_security_1_opt1;

  /// No description provided for @quiz_security_1_opt2.
  ///
  /// In en, this message translates to:
  /// **'Forwarded with your CVV'**
  String get quiz_security_1_opt2;

  /// No description provided for @quiz_security_1_opt3.
  ///
  /// In en, this message translates to:
  /// **'Used to reset APY'**
  String get quiz_security_1_opt3;

  /// No description provided for @quiz_security_2_prompt.
  ///
  /// In en, this message translates to:
  /// **'Freezing a card is useful when...'**
  String get quiz_security_2_prompt;

  /// No description provided for @quiz_security_2_opt0.
  ///
  /// In en, this message translates to:
  /// **'You suspect loss or theft'**
  String get quiz_security_2_opt0;

  /// No description provided for @quiz_security_2_opt1.
  ///
  /// In en, this message translates to:
  /// **'You want higher interest'**
  String get quiz_security_2_opt1;

  /// No description provided for @quiz_security_2_opt2.
  ///
  /// In en, this message translates to:
  /// **'You change home markets'**
  String get quiz_security_2_opt2;

  /// No description provided for @quiz_security_2_opt3.
  ///
  /// In en, this message translates to:
  /// **'You complete a budget pie chart'**
  String get quiz_security_2_opt3;

  /// No description provided for @quiz_security_3_prompt.
  ///
  /// In en, this message translates to:
  /// **'MOFOBank never asks you for...'**
  String get quiz_security_3_prompt;

  /// No description provided for @quiz_security_3_opt0.
  ///
  /// In en, this message translates to:
  /// **'Real bank credentials / KYC documents'**
  String get quiz_security_3_opt0;

  /// No description provided for @quiz_security_3_opt1.
  ///
  /// In en, this message translates to:
  /// **'A display name'**
  String get quiz_security_3_opt1;

  /// No description provided for @quiz_security_3_opt2.
  ///
  /// In en, this message translates to:
  /// **'A home market'**
  String get quiz_security_3_opt2;

  /// No description provided for @quiz_security_3_opt3.
  ///
  /// In en, this message translates to:
  /// **'Quiz answers'**
  String get quiz_security_3_opt3;

  /// No description provided for @quiz_savings_0_prompt.
  ///
  /// In en, this message translates to:
  /// **'Funding a savings pot typically...'**
  String get quiz_savings_0_prompt;

  /// No description provided for @quiz_savings_0_opt0.
  ///
  /// In en, this message translates to:
  /// **'Moves money from your wallet into the goal'**
  String get quiz_savings_0_opt0;

  /// No description provided for @quiz_savings_0_opt1.
  ///
  /// In en, this message translates to:
  /// **'Prints cash at the ATM'**
  String get quiz_savings_0_opt1;

  /// No description provided for @quiz_savings_0_opt2.
  ///
  /// In en, this message translates to:
  /// **'Increases FX markup'**
  String get quiz_savings_0_opt2;

  /// No description provided for @quiz_savings_0_opt3.
  ///
  /// In en, this message translates to:
  /// **'Unlocks phishing links'**
  String get quiz_savings_0_opt3;

  /// No description provided for @quiz_savings_1_prompt.
  ///
  /// In en, this message translates to:
  /// **'A progress ring on a goal shows...'**
  String get quiz_savings_1_prompt;

  /// No description provided for @quiz_savings_1_opt0.
  ///
  /// In en, this message translates to:
  /// **'Saved amount vs target'**
  String get quiz_savings_1_opt0;

  /// No description provided for @quiz_savings_1_opt1.
  ///
  /// In en, this message translates to:
  /// **'Your CVV'**
  String get quiz_savings_1_opt1;

  /// No description provided for @quiz_savings_1_opt2.
  ///
  /// In en, this message translates to:
  /// **'Live mid-market only'**
  String get quiz_savings_1_opt2;

  /// No description provided for @quiz_savings_1_opt3.
  ///
  /// In en, this message translates to:
  /// **'Credit APR'**
  String get quiz_savings_1_opt3;

  /// No description provided for @quiz_savings_2_prompt.
  ///
  /// In en, this message translates to:
  /// **'Why separate goal pots from spending money?'**
  String get quiz_savings_2_prompt;

  /// No description provided for @quiz_savings_2_opt0.
  ///
  /// In en, this message translates to:
  /// **'Makes intentions visible and harder to overspend casually'**
  String get quiz_savings_2_opt0;

  /// No description provided for @quiz_savings_2_opt1.
  ///
  /// In en, this message translates to:
  /// **'Deletes the ledger'**
  String get quiz_savings_2_opt1;

  /// No description provided for @quiz_savings_2_opt2.
  ///
  /// In en, this message translates to:
  /// **'Removes tax forever'**
  String get quiz_savings_2_opt2;

  /// No description provided for @quiz_savings_2_opt3.
  ///
  /// In en, this message translates to:
  /// **'Disables transfers'**
  String get quiz_savings_2_opt3;

  /// No description provided for @lockTooltip.
  ///
  /// In en, this message translates to:
  /// **'Lock'**
  String get lockTooltip;

  /// No description provided for @learnerDefault.
  ///
  /// In en, this message translates to:
  /// **'Learner'**
  String get learnerDefault;

  /// No description provided for @marketTaxSummary.
  ///
  /// In en, this message translates to:
  /// **'{code} · interest tax ~{rate}%'**
  String marketTaxSummary(String code, String rate);

  /// No description provided for @continueLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue learning'**
  String get continueLearning;

  /// No description provided for @continueLearningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Missions unlock in order; sandboxes stay open after intro.'**
  String get continueLearningSubtitle;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @fx.
  ///
  /// In en, this message translates to:
  /// **'FX'**
  String get fx;

  /// No description provided for @atm.
  ///
  /// In en, this message translates to:
  /// **'ATM'**
  String get atm;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @boosts.
  ///
  /// In en, this message translates to:
  /// **'Boosts'**
  String get boosts;

  /// No description provided for @wipeAndCreate.
  ///
  /// In en, this message translates to:
  /// **'Wipe & create'**
  String get wipeAndCreate;

  /// No description provided for @yourPots.
  ///
  /// In en, this message translates to:
  /// **'Your pots'**
  String get yourPots;

  /// No description provided for @yourPotsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Wallet, cards, and deposits on this device.'**
  String get yourPotsSubtitle;

  /// No description provided for @cards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cards;

  /// No description provided for @cardLabel.
  ///
  /// In en, this message translates to:
  /// **'Card label'**
  String get cardLabel;

  /// No description provided for @virtualDebit.
  ///
  /// In en, this message translates to:
  /// **'Virtual Debit'**
  String get virtualDebit;

  /// No description provided for @issueNewCard.
  ///
  /// In en, this message translates to:
  /// **'Issue new card'**
  String get issueNewCard;

  /// No description provided for @deposits.
  ///
  /// In en, this message translates to:
  /// **'Deposits'**
  String get deposits;

  /// No description provided for @openDeposit.
  ///
  /// In en, this message translates to:
  /// **'Open deposit'**
  String get openDeposit;

  /// No description provided for @transferMoney.
  ///
  /// In en, this message translates to:
  /// **'Transfer money'**
  String get transferMoney;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @couldNotLoadCard.
  ///
  /// In en, this message translates to:
  /// **'Could not load card details'**
  String get couldNotLoadCard;

  /// No description provided for @cardNotFound.
  ///
  /// In en, this message translates to:
  /// **'Card not found'**
  String get cardNotFound;

  /// No description provided for @loadingCardDetails.
  ///
  /// In en, this message translates to:
  /// **'Loading card details...'**
  String get loadingCardDetails;

  /// No description provided for @cardFrozen.
  ///
  /// In en, this message translates to:
  /// **'Card is frozen'**
  String get cardFrozen;

  /// No description provided for @tapCardToFlip.
  ///
  /// In en, this message translates to:
  /// **'Tap card to flip'**
  String get tapCardToFlip;

  /// No description provided for @unfreezeCard.
  ///
  /// In en, this message translates to:
  /// **'Unfreeze card'**
  String get unfreezeCard;

  /// No description provided for @freezeCard.
  ///
  /// In en, this message translates to:
  /// **'Freeze card'**
  String get freezeCard;

  /// No description provided for @yourCard.
  ///
  /// In en, this message translates to:
  /// **'Your card'**
  String get yourCard;

  /// No description provided for @yourCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Flip to see the back. Details stay private until shown.'**
  String get yourCardSubtitle;

  /// No description provided for @pickDepositProduct.
  ///
  /// In en, this message translates to:
  /// **'Pick a product · 1 monthly + 2-3 daily rate styles'**
  String get pickDepositProduct;

  /// No description provided for @depositProducts.
  ///
  /// In en, this message translates to:
  /// **'Deposit products'**
  String get depositProducts;

  /// No description provided for @fundFrom.
  ///
  /// In en, this message translates to:
  /// **'Fund from'**
  String get fundFrom;

  /// No description provided for @principalMajor.
  ///
  /// In en, this message translates to:
  /// **'Principal (major)'**
  String get principalMajor;

  /// No description provided for @pickMofoUser.
  ///
  /// In en, this message translates to:
  /// **'Pick a MOFOBank user'**
  String get pickMofoUser;

  /// No description provided for @pickDestination.
  ///
  /// In en, this message translates to:
  /// **'Pick a destination'**
  String get pickDestination;

  /// No description provided for @transferSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Move money between your pots or to another MOFOBank user'**
  String get transferSubtitle;

  /// No description provided for @sendTransfer.
  ///
  /// In en, this message translates to:
  /// **'Send transfer'**
  String get sendTransfer;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @sourceAccount.
  ///
  /// In en, this message translates to:
  /// **'Source account'**
  String get sourceAccount;

  /// No description provided for @toMofoUser.
  ///
  /// In en, this message translates to:
  /// **'To MOFOBank user'**
  String get toMofoUser;

  /// No description provided for @betweenMyAccounts.
  ///
  /// In en, this message translates to:
  /// **'Between my accounts'**
  String get betweenMyAccounts;

  /// No description provided for @recipient.
  ///
  /// In en, this message translates to:
  /// **'Recipient'**
  String get recipient;

  /// No description provided for @destination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get destination;

  /// No description provided for @amountMajor.
  ///
  /// In en, this message translates to:
  /// **'Amount (major)'**
  String get amountMajor;

  /// No description provided for @budgeting.
  ///
  /// In en, this message translates to:
  /// **'Budgeting'**
  String get budgeting;

  /// No description provided for @incomeExpenses.
  ///
  /// In en, this message translates to:
  /// **'Income {income} · Expenses {expenses}'**
  String incomeExpenses(String income, String expenses);

  /// No description provided for @cashflow.
  ///
  /// In en, this message translates to:
  /// **'Cashflow'**
  String get cashflow;

  /// No description provided for @cashflowSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add categories - aim for income > expenses.'**
  String get cashflowSubtitle;

  /// No description provided for @inLabel.
  ///
  /// In en, this message translates to:
  /// **'In'**
  String get inLabel;

  /// No description provided for @outLabel.
  ///
  /// In en, this message translates to:
  /// **'Out'**
  String get outLabel;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @amountCurrencyMajor.
  ///
  /// In en, this message translates to:
  /// **'Amount ({code} major)'**
  String amountCurrencyMajor(String code);

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @expense.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expense;

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'Add item'**
  String get addItem;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @hideDetails.
  ///
  /// In en, this message translates to:
  /// **'Hide details'**
  String get hideDetails;

  /// No description provided for @showCardNumber.
  ///
  /// In en, this message translates to:
  /// **'Show card number'**
  String get showCardNumber;

  /// No description provided for @frozen.
  ///
  /// In en, this message translates to:
  /// **'FROZEN'**
  String get frozen;

  /// No description provided for @cvvWarning.
  ///
  /// In en, this message translates to:
  /// **'CVV - never share it.'**
  String get cvvWarning;

  /// No description provided for @openAccountsFirst.
  ///
  /// In en, this message translates to:
  /// **'Open Accounts to issue a card first'**
  String get openAccountsFirst;

  /// No description provided for @loadingYourCard.
  ///
  /// In en, this message translates to:
  /// **'Loading your card...'**
  String get loadingYourCard;

  /// No description provided for @exploreCardChallenge.
  ///
  /// In en, this message translates to:
  /// **'Explore the card, then finish the challenge'**
  String get exploreCardChallenge;

  /// No description provided for @yourDebitCard.
  ///
  /// In en, this message translates to:
  /// **'Your debit card'**
  String get yourDebitCard;

  /// No description provided for @yourDebitCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Balances live as integer minor units. Tap the card to flip.'**
  String get yourDebitCardSubtitle;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get credit;

  /// No description provided for @interestPaid.
  ///
  /// In en, this message translates to:
  /// **'Interest paid: {amount}'**
  String interestPaid(String amount);

  /// No description provided for @minimumPaymentTrap.
  ///
  /// In en, this message translates to:
  /// **'Minimum-payment trap'**
  String get minimumPaymentTrap;

  /// No description provided for @minimumPaymentTrapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Debit spends yours. Credit borrows - interest accrues.'**
  String get minimumPaymentTrapSubtitle;

  /// No description provided for @creditStartSummary.
  ///
  /// In en, this message translates to:
  /// **'Start {amount} @ 22% APR, ~2%/mo minimum'**
  String creditStartSummary(String amount);

  /// No description provided for @paidOffMonths.
  ///
  /// In en, this message translates to:
  /// **'Paid off in {count} months'**
  String paidOffMonths(int count);

  /// No description provided for @stillOpenMonths.
  ///
  /// In en, this message translates to:
  /// **'Still open after {count} months'**
  String stillOpenMonths(int count);

  /// No description provided for @depositsAndTax.
  ///
  /// In en, this message translates to:
  /// **'Deposits & tax'**
  String get depositsAndTax;

  /// No description provided for @compareTaxDrag.
  ///
  /// In en, this message translates to:
  /// **'Compare tax drag, then finish the challenge'**
  String get compareTaxDrag;

  /// No description provided for @marketPickedQuiz.
  ///
  /// In en, this message translates to:
  /// **'Market picked · answer every quiz question'**
  String get marketPickedQuiz;

  /// No description provided for @lodgementSandbox.
  ///
  /// In en, this message translates to:
  /// **'Lodgement sandbox'**
  String get lodgementSandbox;

  /// No description provided for @lodgementSandboxSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Same principal & APY; only withholding tax differs by country.'**
  String get lodgementSandboxSubtitle;

  /// No description provided for @principalApy.
  ///
  /// In en, this message translates to:
  /// **'Principal: {amount} @ {apy}% APY'**
  String principalApy(String amount, String apy);

  /// No description provided for @homeNetTax.
  ///
  /// In en, this message translates to:
  /// **'Home net {net} (tax {tax})'**
  String homeNetTax(String net, String tax);

  /// No description provided for @lowestTaxDrag.
  ///
  /// In en, this message translates to:
  /// **'Lowest tax drag'**
  String get lowestTaxDrag;

  /// No description provided for @lowestTaxDragSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Which market leaves the highest net interest?'**
  String get lowestTaxDragSubtitle;

  /// No description provided for @couldNotLoadRate.
  ///
  /// In en, this message translates to:
  /// **'Could not load exchange rate'**
  String get couldNotLoadRate;

  /// No description provided for @fxSpreadDescription.
  ///
  /// In en, this message translates to:
  /// **'FX conversion spread ({pair})'**
  String fxSpreadDescription(String pair);

  /// No description provided for @updatingRate.
  ///
  /// In en, this message translates to:
  /// **'Updating exchange rate...'**
  String get updatingRate;

  /// No description provided for @cachedRate.
  ///
  /// In en, this message translates to:
  /// **'Cached rate'**
  String get cachedRate;

  /// No description provided for @liveRate.
  ///
  /// In en, this message translates to:
  /// **'Live rate'**
  String get liveRate;

  /// No description provided for @exchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// No description provided for @exchangeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Convert between currencies. The bank rate includes a small spread.'**
  String get exchangeSubtitle;

  /// No description provided for @amountCurrency.
  ///
  /// In en, this message translates to:
  /// **'Amount ({code})'**
  String amountCurrency(String code);

  /// No description provided for @convertTo.
  ///
  /// In en, this message translates to:
  /// **'Convert to'**
  String get convertTo;

  /// No description provided for @cashDispensed.
  ///
  /// In en, this message translates to:
  /// **'Cash dispensed - finish the challenge to settle'**
  String get cashDispensed;

  /// No description provided for @availableAmount.
  ///
  /// In en, this message translates to:
  /// **'Available {amount}'**
  String availableAmount(String amount);

  /// No description provided for @dispense.
  ///
  /// In en, this message translates to:
  /// **'Dispense'**
  String get dispense;

  /// No description provided for @settle.
  ///
  /// In en, this message translates to:
  /// **'Settle'**
  String get settle;

  /// No description provided for @withdrawCash.
  ///
  /// In en, this message translates to:
  /// **'Withdraw cash'**
  String get withdrawCash;

  /// No description provided for @withdrawCashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick an amount from your wallet. The ATM offers different note packs - large bills, fewest notes, or smaller notes for change.'**
  String get withdrawCashSubtitle;

  /// No description provided for @notesInCassette.
  ///
  /// In en, this message translates to:
  /// **'Notes in cassette: {notes} {code}'**
  String notesInCassette(String notes, String code);

  /// No description provided for @multiplesMax.
  ///
  /// In en, this message translates to:
  /// **'Multiples of {step} - max {max}'**
  String multiplesMax(int step, int max);

  /// No description provided for @largeBills.
  ///
  /// In en, this message translates to:
  /// **'Large bills'**
  String get largeBills;

  /// No description provided for @largeBillsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fast pick - highest denominations first'**
  String get largeBillsSubtitle;

  /// No description provided for @fewestNotes.
  ///
  /// In en, this message translates to:
  /// **'Fewest notes'**
  String get fewestNotes;

  /// No description provided for @fewestNotesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Optimal cassette mix (may take longer to compute)'**
  String get fewestNotesSubtitle;

  /// No description provided for @smallerNotes.
  ///
  /// In en, this message translates to:
  /// **'Smaller notes'**
  String get smallerNotes;

  /// No description provided for @smallerNotesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Useful when you want change for spending'**
  String get smallerNotesSubtitle;

  /// No description provided for @noteCountBreakdown.
  ///
  /// In en, this message translates to:
  /// **'{count} notes - {breakdown}'**
  String noteCountBreakdown(int count, String breakdown);

  /// No description provided for @cannotMakeAmount.
  ///
  /// In en, this message translates to:
  /// **'Cannot make this amount with this pack'**
  String get cannotMakeAmount;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @securityInitialStatus.
  ///
  /// In en, this message translates to:
  /// **'Set a PIN, verify it, try freeze'**
  String get securityInitialStatus;

  /// No description provided for @pinAndFreeze.
  ///
  /// In en, this message translates to:
  /// **'PIN & freeze'**
  String get pinAndFreeze;

  /// No description provided for @pinAndFreezeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'PIN is hashed locally. Freeze is a local card flag.'**
  String get pinAndFreezeSubtitle;

  /// No description provided for @pinSaved.
  ///
  /// In en, this message translates to:
  /// **'PIN saved (hashed)'**
  String get pinSaved;

  /// No description provided for @savePin.
  ///
  /// In en, this message translates to:
  /// **'Save PIN'**
  String get savePin;

  /// No description provided for @verifyPin.
  ///
  /// In en, this message translates to:
  /// **'Verify PIN'**
  String get verifyPin;

  /// No description provided for @pinVerified.
  ///
  /// In en, this message translates to:
  /// **'PIN verified'**
  String get pinVerified;

  /// No description provided for @cardUnfrozen.
  ///
  /// In en, this message translates to:
  /// **'Card unfrozen'**
  String get cardUnfrozen;

  /// No description provided for @transfers.
  ///
  /// In en, this message translates to:
  /// **'Transfers'**
  String get transfers;

  /// No description provided for @p2pTransfer.
  ///
  /// In en, this message translates to:
  /// **'P2P transfer'**
  String get p2pTransfer;

  /// No description provided for @transferPosted.
  ///
  /// In en, this message translates to:
  /// **'Transfer posted to ledger'**
  String get transferPosted;

  /// No description provided for @validateThenSend.
  ///
  /// In en, this message translates to:
  /// **'Validate IBAN + amount, then send'**
  String get validateThenSend;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @simulatedP2p.
  ///
  /// In en, this message translates to:
  /// **'Simulated P2P'**
  String get simulatedP2p;

  /// No description provided for @simulatedP2pSubtitle.
  ///
  /// In en, this message translates to:
  /// **'IBAN-like validation + ledger debit.'**
  String get simulatedP2pSubtitle;

  /// No description provided for @beneficiaryIban.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary IBAN'**
  String get beneficiaryIban;

  /// No description provided for @inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// No description provided for @inventorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Boosts are optional. Core lessons stay free.'**
  String get inventorySubtitle;

  /// No description provided for @inventorySummary.
  ///
  /// In en, this message translates to:
  /// **'Hints: {hints} · Retries: {retries} · Badge: {badge}'**
  String inventorySummary(int hints, int retries, String badge);

  /// No description provided for @on.
  ///
  /// In en, this message translates to:
  /// **'on'**
  String get on;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'off'**
  String get off;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @owned.
  ///
  /// In en, this message translates to:
  /// **'Owned'**
  String get owned;

  /// No description provided for @purchased.
  ///
  /// In en, this message translates to:
  /// **'Purchased {title}'**
  String purchased(String title);

  /// No description provided for @countryFlag.
  ///
  /// In en, this message translates to:
  /// **'{code} flag'**
  String countryFlag(String code);

  /// No description provided for @confirmIdentity.
  ///
  /// In en, this message translates to:
  /// **'Confirm it\'s you'**
  String get confirmIdentity;

  /// No description provided for @devicePinHelper.
  ///
  /// In en, this message translates to:
  /// **'4-6 digits'**
  String get devicePinHelper;

  /// No description provided for @savings.
  ///
  /// In en, this message translates to:
  /// **'Savings'**
  String get savings;

  /// No description provided for @savingsGoals.
  ///
  /// In en, this message translates to:
  /// **'Savings goals'**
  String get savingsGoals;

  /// No description provided for @savingsGoalsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fund from wallet - progress rings.'**
  String get savingsGoalsSubtitle;

  /// No description provided for @goalName.
  ///
  /// In en, this message translates to:
  /// **'Goal name'**
  String get goalName;

  /// No description provided for @targetCurrencyMajor.
  ///
  /// In en, this message translates to:
  /// **'Target ({code} major)'**
  String targetCurrencyMajor(String code);

  /// No description provided for @createGoal.
  ///
  /// In en, this message translates to:
  /// **'Create goal'**
  String get createGoal;

  /// No description provided for @fundAmount.
  ///
  /// In en, this message translates to:
  /// **'Fund +{amount}'**
  String fundAmount(String amount);

  /// No description provided for @setPinLabel.
  ///
  /// In en, this message translates to:
  /// **'Set 4-6-digit PIN'**
  String get setPinLabel;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @freezePrimaryCard.
  ///
  /// In en, this message translates to:
  /// **'Freeze primary card'**
  String get freezePrimaryCard;

  /// No description provided for @goalFunded.
  ///
  /// In en, this message translates to:
  /// **'Goal funded from wallet'**
  String get goalFunded;

  /// No description provided for @createThenFund.
  ///
  /// In en, this message translates to:
  /// **'Create a pot, then fund it'**
  String get createThenFund;

  /// No description provided for @goalPots.
  ///
  /// In en, this message translates to:
  /// **'Goal pots'**
  String get goalPots;

  /// No description provided for @emergencyPot.
  ///
  /// In en, this message translates to:
  /// **'Emergency pot'**
  String get emergencyPot;

  /// No description provided for @fundGoalDescription.
  ///
  /// In en, this message translates to:
  /// **'Fund goal: {title}'**
  String fundGoalDescription(String title);

  /// No description provided for @atmCashDescription.
  ///
  /// In en, this message translates to:
  /// **'ATM cash {pack} · {notes}'**
  String atmCashDescription(String pack, String notes);

  /// No description provided for @showingCachedRate.
  ///
  /// In en, this message translates to:
  /// **'Showing last known rate'**
  String get showingCachedRate;

  /// No description provided for @showingEstimatedRate.
  ///
  /// In en, this message translates to:
  /// **'Estimated rate - nothing saved yet'**
  String get showingEstimatedRate;

  /// No description provided for @ratesReady.
  ///
  /// In en, this message translates to:
  /// **'Rates ready'**
  String get ratesReady;

  /// No description provided for @includesBankSpread.
  ///
  /// In en, this message translates to:
  /// **'Includes bank spread'**
  String get includesBankSpread;

  /// No description provided for @youReceive.
  ///
  /// In en, this message translates to:
  /// **'You receive ≈ {amount}'**
  String youReceive(String amount);

  /// No description provided for @walletAmount.
  ///
  /// In en, this message translates to:
  /// **'Wallet: {amount}'**
  String walletAmount(String amount);

  /// No description provided for @cvvLabel.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cvvLabel;

  /// No description provided for @boostHintTitle.
  ///
  /// In en, this message translates to:
  /// **'Hint pack'**
  String get boostHintTitle;

  /// No description provided for @boostHintDescription.
  ///
  /// In en, this message translates to:
  /// **'Highlights the correct quiz answer once (3 hints).'**
  String get boostHintDescription;

  /// No description provided for @boostRetryTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz retry'**
  String get boostRetryTitle;

  /// No description provided for @boostRetryDescription.
  ///
  /// In en, this message translates to:
  /// **'Clears your current quiz answers to try again (1 use).'**
  String get boostRetryDescription;

  /// No description provided for @boostBadgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Teal badge'**
  String get boostBadgeTitle;

  /// No description provided for @boostBadgeDescription.
  ///
  /// In en, this message translates to:
  /// **'Cosmetic badge on Home.'**
  String get boostBadgeDescription;

  /// No description provided for @depositFlexTitle.
  ///
  /// In en, this message translates to:
  /// **'Flex Daily'**
  String get depositFlexTitle;

  /// No description provided for @depositFlexSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Spend-friendly pot · interest every day'**
  String get depositFlexSubtitle;

  /// No description provided for @depositSaverTitle.
  ///
  /// In en, this message translates to:
  /// **'Saver Daily'**
  String get depositSaverTitle;

  /// No description provided for @depositSaverSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Higher daily rate · still liquid'**
  String get depositSaverSubtitle;

  /// No description provided for @depositTermTitle.
  ///
  /// In en, this message translates to:
  /// **'Term Monthly'**
  String get depositTermTitle;

  /// No description provided for @depositTermSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Classic term-style · paid monthly'**
  String get depositTermSubtitle;

  /// No description provided for @depositPremiumTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium Monthly'**
  String get depositPremiumTitle;

  /// No description provided for @depositPremiumSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Best monthly rate · educational demo'**
  String get depositPremiumSubtitle;

  /// No description provided for @ratePerDay.
  ///
  /// In en, this message translates to:
  /// **'{pct}% / day'**
  String ratePerDay(String pct);

  /// No description provided for @ratePerMonth.
  ///
  /// In en, this message translates to:
  /// **'{pct}% / month'**
  String ratePerMonth(String pct);

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong: {error}'**
  String errorGeneric(String error);

  /// No description provided for @ledgerWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome balance'**
  String get ledgerWelcome;

  /// No description provided for @ledgerDepositOpened.
  ///
  /// In en, this message translates to:
  /// **'Deposit opened'**
  String get ledgerDepositOpened;

  /// No description provided for @ledgerOpenDeposit.
  ///
  /// In en, this message translates to:
  /// **'Open deposit: {title}'**
  String ledgerOpenDeposit(String title);

  /// No description provided for @ledgerAccrued.
  ///
  /// In en, this message translates to:
  /// **'Accrued {title}'**
  String ledgerAccrued(String title);

  /// No description provided for @ledgerLevelStipend.
  ///
  /// In en, this message translates to:
  /// **'Level {level} stipend'**
  String ledgerLevelStipend(String level);

  /// No description provided for @ledgerBoost.
  ///
  /// In en, this message translates to:
  /// **'Boost: {title}'**
  String ledgerBoost(String title);

  /// No description provided for @ledgerTransferOut.
  ///
  /// In en, this message translates to:
  /// **'Transfer out'**
  String get ledgerTransferOut;

  /// No description provided for @ledgerTransferIn.
  ///
  /// In en, this message translates to:
  /// **'Transfer in'**
  String get ledgerTransferIn;

  /// No description provided for @ledgerP2pTo.
  ///
  /// In en, this message translates to:
  /// **'P2P to @{handle}'**
  String ledgerP2pTo(String handle);

  /// No description provided for @ledgerMissionSettle.
  ///
  /// In en, this message translates to:
  /// **'{title} settlement ({percent}%)'**
  String ledgerMissionSettle(String title, String percent);

  /// No description provided for @ledgerFxSpread.
  ///
  /// In en, this message translates to:
  /// **'FX conversion spread ({pair})'**
  String ledgerFxSpread(String pair);

  /// No description provided for @ledgerAtmCash.
  ///
  /// In en, this message translates to:
  /// **'ATM cash {pack} · {notes}'**
  String ledgerAtmCash(String pack, String notes);

  /// No description provided for @ledgerGoalFund.
  ///
  /// In en, this message translates to:
  /// **'Fund goal: {title}'**
  String ledgerGoalFund(String title);

  /// No description provided for @ledgerTypeStipend.
  ///
  /// In en, this message translates to:
  /// **'Stipend'**
  String get ledgerTypeStipend;

  /// No description provided for @ledgerTypeMission.
  ///
  /// In en, this message translates to:
  /// **'Mission'**
  String get ledgerTypeMission;

  /// No description provided for @ledgerTypeTransferOut.
  ///
  /// In en, this message translates to:
  /// **'Transfer out'**
  String get ledgerTypeTransferOut;

  /// No description provided for @ledgerTypeTransferIn.
  ///
  /// In en, this message translates to:
  /// **'Transfer in'**
  String get ledgerTypeTransferIn;

  /// No description provided for @ledgerTypeFx.
  ///
  /// In en, this message translates to:
  /// **'FX'**
  String get ledgerTypeFx;

  /// No description provided for @ledgerTypeAtm.
  ///
  /// In en, this message translates to:
  /// **'ATM'**
  String get ledgerTypeAtm;

  /// No description provided for @ledgerTypeBoost.
  ///
  /// In en, this message translates to:
  /// **'Boost'**
  String get ledgerTypeBoost;

  /// No description provided for @ledgerTypeGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get ledgerTypeGoal;

  /// No description provided for @ledgerTypeDepositInterest.
  ///
  /// In en, this message translates to:
  /// **'Deposit interest'**
  String get ledgerTypeDepositInterest;

  /// No description provided for @ledgerTypeCreditCharge.
  ///
  /// In en, this message translates to:
  /// **'Credit charge'**
  String get ledgerTypeCreditCharge;

  /// No description provided for @ledgerTypeCreditPayment.
  ///
  /// In en, this message translates to:
  /// **'Credit payment'**
  String get ledgerTypeCreditPayment;

  /// No description provided for @ledgerTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get ledgerTypeOther;

  /// No description provided for @accountMainWallet.
  ///
  /// In en, this message translates to:
  /// **'Main wallet'**
  String get accountMainWallet;

  /// No description provided for @cardDebitPrimary.
  ///
  /// In en, this message translates to:
  /// **'Debit · Primary'**
  String get cardDebitPrimary;

  /// No description provided for @errorNotOnboarded.
  ///
  /// In en, this message translates to:
  /// **'Finish onboarding first'**
  String get errorNotOnboarded;

  /// No description provided for @errorPrincipalPositive.
  ///
  /// In en, this message translates to:
  /// **'Principal must be positive'**
  String get errorPrincipalPositive;

  /// No description provided for @errorAmountPositive.
  ///
  /// In en, this message translates to:
  /// **'Amount must be positive'**
  String get errorAmountPositive;

  /// No description provided for @errorInsufficientFunds.
  ///
  /// In en, this message translates to:
  /// **'Insufficient funds'**
  String get errorInsufficientFunds;

  /// No description provided for @errorInsufficientFundsBoost.
  ///
  /// In en, this message translates to:
  /// **'Insufficient funds for this boost'**
  String get errorInsufficientFundsBoost;

  /// No description provided for @errorChooseDifferentAccounts.
  ///
  /// In en, this message translates to:
  /// **'Choose different accounts'**
  String get errorChooseDifferentAccounts;

  /// No description provided for @errorCrossCurrency.
  ///
  /// In en, this message translates to:
  /// **'Cross-currency transfer is not supported in this demo'**
  String get errorCrossCurrency;

  /// No description provided for @errorSourceCardFrozen.
  ///
  /// In en, this message translates to:
  /// **'Source card is frozen'**
  String get errorSourceCardFrozen;

  /// No description provided for @errorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'MOFOBank user @{handle} not found'**
  String errorUserNotFound(String handle);

  /// No description provided for @errorCardTokenNotFound.
  ///
  /// In en, this message translates to:
  /// **'Card details were not found in the vault'**
  String get errorCardTokenNotFound;

  /// No description provided for @errorInvalidDepositProduct.
  ///
  /// In en, this message translates to:
  /// **'Unknown deposit product'**
  String get errorInvalidDepositProduct;

  /// No description provided for @errorInvalidAccountNameKey.
  ///
  /// In en, this message translates to:
  /// **'Unknown account label key'**
  String get errorInvalidAccountNameKey;

  /// No description provided for @errorInvalidLedgerType.
  ///
  /// In en, this message translates to:
  /// **'Unknown ledger type'**
  String get errorInvalidLedgerType;

  /// No description provided for @errorInvalidLedgerDescription.
  ///
  /// In en, this message translates to:
  /// **'Unknown ledger description key'**
  String get errorInvalidLedgerDescription;

  /// No description provided for @errorInvalidAtmPack.
  ///
  /// In en, this message translates to:
  /// **'Unknown ATM note pack'**
  String get errorInvalidAtmPack;

  /// No description provided for @errorCurrencyMismatch.
  ///
  /// In en, this message translates to:
  /// **'Currency mismatch'**
  String get errorCurrencyMismatch;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorUnknown;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
