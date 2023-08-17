// import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/features/todo/data/data_source/remote_data_source.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  RemoteDataSourceImpl? remoteDataSourceImpl;
  MockHttpClient? mockHttpClient;
  group("description", () {
    setUp(()  {
      mockHttpClient = MockHttpClient();
      remoteDataSourceImpl = RemoteDataSourceImpl(mockHttpClient!);
    });

    test(
    'should preform a GET request on a URL with number being the endpoint and with application/json header',
    () {
      //arrange
      when(mockHttpClient?.get(Uri(scheme: "http://numbersapi.com/2"), headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response("", 200),
      );
      // act
      remoteDataSourceImpl?.getAllTasks();
      // assert
      verify(mockHttpClient?.get(
        Uri(scheme: 'http://numbersapi.com/2'),
        headers: {'Content-Type': 'application/json'},
      ));
    },
  );

  });
}
