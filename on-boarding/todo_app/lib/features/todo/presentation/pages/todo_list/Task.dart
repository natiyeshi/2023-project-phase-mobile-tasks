import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';

// ignore: must_be_immutable
class Task extends StatelessWidget {
  TaskEntity data;
  Task({super.key, required this.data});
  final Map status = {
    0: const Color.fromARGB(255, 92, 185, 69),
    1: const Color.fromARGB(255, 194, 43, 38),
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 223, 219, 219).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                data.title[0],
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                     "",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                "${data.dueDate.day}/${data.dueDate.month}/${data.dueDate.year}",
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: status[data.isCompleted ? 1 : 0],
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
