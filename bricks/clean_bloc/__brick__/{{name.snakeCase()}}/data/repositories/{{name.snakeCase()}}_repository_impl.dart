import 'package:injectable/injectable.dart';

import '../../domain/entities/{{name.snakeCase()}}.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import '../mappers/{{name.snakeCase()}}_mapper.dart';
import '../models/{{name.snakeCase()}}_model.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  const {{name.pascalCase()}}RepositoryImpl(this.remoteDataSource);

  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;

  @override
  Future<{{name.pascalCase()}}> get{{name.pascalCase()}}(int id) async {
    final json = await remoteDataSource.fetch{{name.pascalCase()}}ById(id);
    final model = {{name.pascalCase()}}Model.fromJson(json);
    return {{name.pascalCase()}}Mapper.toEntity(model);
  }
}
