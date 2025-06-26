import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'profile_remote_data_source.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<Map<String, dynamic>> fetchProfileById(int id) async {
    try {
      final response = await dio.get('/profiles/\$id');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
}
