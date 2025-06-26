part of '{{name.snakeCase()}}_bloc.dart';

abstract class {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Loaded extends {{name.pascalCase()}}State {
  final {{name.pascalCase()}} {{name.camelCase()}};

  {{name.pascalCase()}}Loaded(this.{{name.camelCase()}});
}

class {{name.pascalCase()}}Error extends {{name.pascalCase()}}State {}
