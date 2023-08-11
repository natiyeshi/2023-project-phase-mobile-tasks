import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
// import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/features/todo/data/repositories/task_repo_impl.dart';
// import 'package:todo_app/features/todo/domain/repositories/task_repo_contract.dart';

class UpdateCompletion {
  final TaskRepoImpl repository = TaskRepoImpl();

  UpdateCompletion();

  Future<Either<Failure,void>> call(int id, bool isCompleted) async {
    return await repository.updateTaskCompletionStatus(id,isCompleted);
  }
}

class Params {
  final int id;
  final bool isCompleted;
  const Params({required this.id, required this.isCompleted});
}
