import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sociallyfox/widget/splash_screen.dart';

void main() {
  group('Splashscreen', () {
    testWidgets("- start to show Logo and Bottom but don't finish",
        (WidgetTester tester) async {
      bool b = false;
      await tester.pumpWidget(
        MaterialApp(
          home: SplashScreen(Text('logo'), Text("bottom"), onEnd: () {
            b = true;
          }),
        ),
      );

      expect(find.textContaining("logo"), findsOneWidget);
      expect(find.textContaining("bottom"), findsOneWidget);
      expect(b, false);
    });

    testWidgets("- start to show Logo and Bottom but finish",
        (WidgetTester tester) async {
      bool b = false;
      await tester.pumpWidget(
        MaterialApp(
          home: SplashScreen(Text('logo'), Text("bottom"), onEnd: () {
            b = true;
          }),
        ),
      );
      await tester.pump(const Duration(seconds: 5));

      expect(find.textContaining("logo"), findsOneWidget);
      expect(find.textContaining("bottom"), findsOneWidget);
      expect(b, true);
    });
  });
}
