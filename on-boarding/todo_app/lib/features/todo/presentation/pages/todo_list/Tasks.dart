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
  void _ontap(TaskEntity task, BuildContext context) async {
    dynamic isCompleted = await Navigator.pushNamed(
      context,
      route.taskDetailPage,
      arguments: task,
    );
    
    if (isCompleted != null) {
      // ignore: use_build_context_synchronously
      context
          .read<TodosBloc>()
          .add(ChangeIsCompleted(id: task.id, isComplted: isCompleted));
    } 
  }

  List<GestureDetector> setTasks(
      List<TaskEntity>? tasks, BuildContext context) {
    List<GestureDetector> temp = [];
    for (int i = 0; i < tasks!.length; i++) {
      temp.add(GestureDetector(
        onTap: () => _ontap(tasks[i], context),
        child: Task(data: tasks[i]),
      ));
    }
    return temp;
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
              Column(
                children:
                    state is TodosLoaded ? setTasks(state.tasks, context) : [],
              ),
              state is Error ? Text("${state.error}") : Text("")
            ],
          ),
        );
      },
    );
  }
}
