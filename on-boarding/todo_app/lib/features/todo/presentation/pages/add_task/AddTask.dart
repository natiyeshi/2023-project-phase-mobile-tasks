
import "package:flutter/material.dart";
import '../../../domain/entities/task_entity.dart';
import 'Description.dart';
import 'TaskName.dart';
import 'Nav.dart';
import 'DueDate.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String title = "";
  DateTime? date;
  String desc = "";
  String err = "";
  
  Future<DateTime?> showDate() async {
    final temp = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    setState(() {
      date = temp;
    });
    return temp;
  }

  void titleChange(String title) {
    setState(() {
      this.title = title;
    });
  }

  void descChange(String desc) {
    setState(() {
      this.desc = desc;
    });
  }

  void submit() {
    if (title.trim() == "") {
      setState(() {
        err = "empty title";
      });
      return;
    }
    if (date == null) {
      setState(() {
        err = "empty date";
      });
      return;
    }

    if (desc.trim() == "") {
      setState(() {
        err = "empty desc";
      });
      return;
    }
    setState(() {
      err = "";
      TaskEntity newTask = TaskEntity(id: 10,title:title,description: desc,dueDate: date ?? DateTime.now());
      Navigator.pop(context, newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Nav(),
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
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TaskName(onchange: titleChange),
                  DueDate(showDate: showDate),
                  Description(onchange: descChange),
                  Container(
                    margin: EdgeInsets.all(80),
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 111, 87),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        submit();
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                        // Navigator.pushNamed(context, route.todoListPage);
                      },
                      child: const Text(
                        "Add Task",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    key: const Key('errorText'),
                    err,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
