import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mofobank/l10n/l10n_ext.dart';
import 'package:mofobank/core/theme/mofo_colors.dart';

class BankCardFlip extends StatefulWidget {
  const BankCardFlip({
    super.key,
    required this.holderName,
    required this.maskedPan,
    required this.fullPan,
    required this.expiry,
    required this.cvv,
    required this.frozen,
    required this.currencyCode,
    this.maxWidth = 340,
    this.revealEnabled = true,
  });

  final String holderName;
  final String maskedPan;
  final String fullPan;
  final String expiry;
  final String cvv;
  final bool frozen;
  final String currencyCode;
  final double maxWidth;

  /// When false, show-details stays disabled until secrets finish loading.
  final bool revealEnabled;

  @override
  State<BankCardFlip> createState() => _BankCardFlipState();
}

class _BankCardFlipState extends State<BankCardFlip>
    with TickerProviderStateMixin {
  late final AnimationController _flip;
  late final AnimationController _shine;
  bool _showSensitive = false;

  @override
  void initState() {
    super.initState();
    _flip = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _shine = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat();
  }

  @override
  void dispose() {
    _flip.dispose();
    _shine.dispose();
    super.dispose();
  }

  void _toggleFlip() {
    if (_flip.isCompleted) {
      _flip.reverse();
    } else {
      _flip.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: widget.maxWidth),
            child: GestureDetector(
              onTap: _toggleFlip,
              child: AnimatedBuilder(
                animation: Listenable.merge([_flip, _shine]),
                builder: (context, _) {
                  final angle = _flip.value * math.pi;
                  final isBack = angle > math.pi / 2;
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.0012)
                      ..rotateY(angle),
                    child: isBack
                        ? Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(math.pi),
                            child: _back(),
                          )
                        : _front(),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          l10n.tapCardToFlip,
          style: TextStyle(
            color: MofoColors.of(context).textSecondary,
            fontSize: 12,
          ),
        ),
        TextButton(
          onPressed: !widget.revealEnabled
              ? null
              : () => setState(() => _showSensitive = !_showSensitive),
          child: Text(
            !widget.revealEnabled
                ? l10n.loading
                : (_showSensitive ? l10n.hideDetails : l10n.showCardNumber),
          ),
        ),
      ],
    );
  }

  Widget _front() {
    final l10n = context.l10n;
    final base = widget.frozen
        ? MofoColors.of(context).border
        : MofoColors.of(context).cardFront;
    return _cardShell(
      child: Stack(
        children: [
          // Currency watermark letters
          Positioned.fill(
            child: IgnorePointer(
              child: Align(
                alignment: const Alignment(0.55, 0.15),
                child: Text(
                  widget.currencyCode,
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ),
            ),
          ),
          // Shine sweep
          Positioned.fill(
            child: IgnorePointer(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final x = (_shine.value * 2 - 0.5) * constraints.maxWidth;
                  return Transform.translate(
                    offset: Offset(x, 0),
                    child: Transform.rotate(
                      angle: -0.4,
                      child: Container(
                        width: 56,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0),
                              Colors.white.withValues(alpha: 0.18),
                              Colors.white.withValues(alpha: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'MOFOBank',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.currencyCode,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: MofoColors.of(context).accent
                            .withValues(alpha: 0.95),
                        fontSize: 12,
                      ),
                    ),
                    if (widget.frozen) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: MofoColors.of(context).danger
                              .withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          l10n.frozen,
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 18),
                // Chip
                Container(
                  width: 42,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE8C56A), Color(0xFFB8860B)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  _showSensitive ? _spaced(widget.fullPan) : widget.maskedPan,
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 2.2,
                    fontWeight: FontWeight.w600,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.holderName.toUpperCase(),
                      style: const TextStyle(fontSize: 11, letterSpacing: 1),
                    ),
                    Text(
                      _showSensitive ? widget.expiry : '••/••',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      colors: [base, Color.lerp(base, Colors.black, 0.25)!],
    );
  }

  Widget _back() {
    final l10n = context.l10n;
    return _cardShell(
      colors: [MofoColors.of(context).cardBack, const Color(0xFF0F172A)],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Container(height: 40, color: Colors.black87),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                color: MofoColors.of(context).surfaceElevated,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${context.l10n.cvvLabel}  ', style: const TextStyle(fontSize: 12)),
                    Text(
                      _showSensitive ? widget.cvv : '•••',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.cvvWarning,
                style: TextStyle(
                  fontSize: 11,
                  color: MofoColors.of(context).textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardShell({required Widget child, required List<Color> colors}) {
    return AspectRatio(
      aspectRatio: 1.586,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.45),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: MofoColors.of(context).accent.withValues(alpha: 0.12),
              blurRadius: 24,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: ClipRRect(borderRadius: BorderRadius.circular(16), child: child),
      ),
    );
  }

  String _spaced(String pan) {
    final buf = StringBuffer();
    for (var i = 0; i < pan.length; i++) {
      if (i > 0 && i % 4 == 0) buf.write(' ');
      buf.write(pan[i]);
    }
    return buf.toString();
  }
}
