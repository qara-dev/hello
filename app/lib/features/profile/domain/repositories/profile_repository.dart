import "../entities/profile.dart";

abstract class ProfileRepository {
  Future<Profile> getProfile(int id);
}
