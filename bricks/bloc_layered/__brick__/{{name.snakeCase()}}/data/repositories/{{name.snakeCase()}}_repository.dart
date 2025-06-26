import 'package:injectable/injectable.dart';
import '../providers/{{name.snakeCase()}}_provider.dart';

@lazySingleton
class {{name.pascalCase()}}Repository {
  const {{name.pascalCase()}}Repository(this._provider);

  final {{name.pascalCase()}}Provider _provider;


  Future<void> fetchData() async {
    _provider.fetch();
  }
}
