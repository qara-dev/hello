import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../domain/entities/profile.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../../domain/usecases/get_profile.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late GetProfile useCase;
  late MockProfileRepository mockRepo;

  setUp(() {
    mockRepo = MockProfileRepository();
    useCase = GetProfile(mockRepo);
  });

  test('should return Profile when repository returns data', () async {
    final tProfile = Profile(id: 1, name: 'Test');

    when(() => mockRepo.getProfile(1)).thenAnswer((_) async => tProfile);

    final result = await useCase(1);

    expect(result, tProfile);
    verify(() => mockRepo.getProfile(1)).called(1);
  });
}
