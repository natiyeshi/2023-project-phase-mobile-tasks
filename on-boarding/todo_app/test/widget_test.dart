import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import "../lib/features/todo/presentation/pages/todo_list/TodoList.dart";
import "../lib/features/todo/presentation/pages/todo_list/Task.dart";
import '../lib/features/todo/presentation/pages/Route.dart' as route;


void main() {
  testWidgets('Creation', (WidgetTester tester) async {
    var titleKey = const Key("titleKey");
    // var descKey = const Key("descKey");
    var dateKey = const Key("dateKey");
    var errKey = const Key("errorText");

    await tester.pumpWidget(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: route.controller,
        initialRoute: route.addTaskPage,
      ),
    );

    // checking existring widgets
    expect(find.text("Create new AddTask"), findsOneWidget);
    expect(find.widgetWithText(MaterialButton, "Add Task"), findsOneWidget);
    expect(find.byKey(errKey), findsOneWidget);

    // Tap the "Add Task" button
    await tester.tap(find.widgetWithText(MaterialButton, "Add Task"));
    await tester.pump();

    // testing title validator
    expect(find.byKey(errKey), findsOneWidget);
    expect(find.text("empty title"), findsOneWidget);
    expect(find.byKey(titleKey), findsOneWidget);

    await tester.enterText(find.byKey(titleKey), "title");
    await tester.tap(find.widgetWithText(MaterialButton, "Add Task"));
    await tester.pump();

    // testing date validator
    expect(find.text("empty date"), findsOneWidget);
    expect(find.byKey(dateKey), findsOneWidget);




  });

  testWidgets("Lestning", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TodoList()));

    // chacking task
    expect(find.byType(Task), findsAtLeastNWidgets(1));

    //chacking button existance
    expect(find.widgetWithText(MaterialButton, "Create task"), findsOneWidget);
  });

  testWidgets("onboarding", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: route.controller,
        initialRoute: route.welcomePage,
      ),
    );

    // chacking button
    expect(find.byType(ElevatedButton), findsOneWidget);

    // changin route
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // check for Todo list page
    expect(find.byType(TodoList), findsOneWidget);
  });
}
