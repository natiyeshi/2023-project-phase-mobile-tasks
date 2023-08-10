import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'Nav.dart';

class TaskDetail extends StatefulWidget {
  TaskEntity task;
  bool isCompleted;
  TaskDetail({super.key, required this.task,required this.isCompleted});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  void _onChange(bool? ch) {
    setState(() {
      widget.isCompleted = ch ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Nav(isCompleted : widget.isCompleted),
          SizedBox(
            height: 200,
            child: Image.asset("images/image3.png"),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 35, right: 35, top: 30),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Title",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 235, 235),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(15),
                  height: 60,
                  child: Text(
                    widget.task.title,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 14, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Descriptions",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 235, 235),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  // alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(15),
                  height: 150,
                  width: double.infinity,
                  child: Text(
                    widget.task.description,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 14, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Deadline",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 235, 235),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  padding: const EdgeInsets.all(15),
                  height: 50,
                  width: double.infinity,
                  child: Text(
                    "${widget.task.dueDate.day}/${widget.task.dueDate.month}/${widget.task.dueDate.year}",
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 10),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Completed",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Checkbox(
                      value: widget.isCompleted,
                      onChanged: _onChange,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
