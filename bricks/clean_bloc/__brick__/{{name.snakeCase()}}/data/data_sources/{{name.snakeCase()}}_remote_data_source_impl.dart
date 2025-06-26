import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '{{name.snakeCase()}}_remote_data_source.dart';

@LazySingleton(as: {{name.pascalCase()}}RemoteDataSource)
class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  const {{name.pascalCase()}}RemoteDataSourceImpl(this.dio);

  final Dio dio;


  @override
  Future<Map<String, dynamic>> fetch{{name.pascalCase()}}ById(int id) async {
    try {
      final response = await dio.get('/{{name.snakeCase()}}s/\$id');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
}
