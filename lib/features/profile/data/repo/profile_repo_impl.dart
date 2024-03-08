import '../../domain/entity/profile_entity.dart';
import '../../domain/repo/profile_repo.dart';
import '../data_src/local/contract/profile_local_data_src.dart';
import '../model/profile_model.dart';

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
