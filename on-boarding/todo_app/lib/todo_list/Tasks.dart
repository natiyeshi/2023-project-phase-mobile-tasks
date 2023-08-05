import 'package:flutter/material.dart';
import 'Task.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final List tasks = [
    {
      "name": "Ui/Ux App",
      "type": "Desigh",
      "date": "April 29,2023",
      "status": 1
    },
    {
      "name": "View Candidates",
      "type": "",
      "date": "April 29,2023",
      "status": 0
    },
    {
      "name": "Football Cu",
      "type": "Drybling",
      "date": "April 29,2023",
      "status": -1
    },
    {
      "name": "Mobile App",
      "type": "Development",
      "date": "April 29,2023",
      "status": 1
    },
  ];

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
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(left: 10),
            child: const Text(
              "Tasks list",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),
          for (int i = 0; i < tasks.length; i++) Task(data: tasks[i]),
        ],
      ),
    );
  }
}
