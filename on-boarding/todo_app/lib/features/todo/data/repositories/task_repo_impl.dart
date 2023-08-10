
import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/task_repo_contract.dart';

class TaskRepoImpl implements TaskRepoContract{
  @override
  Future<Either<Failure, void>> addTask(TaskEntity task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
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