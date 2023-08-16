import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/domain/repositories/task_repo_contract.dart';

class UpdateCompletion {
  final TaskRepoContract repository;

  UpdateCompletion(this.repository);

  Future<Either<Failure,void>> call(int id, bool isCompleted) async {
    return await repository.updateTaskCompletionStatus(id,isCompleted);
  }
}

class Params {
  final int id;
  final bool isCompleted;
  const Params({required this.id, required this.isCompleted});
}
