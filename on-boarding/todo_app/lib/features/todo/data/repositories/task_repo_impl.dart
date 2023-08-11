import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/task_repo_contract.dart';
import "../data_source/local_data_source.dart";

class TaskRepoImpl implements TaskRepoContract {
  late LocalDataSource localDataSource;

  @override
  Future<Either<Failure, void>> addTask(TaskEntity task) async {
    try {
      final TaskModel taskModel = TaskModel.fromEntity(task);
      await localDataSource.saveData(taskModel);
      return Right(null);
    } on Failure catch (err) {
      return Left(err);
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    final result = await localDataSource.getAllTasks();
    return result.fold(
      (l) => Left(l),
      (r) => Right(r)
    );
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int taskId) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateTask(TaskEntity task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  @override
  Future<void> updateTaskCompletionStatus(int taskId, bool isCompleted) {
    // TODO: implement updateTaskCompletionStatus
    throw UnimplementedError();
  }
}
