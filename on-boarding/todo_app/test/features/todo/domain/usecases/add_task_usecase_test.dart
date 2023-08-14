import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
// import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/features/todo/domain/usecases/add_task_usecase.dart';

void main() {
  AddTaskUsecase? tAddTaskUsecase;
  TaskEntity? taskEntity;
  group("check usecase", () {
    setUp(() {
      tAddTaskUsecase = AddTaskUsecase();
      taskEntity = TaskEntity(
          id: 1,
          title: "title",
          description: "description",
          dueDate: DateTime.now());
    });

    test("description", () async {
      
       final result = await tAddTaskUsecase?.call(taskEntity!);
       expect(result, (){});
    });

  });
}
