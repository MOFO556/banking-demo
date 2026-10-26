import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefsState {
  const AppPrefsState({required this.themeMode, required this.locale});

  final ThemeMode themeMode;
  final Locale locale;

  AppPrefsState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return AppPrefsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}

class AppPrefsController extends StateNotifier<AppPrefsState> {
  AppPrefsController()
    : super(
        const AppPrefsState(themeMode: ThemeMode.dark, locale: Locale('en')),
      ) {
    _load();
  }

  static const _themeKey = 'mofobank_theme_mode';
  static const _localeKey = 'mofobank_locale';

  static const supportedLocales = [Locale('en'), Locale('ru'), Locale('uz')];

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final themeRaw = prefs.getString(_themeKey);
    final localeRaw = prefs.getString(_localeKey) ?? 'en';
    state = AppPrefsState(
      themeMode: switch (themeRaw) {
        'light' => ThemeMode.light,
        'system' => ThemeMode.system,
        _ => ThemeMode.dark,
      },
      locale: Locale(localeRaw),
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.system => 'system',
      ThemeMode.dark => 'dark',
    });
  }

  Future<void> setLocale(Locale locale) async {
    state = state.copyWith(locale: locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }
}

final appPrefsProvider =
    StateNotifierProvider<AppPrefsController, AppPrefsState>((ref) {
      return AppPrefsController();
    });

/// Resolves the active palette from theme mode + platform brightness.
final mofoColorsProvider = Provider<MofoColors>((ref) {
  final mode = ref.watch(appPrefsProvider).themeMode;
  // system → treat as dark for palette outside MaterialApp
  final light = mode == ThemeMode.light;
  return light ? MofoColors.light : MofoColors.dark;
});
