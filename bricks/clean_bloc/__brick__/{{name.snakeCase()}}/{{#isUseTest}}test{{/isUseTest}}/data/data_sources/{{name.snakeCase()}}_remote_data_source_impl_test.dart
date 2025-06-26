import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../data/data_sources/{{name.snakeCase()}}_remote_data_source_impl.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio dio;
  late {{name.pascalCase()}}RemoteDataSourceImpl dataSource;

  setUp(() {
    dio = MockDio();
    dataSource = {{name.pascalCase()}}RemoteDataSourceImpl(dio);
  });

  test('should return json when Dio succeeds', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: ''),
        data: {'id': 1, 'name': 'Test'},
        statusCode: 200,
      ),
    );

    final result = await dataSource.fetch{{name.pascalCase()}}ById(1);
    expect(result['id'], 1);
  });
}
