import 'package:injectable/injectable.dart';

@lazySingleton
class {{name.pascalCase()}}Provider {
  Future<void> fetch() async {
    // TODO: fetch from API or DB
  }
}
