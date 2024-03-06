import 'package:heal_her/features/profile/data/data_src/local/contract/profile_local_data_src.dart';
import 'package:heal_her/features/profile/data/model/profile_model.dart';
import 'package:heal_her/features/profile/domain/entity/profile_entity.dart';
import 'package:heal_her/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileLocalDataSrc profileLocalDataSrc;

  ProfileRepoImpl({
    required this.profileLocalDataSrc,
  });

  @override
  Future<Profile> getProfileData() async {
    final ProfileModel profileData = await profileLocalDataSrc.getProfileData();
    return profileData.toProfile();
  }
}
