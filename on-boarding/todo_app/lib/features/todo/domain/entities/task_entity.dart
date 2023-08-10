import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;

   const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  @override
  List<Object> get props => [id, title, description, dueDate, isCompleted];

}
