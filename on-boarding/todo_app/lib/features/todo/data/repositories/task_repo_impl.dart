import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/task_repo_contract.dart';
import "../data_source/local_data_source.dart";

class TaskRepoImpl implements TaskRepoContract {
  final LocalDataSource localDataSource = LocalDataSource();

  @override
  Future<Either<Failure, void>> addTask(TaskEntity task) async {
    try {
      final result = await localDataSource.saveData(task);
      return result.fold((l) => Left(l), (r) => Right(r));
    } on Failure catch (err) {
      return Left(err);
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    final result = await localDataSource.getAllTasks();
    return result.fold((l) => Left(l), (r) => Right(r));
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
  Future<Either<Failure,void>> updateTaskCompletionStatus(int taskId, bool isCompleted) async {
    final result = await localDataSource.updateIsCompleted(taskId, isCompleted);
    return result.fold((failure) => Left(failure), (r) => Right(null));
  }
}
