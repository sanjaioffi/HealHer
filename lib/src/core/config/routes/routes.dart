import 'package:get/get.dart';
import '../../../features/recommendation/presentation/pages/food/food_rec.dart';
import '../../../features/recommendation/presentation/pages/workout/workout_rec.dart';

import '../../../features/app/presentation/app.dart';
import '../../../features/onboard/presentation/onboard.dart';
import '../../../features/onboard/presentation/pages/details/user_activity.dart';
import '../../../features/onboard/presentation/pages/details/user_condition.dart';
import '../../../features/onboard/presentation/pages/details/user_dob.dart';
import '../../../features/onboard/presentation/pages/details/user_gender.dart';
import '../../../features/onboard/presentation/pages/details/user_height.dart';
import '../../../features/onboard/presentation/pages/details/user_name.dart';
import '../../../features/onboard/presentation/pages/details/user_period_cycle.dart';
import '../../../features/onboard/presentation/pages/details/user_period_date.dart';
import '../../../features/onboard/presentation/pages/details/user_weight.dart';
import '../../../features/onboard/presentation/pages/registration/sign_process/login.dart';
import '../../../features/onboard/presentation/pages/registration/sign_process/sign_up.dart';
import '../../../features/recommendation/presentation/widgets/rec_detail_page.dart';
import '../../../features/step/presentation/step.dart';
import 'route_names.dart';

List<GetPage> routes = [
  GetPage(
      name: "/foodRecommendation", page: () => const FoodRecommendationPage()),
  //
  GetPage(name: AppRoute.onboardWelcome, page: () => const WelcomeScreen()),

  //
  GetPage(name: AppRoute.signin, page: () => const SignUp()),
  //
  GetPage(name: AppRoute.login, page: () => const Login()),

  //
  GetPage(name: AppRoute.onboardName, page: () => const OnBoardingNameScreen()),

  //
  GetPage(name: AppRoute.onboardDob, page: () => const OnBoardingDobScreen()),

  //
  //
  GetPage(
      name: AppRoute.onboardGender, page: () => const OnBoardGenderScreen()),
  //
  GetPage(
      name: AppRoute.onboardPeriodLength,
      page: () => const OnboardPeriodScreen()),
  GetPage(
      name: '/workoutRecommendation',
      page: () => const WorkoutRecommendationPage()),
  GetPage(
      name: '/RecommendationDetail', page: () => RecommendationDetailPage()),

  //
  GetPage(
      name: AppRoute.onboardPeriodDays,
      page: () => const OnboardLastPeriodDateScreen()),

  //
  GetPage(
      name: AppRoute.onboardHeight, page: () => const OnBoardHeightScreen()),
  //
  //
  GetPage(
      name: AppRoute.onboardWeight, page: () => const OnBoardWeightScreen()),

  //
  // GetPage(name: AppRoute., page: () => const OnboardTargetScreen()),

  //
  //
  GetPage(name: AppRoute.onboardFitness, page: () => const OnboardActivity()),

  //
  GetPage(
      //
      name: AppRoute.onboardMedicalIssue,
      page: () => const MedicalConditionScreen()),

  //

  //
  //
  //
  //
  GetPage(name: AppRoute.stepScreen, page: () => const StepsScreen()),
  //
  //
  //
  //
  GetPage(name: AppRoute.homeScreen, page: () => const MainScreen())
];