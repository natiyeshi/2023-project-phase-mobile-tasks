import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/features/todo/presentation/bloc/todos_bloc.dart';
import 'Task.dart';
import '../Route.dart' as route;

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  void _ontap(int i) async {
    // dynamic isCompleted = await Navigator.pushNamed(
    //     context, route.taskDetailPage,
    //     arguments: widget.tasks[i]);

    // if (isCompleted is bool) {
    //   setState(() {
    //     widget.tasks[i].isCompleted = isCompleted;
    //     print("--------------$isCompleted");
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
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
              state is TodosLoaded ? 
              for (int i = 0; i < state.tasks; i++)
                GestureDetector(
                  onTap: () => _ontap(i),
                  child: Task(data: widget.tasks[i]),
                ) : Text("nothing here"),
            ],
          ),
        );
      },
    );
  }
}
