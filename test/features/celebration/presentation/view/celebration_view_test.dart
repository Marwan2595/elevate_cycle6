import 'package:elevate_cycle6/features/celebration/presentation/view/celebration_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpView(WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CelebrationView()));
  }

  testWidgets('renders both celebration buttons', (tester) async {
    await pumpView(tester);

    expect(find.text('Confetti Rain'), findsOneWidget);
    expect(find.text('Nova Burst'), findsOneWidget);
  });

  testWidgets('Confetti Rain button inserts and removes an overlay', (
    tester,
  ) async {
    await pumpView(tester);

    final before = tester.widgetList(find.byType(CustomPaint)).length;
    await tester.tap(find.text('Confetti Rain'));
    await tester.pump();

    expect(
      tester.widgetList(find.byType(CustomPaint)).length,
      greaterThan(before),
      reason: 'celebration overlay should paint particles',
    );

    // Default animation runs 4s, then the overlay entry removes itself.
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(tester.widgetList(find.byType(CustomPaint)).length, before);
  });

  testWidgets('Nova Burst button inserts and removes an overlay', (
    tester,
  ) async {
    await pumpView(tester);

    final before = tester.widgetList(find.byType(CustomPaint)).length;
    await tester.tap(find.text('Nova Burst'));
    await tester.pump();

    expect(
      tester.widgetList(find.byType(CustomPaint)).length,
      greaterThan(before),
      reason: 'nova burst overlay should paint shells',
    );

    // Default animation runs 5s, then the overlay entry removes itself.
    await tester.pumpAndSettle(const Duration(seconds: 6));
    expect(tester.widgetList(find.byType(CustomPaint)).length, before);
  });
}
