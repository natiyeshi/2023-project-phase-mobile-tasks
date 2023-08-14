import 'package:todo_app/core/network/network_info.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  group("isconnected", () {
    test("forwarded call to internet connection has connection", () async {
      final mockInternetConnectionChecker = MockInternetConnectionChecker();
      final networkInfoImpl = NetworkInfoImpl(mockInternetConnectionChecker);

      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);

      final result = await networkInfoImpl.isConnected;

      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, true);
    });
  });
}