import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import "../../../../../lib/features/todo/data/data_source/local_data_source.dart";

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late LocalDataSource localDataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource = LocalDataSource();
  });
  test('should save the task data', () async {
    // Arrange
    final task = TaskEntity(
      id: 1,
      title: 'Task 1',
      description: 'Task 1 description',
      dueDate: DateTime.now(),
      isCompleted: false,
    );
    final taskModel = TaskModel.fromEntity(task);
    final encodedTask = json.encode(taskModel.toJson());

    when(mockSharedPreferences.getStringList(localDataSource.saveKey))
        .thenReturn([]); // Mock empty existing data

   when(mockSharedPreferences.setStringList(
    localDataSource.saveKey,
    [encodedTask],
  )).thenAnswer((_) => Future.value(true)); 

    // Act
    final result = await localDataSource.saveData(task);

    // Assert
    expect(result, Right(null)); // Expect Right value
  });
}
