import 'package:todo_app/features/todo/domain/entities/task_entity.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<TaskEntity>> getAllTasks();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl(this.client);

  @override
  Future<List<TaskEntity>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }
}
