import 'package:todo_app/features/todo/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  // TaskModel({required super.id, required super.title, required super.description, required super.dueDate, required super.isCompleted});
  TaskModel(
      {required int id,
      required String title,
      required String description,
      required DateTime dueDate})
      : super(id: id, title: title, description: description, dueDate: dueDate);

  @override
  List<Object> get props => [id, title, description, dueDate, isCompleted];

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: (json["id"] as num) as int,
      title: json["title"],
      description: json["description"],
      dueDate: DateTime.parse(json["dueDate"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "title" : title,
      "description" : description,
      "dueDate" : dueDate,
    };
  }
   factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      dueDate: entity.dueDate,
    );
  }
}
