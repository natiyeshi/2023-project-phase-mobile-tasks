import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';

abstract class LocalDataSourceContract {
  Future<Either<Failure, void>> saveData(TaskModel task);
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
}

class LocalDataSource extends LocalDataSourceContract {
  final String saveKey = "tasks";

  @override
  Future<Either<Failure, void>> saveData(TaskModel task) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final savedTasksJson = prefs.getStringList(saveKey) ?? [];

      savedTasksJson.add(task.toJson().toString());

      await prefs.setStringList(saveKey, savedTasksJson);

      return Right(null);
    } catch (e) {
      return Left(Failure(error: "Something goes wrong while adding task"));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final List<String> savedTasksJson = prefs.getStringList(saveKey) ?? [];
      
      // Convert JSON strings to TaskModel objects
      final List<TaskModel> savedTasks = savedTasksJson
          .map((data) => TaskModel.fromJson(json.decode(data)))
          .toList();

      return Right(savedTasks);
    } catch (e) {
      return Left(Failure(error: "something goew wrong while getting datas"));
    }
  }
}
