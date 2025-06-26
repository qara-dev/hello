import 'package:injectable/injectable.dart';

import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../mappers/profile_mapper.dart';
import '../models/profile_model.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this.remoteDataSource);

  final ProfileRemoteDataSource remoteDataSource;

  @override
  Future<Profile> getProfile(int id) async {
    final json = await remoteDataSource.fetchProfileById(id);
    final model = ProfileModel.fromJson(json);
    return ProfileMapper.toEntity(model);
  }
}
