import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/{{name.snakeCase()}}.dart';
import '../../domain/usecases/get_{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';


@injectable
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc({required this.get{{name.pascalCase()}}}) : super({{name.pascalCase()}}Initial()) {
    on<Load{{name.pascalCase()}}>((event, emit) async {
      emit({{name.pascalCase()}}Loading());
      try {
        final entity = await get{{name.pascalCase()}}(event.id);
        emit({{name.pascalCase()}}Loaded(entity));
      } catch (_) {
        emit({{name.pascalCase()}}Error());
      }
    });
  }

  final Get{{name.pascalCase()}} get{{name.pascalCase()}};
}
