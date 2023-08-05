import "package:flutter/material.dart";
import 'Description.dart';
import 'TaskName.dart';
import 'Top.dart';
import 'DueDate.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String name = "abebe";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Top(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 212, 212, 212),
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  )),
              child: const Center(
                child: Text(
                  "Create new AddTask",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(20),
                child: const Column(
                  children: [
                    TaskName(),
                    DueDate(),
                    Description(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
