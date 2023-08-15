import 'package:todo_app/core/network/network_info.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


void main() {
  NetworkInfoImpl? networkInfo;
  InternetConnectionChecker? internetConnectionChecker;
  setUp(() {
    internetConnectionChecker = InternetConnectionChecker();
    networkInfo = NetworkInfoImpl(internetConnectionChecker!);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
      
        final result = await networkInfo?.isConnected;
     
        expect(true, result);
      },
    );
  });
}
