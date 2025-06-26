import 'package:injectable/injectable.dart';
import '../entities/{{name.snakeCase()}}.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';


@injectable
class Get{{name.pascalCase()}} {
  const Get{{name.pascalCase()}}(this.repository);

  final {{name.pascalCase()}}Repository repository;


  Future<{{name.pascalCase()}}> call(int id) {
    return repository.get{{name.pascalCase()}}(id);
  }
}
