import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../data/data_sources/profile_remote_data_source_impl.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio dio;
  late ProfileRemoteDataSourceImpl dataSource;

  setUp(() {
    dio = MockDio();
    dataSource = ProfileRemoteDataSourceImpl(dio);
  });

  test('should return json when Dio succeeds', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: ''),
        data: {'id': 1, 'name': 'Test'},
        statusCode: 200,
      ),
    );

    final result = await dataSource.fetchProfileById(1);
    expect(result['id'], 1);
  });
}
