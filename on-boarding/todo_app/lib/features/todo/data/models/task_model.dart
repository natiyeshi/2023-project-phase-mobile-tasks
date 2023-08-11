import 'package:todo_app/features/todo/domain/entities/task_entity.dart';

// ignore: must_be_immutable
class TaskModel extends TaskEntity {
  // TaskModel({required super.id, required super.title, required super.description, required super.dueDate, required super.isCompleted});
  TaskModel({
    required int id,
    required String title,
    required String description,
    required DateTime dueDate,
    bool isCompleted = false,
  }) : super(id: id, title: title, description: description, dueDate: dueDate,isCompleted: isCompleted);

  @override
  List<Object> get props => [id, title, description, dueDate, isCompleted];

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: (json["id"] as num) as int,
      title: json["title"],
      description: json["description"],
      dueDate: DateTime.parse(json["dueDate"]),
      isCompleted: json["isCompleted"] ?? false
    );
  }


  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      dueDate: entity.dueDate,
      isCompleted : entity.isCompleted
    );
  }
}
