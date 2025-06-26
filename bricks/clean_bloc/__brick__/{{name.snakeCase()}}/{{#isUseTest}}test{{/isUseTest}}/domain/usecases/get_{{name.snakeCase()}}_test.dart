import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../domain/entities/{{name.snakeCase()}}.dart';
import '../../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../../../domain/usecases/get_{{name.snakeCase()}}.dart';

class Mock{{name.pascalCase()}}Repository extends Mock implements {{name.pascalCase()}}Repository {}

void main() {
  late Get{{name.pascalCase()}} useCase;
  late Mock{{name.pascalCase()}}Repository mockRepo;

  setUp(() {
    mockRepo = Mock{{name.pascalCase()}}Repository();
    useCase = Get{{name.pascalCase()}}(mockRepo);
  });

  test('should return {{name.pascalCase()}} when repository returns data', () async {
    final t{{name.pascalCase()}} = {{name.pascalCase()}}(id: 1, name: 'Test');

    when(() => mockRepo.get{{name.pascalCase()}}(1)).thenAnswer((_) async => t{{name.pascalCase()}});

    final result = await useCase(1);

    expect(result, t{{name.pascalCase()}});
    verify(() => mockRepo.get{{name.pascalCase()}}(1)).called(1);
  });
}
