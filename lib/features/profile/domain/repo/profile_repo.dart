import '../entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<Profile> getProfileData();
}
