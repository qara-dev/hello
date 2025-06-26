import 'package:injectable/injectable.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

@injectable
class GetProfile {
  const GetProfile(this.repository);

  final ProfileRepository repository;

  Future<Profile> call(int id) {
    return repository.getProfile(id);
  }
}
