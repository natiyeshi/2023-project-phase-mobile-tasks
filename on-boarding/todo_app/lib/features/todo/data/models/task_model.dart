import 'package:todo_app/features/todo/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {

  TaskModel({required super.id, required super.title, required super.description, required super.dueDate, required super.isCompleted});

  @override
  List<Object> get props => [id, title, description, dueDate, isCompleted];

  
}
