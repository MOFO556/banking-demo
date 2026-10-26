import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mofobank/app/router.dart';
import 'package:mofobank/core/theme/mofo_theme.dart';
import 'package:mofobank/data/repositories/app_prefs_controller.dart';
import 'package:mofobank/l10n/app_localizations.dart';

class MofoBankApp extends ConsumerWidget {
  const MofoBankApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final prefs = ref.watch(appPrefsProvider);
    return MaterialApp.router(
      title: 'MOFOBank',
      debugShowCheckedModeBanner: false,
      theme: buildMofoTheme(Brightness.light),
      darkTheme: buildMofoTheme(Brightness.dark),
      themeMode: prefs.themeMode,
      locale: prefs.locale,
      supportedLocales: AppPrefsController.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: router,
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        final insets = mq.viewInsets;
        final safeInsets = EdgeInsets.only(
          left: math.max(0, insets.left),
          top: math.max(0, insets.top),
          right: math.max(0, insets.right),
          bottom: math.max(0, insets.bottom),
        );
        final padding = mq.padding;
        final safePadding = EdgeInsets.only(
          left: math.max(0, padding.left),
          top: math.max(0, padding.top),
          right: math.max(0, padding.right),
          bottom: math.max(0, padding.bottom),
        );
        return MediaQuery(
          data: mq.copyWith(viewInsets: safeInsets, padding: safePadding),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
