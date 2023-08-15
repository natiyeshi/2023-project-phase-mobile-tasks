
import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';


abstract class LocalDataSourceContract {
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
  Future<Either<Failure, void>> saveData(TaskModel task);
  Future<Either<Failure, void>> updateIsCompleted(int id, bool isCompleted);
}
