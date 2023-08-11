part of 'todos_bloc.dart';

sealed class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

final class TodosInitial extends TodosState {}

class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<TaskEntity> tasks;
  const TodosLoaded({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

class Error extends TodosState {
  final String error;
  const Error({required this.error});
  @override
  List<Object> get props => [error];
}
