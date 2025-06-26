import '../../domain/entities/{{name.snakeCase()}}.dart';
import '../models/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}Mapper {
  static {{name.pascalCase()}} toEntity({{name.pascalCase()}}Model model) {
    return {{name.pascalCase()}}(id: model.id, name: model.name);
  }

  static {{name.pascalCase()}}Model toModel({{name.pascalCase()}} entity) {
    return {{name.pascalCase()}}Model(id: entity.id, name: entity.name);
  }
}
