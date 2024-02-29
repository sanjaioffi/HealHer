import 'package:get/get.dart';
import 'package:heal_her/features/recommendation/presentation/pages/workout/workout_rec.dart';

import '../../features/activity/presentation/activity.dart';
import '../../features/app/presentation/app.dart';
import '../../features/onboard/presentation/onboard.dart';
import '../../features/onboard/presentation/pages/details/user_condition.dart';
import '../../features/onboard/presentation/pages/details/user_dob.dart';
import '../../features/onboard/presentation/pages/details/user_gender.dart';
import '../../features/onboard/presentation/pages/details/user_height.dart';
import '../../features/onboard/presentation/pages/details/user_name.dart';
import '../../features/onboard/presentation/pages/details/user_period_cycle.dart';
import '../../features/onboard/presentation/pages/details/user_period_date.dart';
import '../../features/onboard/presentation/pages/details/user_region.dart';
import '../../features/onboard/presentation/pages/details/user_weight.dart';
import '../../features/onboard/presentation/pages/preferences/user_targets.dart';
import '../../features/onboard/presentation/pages/registration/sign_process/login.dart';
import '../../features/onboard/presentation/pages/registration/sign_process/sign_up.dart';
import '../../features/onboard/presentation/widgets/food/onboard_food.dart';
import '../../features/step/presentation/step.dart';

List<GetPage> routes = [
  GetPage(name: '/', page: () => const WelcomeScreen()),
  GetPage(name: '/signup', page: () => const SignUp()),
  GetPage(name: '/signin', page: () => const Login()),
  GetPage(name: '/name', page: () => const OnBoardingNameScreen()),
  GetPage(name: '/dob', page: () => const OnBoardingDobScreen()),
  GetPage(name: '/gender', page: () => const OnBoardGenderScreen()),
  GetPage(name: '/period_length', page: () => const OnboardPeriodScreen()),
  GetPage(
      name: '/workoutRecommendation',
      page: () => const WorkoutRecommendationPage()),
  GetPage(
      name: '/last_period_date',
      page: () => const OnboardLastPeriodDateScreen()),
  GetPage(name: '/height', page: () => const OnBoardHeightScreen()),
  GetPage(name: '/weight', page: () => const OnBoardWeightScreen()),
  GetPage(name: '/food_type', page: () => const OnboardFoodScreen()),
  GetPage(name: '/region', page: () => const OnboardRegionScreen()),
  GetPage(name: '/targets', page: () => const OnboardTargetScreen()),
  GetPage(name: '/activities', page: () => const ActivitiesScreen()),
  GetPage(
      name: '/medical_condition', page: () => const MedicalConditionScreen()),
  GetPage(name: '/steps', page: () => const StepsScreen()),
  GetPage(name: '/main', page: () => const MainScreen())
];
