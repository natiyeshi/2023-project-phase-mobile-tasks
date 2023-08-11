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

class ChangeIsCompleted extends TodosEvent {
  final int id;
  final bool isComplted;
  const ChangeIsCompleted({required this.id, required this.isComplted});

  @override
  List<Object> get props => [id,isComplted];  
}
