import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'Nav.dart';
import "Body.dart";

class TaskDetail extends StatelessWidget {
  final TaskEntity task;
  const TaskDetail({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Nav(),
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
