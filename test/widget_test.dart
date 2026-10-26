import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mofobank/core/theme/mofo_theme.dart';

void main() {
  testWidgets('MOFOBank theme smoke', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: buildMofoTheme(Brightness.dark),
        home: const Scaffold(
          body: Center(child: Text('MOFOBank')),
        ),
      ),
    );
    expect(find.text('MOFOBank'), findsOneWidget);
  });
}
