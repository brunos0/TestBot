import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tester/main.dart';

class MockNavigatorObserver extends NavigatorObserver {
  List<Route<dynamic>> pushedRoutes = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    pushedRoutes.add(route);
    super.didPush(route, previousRoute);
  }
}

void main() {
  final mockObserver = MockNavigatorObserver();
  testWidgets('Testando o cenário de navegação de telas.',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: const MyApp(),
      navigatorObservers: [mockObserver],
    ));

    await tester.tap(find.text("Avançar"));
    await tester.pumpAndSettle();

    expect(mockObserver.pushedRoutes.last.settings.name, "/");

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
