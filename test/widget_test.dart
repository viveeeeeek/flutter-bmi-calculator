import 'package:bmicalculator/core/notifiers/bmi_calculate.notifiers.dart';
import 'package:bmicalculator/meta/views/home.views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('BMI Calculation', () {
    testWidgets('Error message empty fields', (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(providers: [
        ListenableProvider<BmiNotifier>(create: (_) => BmiNotifier())
      ], child: MaterialApp(home: HomeView())));

      await tester.pumpAndSettle();

      expect(find.text('Height'), findsOneWidget);

      expect(find.text('Weight'), findsOneWidget);

      await tester.tap(find.text("Calculate BMI"));

      await tester.pump(Duration(microseconds: 100));

      expect(find.byWidgetPredicate(((widget) => widget is SnackBar)),
          findsOneWidget);
    });

    testWidgets('Insert data and get BMI', (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(providers: [
        ListenableProvider<BmiNotifier>(create: (_) => BmiNotifier())
      ], child: MaterialApp(home: HomeView())));

      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(ValueKey("HEIGHT_FIELD")), '1.65');

      await tester.enterText(find.byKey(ValueKey("WEIGHT_FIELD")), '65');

      final heightDropdown = find.text('m or cm');
      final weightDropdown = find.text('Kg or gms');

      await tester.tap(heightDropdown);
      await tester.tap(weightDropdown);

      await tester.tap(find.text("Calculate BMI"));

      await tester.pump(Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(find.byWidgetPredicate(((widget) => widget is SnackBar)),
          findsNothing);
    });
  });
}
