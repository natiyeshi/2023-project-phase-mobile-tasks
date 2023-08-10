import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';

import '../entities/task_entity.dart';

abstract class TaskRepoContract {
  Future<Either<Failure,List<TaskEntity>>> getAllTasks();
  Future<Either<Failure,TaskEntity>> getTaskById(int taskId);
  Future<Either<Failure,void>> addTask(TaskEntity task);
  Future<Either<Failure,void>> updateTask(TaskEntity task);
  Future<void> updateTaskCompletionStatus(int taskId, bool isCompleted);
}
