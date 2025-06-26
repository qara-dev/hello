import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../presentation/bloc/{{name.snakeCase()}}_bloc.dart';
import '../../../domain/usecases/get_{{name.snakeCase()}}.dart';
import '../../../domain/entities/{{name.snakeCase()}}.dart';

class MockGet{{name.pascalCase()}} extends Mock implements Get{{name.pascalCase()}} {}

void main() {
  late {{name.pascalCase()}}Bloc bloc;
  late MockGet{{name.pascalCase()}} mockUseCase;

  setUp(() {
    mockUseCase = MockGet{{name.pascalCase()}}();
    bloc = {{name.pascalCase()}}Bloc(get{{name.pascalCase()}}: mockUseCase);
  });

  test('initial state is {{name.pascalCase()}}Initial', () {
    expect(bloc.state, {{name.pascalCase()}}Initial());
  });

  blocTest<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
    'emits [Loading, Loaded] when data is fetched successfully',
    build: () {
      when(() => mockUseCase.call(1))
        .thenAnswer((_) async => {{name.pascalCase()}}(id: 1, name: 'Test'));
      return bloc;
    },
    act: (bloc) => bloc.add(Load{{name.pascalCase()}}(id: 1)),
    expect: () => [
      {{name.pascalCase()}}Loading(),
      isA<{{name.pascalCase()}}Loaded>(),
    ],
  );
}
