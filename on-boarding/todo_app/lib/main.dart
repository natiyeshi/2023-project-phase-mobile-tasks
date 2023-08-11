import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/bloc/todos_bloc.dart';
import './features/todo/presentation/pages/Route.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: route.controller,
        initialRoute: route.welcomePage,
      ),
    );
  }
}
