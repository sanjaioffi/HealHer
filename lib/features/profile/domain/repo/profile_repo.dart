import 'package:heal_her/features/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<Profile> getProfileData();
}
