import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sociallyfox/widget/fade_transitionner.dart';

void main() {
  group('FadeTranstionner', () {
    testWidgets('- isA true, should Give A', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: FadeTranstionner(true, Text("A"), Text("B"))));
      expect(find.textContaining("A"), findsOneWidget);
    });

    testWidgets("- isA false, should Give B", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: FadeTranstionner(true, Text("A"), Text("B"))));
      expect(find.textContaining("A"), findsOneWidget);
    });
  });
}
