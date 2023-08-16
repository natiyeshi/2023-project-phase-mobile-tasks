// import 'dart:convert';

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
// import 'package:todo_app/core/errors/failure.dart';
// import 'package:todo_app/features/todo/data/models/task_model.dart';
// import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app/features/todo/data/data_source/local_data_source.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late LocalDataSource localDataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource = LocalDataSource();
  });
  test('should save the task data', () async {
    when(mockSharedPreferences.getStringList(localDataSource.saveKey))
        .thenReturn([]); // Mock empty existing data

    // Act
    final result = await localDataSource.getAllTasks();

    // Assert
    expect(result, const TypeMatcher<Right<Failure, List<TaskEntity>>>()
        .having((r) => r.getOrElse(() => []), 'value', []));
  });


  test('should return a list of TaskEntity when tasks are available', () async {
        // Mock saved tasks
        final savedTasksJson = [
          '{"id": 1, "title": "Task 1", "isCompleted": false}',
          '{"id": 2, "title": "Task 2", "isCompleted": true}'
        ];
        final savedTasks = savedTasksJson
            .map((data) => TaskEntity.fromModel(TaskModel.fromJson(json.decode(data))))
            .toList();

        // Mock SharedPreferences behavior
        when(mockSharedPreferences.getStringList(localDataSource.saveKey)).thenReturn(savedTasksJson);

        final result = await localDataSource.getAllTasks();

        expect(
          result,
          TypeMatcher<Right<Failure, List<TaskEntity>>>()
              .having((r) => r.getOrElse(() => []), 'value', savedTasks),
        );
      });


}
