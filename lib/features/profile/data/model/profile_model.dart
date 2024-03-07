import '../../domain/entity/profile_entity.dart';

class ProfileModel {
  final double profileHeight;
  final double profileWeight;
  final int profileAge;

  //
  ProfileModel({
    required this.profileHeight,
    required this.profileWeight,
    required this.profileAge,
  });

  Profile toProfile() {
    return Profile(
        profileHeight: profileHeight,
        profileWeight: profileWeight,
        profileAge: profileAge);
  }
}
