import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/features/todo/data/repositories/task_repo_impl.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
// import 'package:todo_app/features/todo/domain/repositories/task_repo_contract.dart';

class AddTaskUsecase implements Usecase<void, TaskEntity> {
  final TaskRepoImpl repository;

  AddTaskUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(TaskEntity params) async {
    return await repository.addTask(params);
  }
}
