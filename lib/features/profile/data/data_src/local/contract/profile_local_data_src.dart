import '../../../model/profile_model.dart';

abstract class ProfileLocalDataSrc {
  Future<ProfileModel> getProfileData();
}
