import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';

abstract class LocalDataSourceContract {
  Future<Either<Failure, void>> saveData(TaskModel task);
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
  Future<Either<Failure, void>> updateIsCompleted(int id, bool isCompleted);
}

class LocalDataSource extends LocalDataSourceContract {
  final String saveKey = "tasks";

  @override
  Future<Either<Failure, void>> saveData(TaskEntity task) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final savedTasksJson = prefs.getStringList(saveKey) ?? [];

      final TaskModel taskModel = TaskModel.fromEntity(task);

      savedTasksJson.add(json.encode(taskModel.toJson()));

      await prefs.setStringList(saveKey, savedTasksJson);

      return Right(null);
    } catch (e) {
      return Left(Failure(error: "$e"));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> savedTasksJson = prefs.getStringList(saveKey) ?? [];
      // Convert JSON strings to TaskModel objects
      print(savedTasksJson);
      final List<TaskEntity> savedTasks = savedTasksJson
          .map((data) =>
              TaskEntity.fromModel(TaskModel.fromJson(json.decode(data))))
          .toList();

      return Right(savedTasks);
    } catch (e) {
      return Left(Failure(error: "$e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateIsCompleted(
      int id, bool isCompleted) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      dynamic result = await getAllTasks();

      dynamic tasks = result.fold((l) => l, (r) => r);

      if (tasks is List<TaskEntity>) {
        List<String> newdatas = [];
        tasks.forEach((task) {
          if (task.id == id) {
            task.isCompleted = isCompleted;
          }
          newdatas.add(json.encode(task.toJson()));
        });

        await prefs.setStringList(saveKey, newdatas);
      }

      return Right(null);
    } catch (e) {
      return Left(Failure(error: "$e"));
    }
  }
}
