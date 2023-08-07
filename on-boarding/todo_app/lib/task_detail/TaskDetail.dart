import 'package:flutter/material.dart';
import 'Nav.dart';
import "Body.dart";

class TaskDetail extends StatelessWidget {
  final Map? task;
  const TaskDetail({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Nav(),
          SizedBox(
            height: 200,
            child: Image.asset("images/image3.png"),
          ),
          Body(task : task),
        ],
      ),
    );
  }
}
