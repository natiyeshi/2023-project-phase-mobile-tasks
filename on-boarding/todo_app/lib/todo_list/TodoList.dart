import 'package:flutter/material.dart';
import 'Nav.dart';
import 'Tasks.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Nav(),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 240,
              child: Image.asset("images/image2.png"),
            ),
            const Tasks(),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: MaterialButton(
                onPressed: () {},
                color: const Color.fromARGB(255, 238, 111, 87),
                minWidth: 240,
                child: const Text(
                  "Create task",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
