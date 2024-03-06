import 'package:heal_her/features/profile/data/model/profile_model.dart';

abstract class ProfileLocalDataSrc {
  Future<ProfileModel> getProfileData();
}
