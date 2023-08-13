import 'package:flutter_test/flutter_test.dart';
// import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/features/todo/domain/usecases/add_task_usecase.dart';

void main() {
  AddTaskUsecase tAddTaskUsecase;
  group("check usecase", () {
    setUp(() {
      tAddTaskUsecase = AddTaskUsecase();
    });

    test("description", () {

    });
  });
}
