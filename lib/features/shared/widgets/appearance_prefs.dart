import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofobank/data/repositories/app_prefs_controller.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

class AppearancePrefs extends ConsumerWidget {
  const AppearancePrefs({super.key, this.compact = false});
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final prefs = ref.watch(appPrefsProvider);

    final themeMenu = DropdownButton<ThemeMode>(
      value: prefs.themeMode,
      underline: const SizedBox.shrink(),
      items: [
        DropdownMenuItem(value: ThemeMode.dark, child: Text(l10n.themeDark)),
        DropdownMenuItem(value: ThemeMode.light, child: Text(l10n.themeLight)),
        DropdownMenuItem(
          value: ThemeMode.system,
          child: Text(l10n.themeSystem),
        ),
      ],
      onChanged: (mode) {
        if (mode == null) return;
        ref.read(appPrefsProvider.notifier).setThemeMode(mode);
      },
    );

    final langMenu = DropdownButton<String>(
      value: prefs.locale.languageCode,
      underline: const SizedBox.shrink(),
      items: [
        DropdownMenuItem(value: 'en', child: Text(l10n.langEn)),
        DropdownMenuItem(value: 'ru', child: Text(l10n.langRu)),
        DropdownMenuItem(value: 'uz', child: Text(l10n.langUz)),
      ],
      onChanged: (code) {
        if (code == null) return;
        ref.read(appPrefsProvider.notifier).setLocale(Locale(code));
      },
    );

    if (compact) {
      return Row(
        children: [
          Expanded(
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: l10n.settingsLanguage,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
              ),
              child: DropdownButtonHideUnderline(child: langMenu),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: l10n.settingsTheme,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
              ),
              child: DropdownButtonHideUnderline(child: themeMenu),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.settingsTheme),
          trailing: themeMenu,
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.settingsLanguage),
          subtitle: Text(switch (prefs.locale.languageCode) {
            'ru' => l10n.langRu,
            'uz' => l10n.langUz,
            _ => l10n.langEn,
          }),
          trailing: langMenu,
        ),
      ],
    );
  }
}
