import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import "./local_data_source_contract.dart";

class LocalDataSource extends LocalDataSourceContract {
  final String saveKey = "tasks";
  // final SharedPreferences sharedPreferences;
  
  // LocalDataSource(this.sharedPreferences);

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final List<String> savedTasksJson =
          sharedPreferences.getStringList(saveKey) ?? [];

      final List<TaskEntity> savedTasks = savedTasksJson
          .map(
            (data) =>
                TaskEntity.fromModel(TaskModel.fromJson(json.decode(data))),
          )
          .toList();

      return Right(savedTasks);
    } catch (e) {
      return Left(Failure(error: "$e , while getting data"));
    }
  }

  @override
  Future<Either<Failure, void>> saveData(TaskEntity task) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final List<String> savedTasksJson =
          sharedPreferences.getStringList(saveKey) ?? [];

      final TaskModel taskModel = TaskModel.fromEntity(task);

      savedTasksJson.add(json.encode(taskModel.toJson()));

      await sharedPreferences.setStringList(saveKey, savedTasksJson);

      return Right(null);
    } catch (e) {
      return Left(Failure(error: "$e , while setting data"));
    }
  }

  @override
  Future<Either<Failure, void>> updateIsCompleted(
      int id, bool isCompleted) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
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

        await sharedPreferences.setStringList(saveKey, newdatas);
      }

      return Right(null);
    } catch (e) {
      return Left(Failure(error: "$e"));
    }
  }
}
