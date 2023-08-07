import 'package:flutter/material.dart';
import 'Task.dart';

class Tasks extends StatefulWidget {
  Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final List tasks = [
    {
      "title": "Ui/Ux App",
      "type": "Desigh",
      "date": "April 29,2023",
      "desc" : "Ui/Ux description",
      "status": 1
    },
    {
      "title": "View Candidates",
      "type": "",
      "date": "April 29,2023",
      "desc" : "View description",
      "status": 0
    },
    {
      "title": "Football Cu",
      "type": "Drybling",
      "date": "April 29,2023",
      "desc" : "Drybling description",
      "status": -1
    },
    {
      "title": "Mobile App",
      "type": "Development",
      "date": "April 29,2023",
      "desc" : "Mobile description",
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
          for (int i = 0; i < tasks.length; i++)
            Task(data: tasks[i]),
        ],
      ),
    );
  }
}
