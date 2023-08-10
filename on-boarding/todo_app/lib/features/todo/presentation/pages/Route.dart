import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';

import 'add_task/AddTask.dart';
import 'onboarding/Welcome.dart';
import 'todo_list/TodoList.dart';
import 'task_detail/TaskDetail.dart';

const String addTaskPage = "addTask";
const String welcomePage = "welcome";
const String todoListPage = "todoList";
const String taskDetailPage = "taskDetail";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case addTaskPage:
      return MaterialPageRoute(builder: (context) => const AddTask());
    case welcomePage:
      return MaterialPageRoute(builder: (context) => const Welcome());
    case todoListPage:
      return MaterialPageRoute(builder: (context) => TodoList());
    case taskDetailPage:
      final TaskEntity data = settings.arguments as TaskEntity;
      return MaterialPageRoute(
          builder: (context) => TaskDetail(task: data));
    default:
      return throw ("invalid navigation");
  }
}
