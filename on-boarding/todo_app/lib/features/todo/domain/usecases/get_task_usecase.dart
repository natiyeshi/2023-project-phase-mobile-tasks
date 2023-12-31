import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/features/todo/data/repositories/task_repo_impl.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
// import 'package:todo_app/features/todo/domain/repositories/task_repo_contract.dart';

class GetTaskUsecase implements Usecase<List<TaskEntity>, NoParams> {
  final TaskRepoImpl repository = TaskRepoImpl();

  GetTaskUsecase();

  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) async {
    return await repository.getAllTasks();
  }
}
