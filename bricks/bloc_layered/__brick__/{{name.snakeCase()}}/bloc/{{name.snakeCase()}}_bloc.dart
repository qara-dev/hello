import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

@injectable
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super({{name.pascalCase()}}Initial()) {
    on<Load{{name.pascalCase()}}>((event, emit) {
      // TODO: implement logic
    });
  }
}
