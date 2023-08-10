import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'Nav.dart';
import 'Tasks.dart';
import '../Route.dart' as route;

class TodoList extends StatefulWidget {
  const TodoList({super.key});
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List tasks = [
    TaskEntity(
      title: "Ui/Ux App",
      description: "Deisgn",
      dueDate: DateTime.now(),
      id: Random().nextInt(1000),
    ),
    TaskEntity(
      title: "Mobile App",
      description: "Mobile description",
      dueDate: DateTime.now(),
      id: Random().nextInt(1000),
    ),
    TaskEntity(
      title: "Football Cu",
      description: "Drybling description",
      dueDate: DateTime.now(),
      id: Random().nextInt(1000),
    ),
   
    TaskEntity(
      title: "View Candidates",
      description: "View description",
      dueDate: DateTime.now(),
      id: Random().nextInt(1000),
    ),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Nav(),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 240,
                child: Image.asset("images/image2.png"),
              ),
              Tasks(tasks: tasks),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: MaterialButton(
                  padding: const EdgeInsets.all(15),
                  onPressed: () async {
                    
                    dynamic newTask =
                        await Navigator.pushNamed(context, route.addTaskPage);
                    if (newTask is TaskEntity ) {
                      setState(() {
                        tasks.add(newTask);
                      });
                      print("got it :)");
                    } 
                  },
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
        ],
      ),
    );
  }
}
