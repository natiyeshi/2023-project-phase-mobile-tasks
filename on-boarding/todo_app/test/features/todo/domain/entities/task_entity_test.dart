
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';

void main() {
  TaskEntity? tTaskEntity;

  group("check values of the properties ", () {
    DateTime time = DateTime.now();
    setUp(() {
      tTaskEntity = TaskEntity(
        id: 1,
        title: "title",
        description: "description",
        dueDate: time,
      );
    });

    test("test values", () {
      expect(tTaskEntity?.id, 1);
      expect(tTaskEntity?.title, "title");
      expect(tTaskEntity?.description, "description");
      expect(tTaskEntity?.dueDate, time);
      expect(tTaskEntity?.isCompleted, false);
    });

    test("check method to json", () {
      Map<String, dynamic> expected = {
        "id": 1,
        "title": "title",
        "description": "description",
        "dueDate": time.toString(),
        "isCompleted": false
      };
      expect(tTaskEntity?.toJson(), expected);
    });

  });
}
