import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/entities/profile.dart';
import '../../../domain/usecases/get_profile.dart';
import '../../../presentation/bloc/profile_bloc.dart';

class MockGetProfile extends Mock implements GetProfile {}

void main() {
  late ProfileBloc bloc;
  late MockGetProfile mockUseCase;

  setUp(() {
    mockUseCase = MockGetProfile();
    bloc = ProfileBloc(getProfile: mockUseCase);
  });

  test('initial state is ProfileInitial', () {
    expect(bloc.state, ProfileInitial());
  });

  blocTest<ProfileBloc, ProfileState>(
    'emits [Loading, Loaded] when data is fetched successfully',
    build: () {
      when(
        () => mockUseCase.call(1),
      ).thenAnswer((_) async => Profile(id: 1, name: 'Test'));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadProfile(id: 1)),
    expect: () => [ProfileLoading(), isA<ProfileLoaded>()],
  );
}
