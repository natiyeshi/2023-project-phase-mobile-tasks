import 'package:equatable/equatable.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';

// ignore: must_be_immutable
class  TaskEntity extends Equatable {
   int id;
   String title;
   String description;
   DateTime dueDate;
   bool isCompleted;

   TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

   Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "dueDate": dueDate.toString(),
      "isCompleted" : isCompleted
    };
  }

  factory TaskEntity.fromModel(TaskModel entity) {
    return TaskEntity(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      dueDate: entity.dueDate,
      isCompleted : entity.isCompleted
    );
  }

  @override
  List<Object> get props => [id, title, description, dueDate, isCompleted];

}
