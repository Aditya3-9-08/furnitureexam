import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitureexam/furnitureexam.dart';

import 'package:furnitureexam/main.dart';

void main() {
  testWidgets('FurnitureExam smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FurnitureExam());

    // Verify that the main text is displayed
    expect(find.text('MAKE YOUR\nHOME BEAUTIFUL'), findsOneWidget);

    // Verify that the Get Started button exists
    expect(find.text('Get Started'), findsOneWidget);
  });
}