import 'package:flutter/material.dart';

/// MOFOBank palette as a [ThemeExtension] so light/dark can switch cleanly.
@immutable
class MofoColors extends ThemeExtension<MofoColors> {
  const MofoColors({
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.border,
    required this.accent,
    required this.accentDim,
    required this.textPrimary,
    required this.textSecondary,
    required this.textAlt,
    required this.danger,
    required this.warning,
    required this.success,
    required this.cardFront,
    required this.cardBack,
  });

  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color border;
  final Color accent;
  final Color accentDim;
  final Color textPrimary;
  final Color textSecondary;
  final Color textAlt;
  final Color danger;
  final Color warning;
  final Color success;
  final Color cardFront;
  final Color cardBack;

  static const dark = MofoColors(
    background: Color(0xFF0B0F14),
    surface: Color(0xFF121820),
    surfaceElevated: Color(0xFF1A222D),
    border: Color(0xFF2A3441),
    accent: Color(0xFF2DD4BF),
    accentDim: Color(0xFF0F766E),
    textPrimary: Color(0xFFF3F6FA),
    textSecondary: Color(0xFF9AA7B8),
    textAlt: Color(0xFF1E293B),
    danger: Color(0xFFF87171),
    warning: Color(0xFFFBBF24),
    success: Color(0xFF34D399),
    cardFront: Color(0xFF134E4A),
    cardBack: Color(0xFF1E293B),
  );

  static const light = MofoColors(
    background: Color(0xFFF4F7FA),
    surface: Color(0xFFFFFFFF),
    surfaceElevated: Color(0xFFEEF2F6),
    border: Color(0xFFD5DEE8),
    accent: Color(0xFF0D9488),
    accentDim: Color(0xFFCCFBF1),
    textPrimary: Color(0xFF0F172A),
    textSecondary: Color(0xFF64748B),
    textAlt: Color(0xFF9AA7B8),
    danger: Color(0xFFDC2626),
    warning: Color(0xFFD97706),
    success: Color(0xFF059669),
    cardFront: Color(0xFF0F766E),
    cardBack: Color(0xFF334155),
  );

  static MofoColors of(BuildContext context) {
    return Theme.of(context).extension<MofoColors>() ?? dark;
  }

  @override
  MofoColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceElevated,
    Color? border,
    Color? accent,
    Color? accentDim,
    Color? textPrimary,
    Color? textSecondary,
    Color? textAlt,
    Color? danger,
    Color? warning,
    Color? success,
    Color? cardFront,
    Color? cardBack,
  }) {
    return MofoColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      border: border ?? this.border,
      accent: accent ?? this.accent,
      accentDim: accentDim ?? this.accentDim,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textAlt: textAlt ?? this.textAlt,
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      cardFront: cardFront ?? this.cardFront,
      cardBack: cardBack ?? this.cardBack,
    );
  }

  @override
  MofoColors lerp(ThemeExtension<MofoColors>? other, double t) {
    if (other is! MofoColors) {
      return this;
    }
    return MofoColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      border: Color.lerp(border, other.border, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentDim: Color.lerp(accentDim, other.accentDim, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textAlt: Color.lerp(textAlt, other.textAlt, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
      cardFront: Color.lerp(cardFront, other.cardFront, t)!,
      cardBack: Color.lerp(cardBack, other.cardBack, t)!,
    );
  }
}
