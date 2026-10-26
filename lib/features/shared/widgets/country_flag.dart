import 'package:flutter/material.dart';
import 'package:mofobank/l10n/l10n_ext.dart';

/// Cross-platform country flag (Windows does not render emoji flags).
class CountryFlag extends StatelessWidget {
  const CountryFlag({super.key, required this.marketId, this.size = 28});

  final String marketId;
  final double size;

  @override
  Widget build(BuildContext context) {
    final code = _codeFor(marketId);
    return Semantics(
      label: context.l10n.countryFlag(code),
      child: SizedBox(
        width: size * 1.4,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CustomPaint(
            painter: _FlagPainter(marketId),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                color: Colors.black.withValues(alpha: 0.35),
                child: Text(
                  code,
                  style: TextStyle(
                    fontSize: size * 0.28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static String _codeFor(String id) => switch (id) {
    'ru' => 'RU',
    'us' => 'US',
    'eu' => 'EU',
    'uk' => 'GB',
    'uz' => 'UZ',
    'jp' => 'JP',
    'tr' => 'TR',
    'kz' => 'KZ',
    _ => '??',
  };
}

class _FlagPainter extends CustomPainter {
  _FlagPainter(this.marketId);
  final String marketId;

  static const _blueUk = Color(0xFF012169);
  static const _redUk = Color(0xFFC8102E);
  static const _redUs = Color(0xFFB22234);
  static const _blueUs = Color(0xFF3C3B6E);

  @override
  void paint(Canvas canvas, Size size) {
    switch (marketId) {
      case 'ru':
        _paintStripes(canvas, size, const [
          Color(0xFFFFFFFF),
          Color(0xFF0039A6),
          Color(0xFFD52B1E),
        ]);
      case 'us':
        _paintUs(canvas, size);
      case 'eu':
        canvas.drawRect(
          Offset.zero & size,
          Paint()..color = const Color(0xFF003399),
        );
        // Simple ring of dots as EU stars
        final c = Offset(size.width * 0.5, size.height * 0.5);
        final r = size.height * 0.28;
        for (var i = 0; i < 12; i++) {
          final a = (i / 12) * 6.28318 - 1.5708;
          canvas.drawCircle(
            Offset(c.dx + r * _cos(a), c.dy + r * _sin(a)),
            size.height * 0.045,
            Paint()..color = const Color(0xFFFFCC00),
          );
        }
      case 'uk':
        _paintUk(canvas, size);
      case 'uz':
        _paintStripes(canvas, size, const [
          Color(0xFF1EB53A),
          Color(0xFFFFFFFF),
          Color(0xFF0099B5),
        ]);
      case 'jp':
        canvas.drawRect(Offset.zero & size, Paint()..color = Colors.white);
        canvas.drawCircle(
          Offset(size.width * 0.5, size.height * 0.5),
          size.height * 0.28,
          Paint()..color = const Color(0xFFBC002D),
        );
      case 'tr':
        canvas.drawRect(
          Offset.zero & size,
          Paint()..color = const Color(0xFFE30A17),
        );
        canvas.drawCircle(
          Offset(size.width * 0.38, size.height * 0.5),
          size.height * 0.28,
          Paint()..color = Colors.white,
        );
        canvas.drawCircle(
          Offset(size.width * 0.44, size.height * 0.5),
          size.height * 0.22,
          Paint()..color = const Color(0xFFE30A17),
        );
      case 'kz':
        canvas.drawRect(
          Offset.zero & size,
          Paint()..color = const Color(0xFF00AFCA),
        );
        canvas.drawCircle(
          Offset(size.width * 0.5, size.height * 0.5),
          size.height * 0.22,
          Paint()..color = const Color(0xFFFEC50C),
        );
      default:
        canvas.drawRect(
          Offset.zero & size,
          Paint()..color = const Color(0xFF1A222D),
        );
    }

    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(4)),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = Colors.white.withValues(alpha: 0.2),
    );
  }

  void _paintStripes(Canvas canvas, Size size, List<Color> colors) {
    final h = size.height / colors.length;
    for (var i = 0; i < colors.length; i++) {
      canvas.drawRect(
        Rect.fromLTWH(0, i * h, size.width, h),
        Paint()..color = colors[i],
      );
    }
  }

  void _paintUk(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = _blueUk);
    final white = Paint()
      ..color = Colors.white
      ..strokeWidth = size.height * 0.28
      ..strokeCap = StrokeCap.butt;
    final red = Paint()
      ..color = _redUk
      ..strokeWidth = size.height * 0.14
      ..strokeCap = StrokeCap.butt;

    // St. Andrew diagonals (white then red)
    canvas.drawLine(Offset.zero, Offset(size.width, size.height), white);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), white);
    canvas.drawLine(Offset.zero, Offset(size.width, size.height), red);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), red);

    // St. George cross
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * 0.22,
        height: size.height,
      ),
      Paint()..color = Colors.white,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height * 0.32,
      ),
      Paint()..color = Colors.white,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * 0.12,
        height: size.height,
      ),
      Paint()..color = _redUk,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height * 0.18,
      ),
      Paint()..color = _redUk,
    );
  }

  void _paintUs(Canvas canvas, Size size) {
    const stripes = 13;
    final stripeH = size.height / stripes;
    for (var i = 0; i < stripes; i++) {
      canvas.drawRect(
        Rect.fromLTWH(0, i * stripeH, size.width, stripeH + 0.5),
        Paint()..color = i.isEven ? _redUs : Colors.white,
      );
    }
    // Canton
    final canton = Rect.fromLTWH(0, 0, size.width * 0.42, stripeH * 7);
    canvas.drawRect(canton, Paint()..color = _blueUs);
    // Simple star dots
    for (var row = 0; row < 5; row++) {
      for (var col = 0; col < 6; col++) {
        canvas.drawCircle(
          Offset(
            canton.left + canton.width * (col + 0.5) / 6,
            canton.top + canton.height * (row + 0.5) / 5,
          ),
          size.height * 0.035,
          Paint()..color = Colors.white,
        );
      }
    }
  }

  double _cos(double a) {
    return Offset.fromDirection(a).dx;
  }

  double _sin(double a) => Offset.fromDirection(a).dy;

  @override
  bool shouldRepaint(covariant _FlagPainter oldDelegate) =>
      oldDelegate.marketId != marketId;
}
