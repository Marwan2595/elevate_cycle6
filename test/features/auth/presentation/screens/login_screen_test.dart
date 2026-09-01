import 'package:elevate_cycle6/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify login screen structure', (WidgetTester tester) async {
    //AAA
    //Arrange
    //Act
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    //Assert

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(Text), findsNWidgets(5));
    expect(find.bySemanticsLabel('Email'), findsOneWidget);
    expect(find.bySemanticsLabel('Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(2));
    expect(find.byKey(Key("login_button")), findsOneWidget);
    expect(find.text('Please enter your email address'), findsNothing);
    expect(find.text('Please enter a valid email address'), findsNothing);
    expect(find.text('Please enter your password'), findsNothing);
    expect(find.text('Password must be at least 6 characters'), findsNothing);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data == 'Login' &&
            widget.style?.color == Colors.blue,
      ),
      findsOneWidget,
    );
  });

  testWidgets('Verify non-valid email error state', (
    WidgetTester tester,
  ) async {
    //AAA
    //Arrange
    //Act
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.enterText(find.bySemanticsLabel('Email'), 'invalid_email');
    await tester.enterText(find.bySemanticsLabel('Password'), 'SKDHJFFGHHK');
    await tester.tap(find.byKey(Key("login_button")));
    await tester.pump();

    //Assert

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(Text), findsNWidgets(6));
    expect(find.bySemanticsLabel('Email'), findsOneWidget);
    expect(find.bySemanticsLabel('Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(2));
    expect(find.byKey(Key("login_button")), findsOneWidget);
    expect(find.text('Please enter your email address'), findsNothing);
    expect(find.text('Please enter a valid email address'), findsOneWidget);
    expect(find.text('Please enter your password'), findsNothing);
    expect(find.text('Password must be at least 6 characters'), findsNothing);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data == 'Login' &&
            widget.style?.color == Colors.blue,
      ),
      findsOneWidget,
    );
  });
}
