import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import '../../../data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import '../../../domain/entities/{{name.snakeCase()}}.dart';

class MockRemoteDataSource extends Mock implements {{name.pascalCase()}}RemoteDataSource {}

void main() {
  late {{name.pascalCase()}}RepositoryImpl repo;
  late MockRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRemoteDataSource();
    repo = {{name.pascalCase()}}RepositoryImpl(mockDataSource);
  });

  test('should return mapped entity when remote returns json', () async {
    final json = {'id': 1, 'name': 'Test'};
    when(() => mockDataSource.fetch{{name.pascalCase()}}ById(1))
        .thenAnswer((_) async => json);

    final result = await repo.get{{name.pascalCase()}}(1);

    expect(result, isA<{{name.pascalCase()}}>());
    expect(result.id, 1);
  });
}
