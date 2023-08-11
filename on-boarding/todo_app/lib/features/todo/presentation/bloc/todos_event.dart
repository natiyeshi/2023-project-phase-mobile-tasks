part of 'todos_bloc.dart';

sealed class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class GetTasks extends TodosEvent {}

class AddTask extends TodosEvent {
  final TaskEntity task;
  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}
