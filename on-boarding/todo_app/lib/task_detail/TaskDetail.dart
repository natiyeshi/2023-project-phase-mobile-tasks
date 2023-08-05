import 'package:flutter/material.dart';
import 'Nav.dart';
import "Body.dart";

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Nav(),
            SizedBox(
              height: 200,
              child: Image.asset("images/image3.png"),
            ),
            const Body(),
          ],
        ),
      ),
    );
  }
}
