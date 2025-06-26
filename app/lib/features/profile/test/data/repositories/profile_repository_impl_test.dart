import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../data/data_sources/profile_remote_data_source.dart';
import '../../../data/repositories/profile_repository_impl.dart';
import '../../../domain/entities/profile.dart';

class MockRemoteDataSource extends Mock implements ProfileRemoteDataSource {}

void main() {
  late ProfileRepositoryImpl repo;
  late MockRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRemoteDataSource();
    repo = ProfileRepositoryImpl(mockDataSource);
  });

  test('should return mapped entity when remote returns json', () async {
    final json = {'id': 1, 'name': 'Test'};
    when(
      () => mockDataSource.fetchProfileById(1),
    ).thenAnswer((_) async => json);

    final result = await repo.getProfile(1);

    expect(result, isA<Profile>());
    expect(result.id, 1);
  });
}
