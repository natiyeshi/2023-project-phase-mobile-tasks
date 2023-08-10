import 'package:flutter/material.dart';
import 'Task.dart';

class Tasks extends StatefulWidget {
  Tasks({super.key,required this.tasks});

  final List tasks;

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              "Tasks list",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),
          for (int i = 0; i < widget.tasks.length; i++) Task(data: widget.tasks[i]),
        ],
      ),
    );
  }
}
