import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:mofobank/data/repositories/providers.dart';
import 'package:mofobank/data/repositories/session_controller.dart';
import 'package:mofobank/data/services/device_unlock.dart';
import 'package:mofobank/domain/markets/market.dart';
import 'package:mofobank/features/shared/widgets/appearance_prefs.dart';
import 'package:mofobank/features/shared/widgets/country_flag.dart';
import 'package:mofobank/l10n/app_localizations.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  String? _selectedMarketId;
  late final TextEditingController _nameController;
  final _handleController = TextEditingController(text: 'learner');
  final _pinController = TextEditingController();
  final _pinConfirm = TextEditingController();
  bool _busy = false;
  String? _error;
  bool _enableBiometrics = true;
  bool _bioSupported = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _probeBiometrics();
  }

  Future<void> _probeBiometrics() async {
    final security = ref.read(securityRepositoryProvider);
    final available = await DeviceUnlock(security).isAvailable();
    if (!mounted) {
      return;
    }
    setState(() {
      _bioSupported = available;
      _enableBiometrics = available;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _handleController.dispose();
    _pinController.dispose();
    _pinConfirm.dispose();
    super.dispose();
  }

  Future<void> _continue(AppLocalizations l10n) async {
    final id = _selectedMarketId;
    if (id == null) {
      return;
    }
    if (_pinController.text.length < 4 ||
        _pinController.text.length > 6 ||
        !_pinController.text.contains(RegExp(r'^\d{4,6}$'))) {
      setState(() => _error = l10n.pinMustBe4or6);
      return;
    }
    if (_pinController.text != _pinConfirm.text) {
      setState(() => _error = l10n.pinMismatch);
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final name = _nameController.text.trim().isEmpty
          ? l10n.learnerDefault
          : _nameController.text.trim();
      final handle = _handleController.text.trim().isEmpty
          ? 'learner'
          : _handleController.text.trim();

      await ref.read(securityRepositoryProvider).setPin(_pinController.text);
      await ref
          .read(bankRepositoryProvider)
          .completeOnboarding(marketId: id, displayName: name, handle: handle);
      if (_bioSupported && _enableBiometrics) {
        await ref.read(bankRepositoryProvider).setBiometricsEnabled(true);
      }
      await ref.read(sessionControllerProvider.notifier).markOnboarded();
      ref.invalidate(onboardedProvider);
      ref.invalidate(bankSnapshotProvider);
      if (mounted) {
        context.go('/home');
      }
    } catch (e) {
      setState(() => _error = localizedError(context.l10n, e));
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (_nameController.text.isEmpty) {
      _nameController.text = l10n.learnerDefault;
    }
    final pinReady =
        _pinController.text.length >= 4 &&
        _pinController.text.length <= 6 &&
        _pinConfirm.text.length >= 4 &&
        _pinConfirm.text.length <= 6 &&
        _pinController.text == _pinConfirm.text;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.appTitle,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: MofoColors.of(context).accent,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.onboardingBlurb,
                style: TextStyle(
                  color: MofoColors.of(context).textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              const AppearancePrefs(compact: true),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 6),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        label: Text(
                          l10n.displayName,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: MofoColors.of(context).textSecondary,
                              ),
                        ),
                        hintText: l10n.learnerDefault,
                      ),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: _handleController,
                      decoration: InputDecoration(
                        label: Text(
                          l10n.handleLabel,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: MofoColors.of(context).textSecondary,
                              ),
                        ),
                        hintText: l10n.learnerDefault.toLowerCase(),
                        helperText: l10n.handleHelper,
                      ),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: _pinController,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        label: Text(
                          l10n.appPin,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: MofoColors.of(context).textSecondary,
                              ),
                        ),
                        hintText: '••••••',
                        helperText: l10n.pinHelper,
                        counterText: '',
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 18),
                    TextField(
                      controller: _pinConfirm,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        label: Text(
                          l10n.confirmPin,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: MofoColors.of(context).textSecondary,
                              ),
                        ),
                        hintText: '••••••',
                        helperText: l10n.confirmPinHelper,
                        counterText: '',
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    if (_bioSupported) ...[
                      const SizedBox(height: 8),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(l10n.unlockWithBiometrics),
                        subtitle: Text(l10n.unlockWithBiometricsSub),
                        value: _enableBiometrics,
                        activeThumbColor: MofoColors.of(context).accent,
                        onChanged: (v) => setState(() => _enableBiometrics = v),
                      ),
                    ],
                    if (_error != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 4),
                        child: Text(
                          _error!,
                          style: TextStyle(
                            color: MofoColors.of(context).danger,
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.homeMarket,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    ...MarketsCatalog.all.map((m) {
                      final selected = _selectedMarketId == m.id;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Material(
                          color: selected
                              ? MofoColors.of(context).accentDim
                                    .withValues(alpha: 0.35)
                              : MofoColors.of(context).surface,
                          borderRadius: BorderRadius.circular(14),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: () =>
                                setState(() => _selectedMarketId = m.id),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: Row(
                                children: [
                                  CountryFlag(marketId: m.id, size: 28),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          localizedMarketName(l10n, m.id),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          l10n.marketTaxSummary(
                                            m.currencyCode,
                                            (m.interestWithholdingTaxRate * 100)
                                                .toStringAsFixed(0),
                                          ),
                                          style: TextStyle(
                                            color: MofoColors.of(context)
                                                .textSecondary,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (selected)
                                    Icon(
                                      Icons.check_circle,
                                      color: MofoColors.of(context).accent,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _busy || _selectedMarketId == null || !pinReady
                    ? null
                    : () => _continue(l10n),
                child: _busy
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(l10n.openMyWallet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
