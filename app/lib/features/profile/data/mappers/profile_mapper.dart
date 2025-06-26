import '../../domain/entities/profile.dart';
import '../models/profile_model.dart';

class ProfileMapper {
  static Profile toEntity(ProfileModel model) {
    return Profile(id: model.id, name: model.name);
  }

  static ProfileModel toModel(Profile entity) {
    return ProfileModel(id: entity.id, name: entity.name);
  }
}
