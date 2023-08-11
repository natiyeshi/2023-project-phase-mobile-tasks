import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';

// 2023-08-11 07:39:47.642889
void main() {
  final tTaskModel = TaskModel(
      id: 1,
      title: "newtitle",
      description: "newdesc",
      dueDate: DateTime.parse("2023-08-11 07:39:47.642889"));

  const String tJson = """ 
    {"id" : 1, "title" : "newtitle" , "description" : "newdesc" , "dueDate" : "2023-08-11 07:39:47.642889" }
  """;

  test("should be sub class of task entity", () async {
    expect(tTaskModel, isA<TaskEntity>());
  });

  group("json tests", () {
    test("json to object check", () {
      Map<String, dynamic> jsonMap = json.decode(tJson);
      final result = TaskModel.fromJson(jsonMap);
      expect(result, tTaskModel);
    });

    test("object to json", () async {
      final result = tTaskModel.toJson();
      final expected = {
        "id" : 1, 
        "title" : "newtitle" , 
        "description" : "newdesc" , 
        "dueDate" : DateTime.parse("2023-08-11 07:39:47.642889") 
      };
      expect(expected, result);
    });
  });
}
