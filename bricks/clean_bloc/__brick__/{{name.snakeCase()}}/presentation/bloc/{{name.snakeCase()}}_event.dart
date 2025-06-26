part of '{{name.snakeCase()}}_bloc.dart';

abstract class {{name.pascalCase()}}Event {}

class Load{{name.pascalCase()}} extends {{name.pascalCase()}}Event {
  final int id;

  Load{{name.pascalCase()}}({required this.id});
}
