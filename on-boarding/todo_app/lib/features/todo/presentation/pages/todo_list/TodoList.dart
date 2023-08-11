
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/features/todo/presentation/bloc/todos_bloc.dart';
import 'Nav.dart';
import 'Tasks.dart';
import '../Route.dart' as route;

class TodoList extends StatefulWidget {
  const TodoList({Key? key})
      : super(key: key); // Fixed syntax for the constructor
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Column(
                children: [
                  const Nav(),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    child: Image.asset("images/image2.png"),
                  ),
                  const Tasks(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: MaterialButton(
                      padding: const EdgeInsets.all(15),
                      onPressed: () async {
                        dynamic newTask = await Navigator.pushNamed(
                            context, route.addTaskPage);
                        if (newTask is TaskEntity) {
                          setState(() {
                            context
                                .read<TodosBloc>()
                                .add(AddTask(task: newTask));
                          });
                        }
                      },
                      color: const Color.fromARGB(255, 238, 111, 87),
                      minWidth: 240,
                      child: const Text(
                        "Create task",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
