import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
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

  @override
  List<Object> get props => [id, title, description, dueDate, isCompleted];

}
