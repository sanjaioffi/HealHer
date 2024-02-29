import 'package:get/get.dart';
import 'package:heal_her/config/routes/route_names.dart';
import 'package:heal_her/features/activity/presentation/activity.dart';
import 'package:heal_her/features/app/presentation/app.dart';
import 'package:heal_her/features/onboard/presentation/onboard.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/user_activity.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/user_gender.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/user_weight.dart';
import 'package:heal_her/features/step/presentation/step.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/user_dob.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/user_height.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/user_period_date.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/user_condition.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/user_period_cycle.dart';
import 'package:heal_her/features/onboard/presentation/pages/registration/sign_process/login.dart';
import 'package:heal_her/features/onboard/presentation/pages/registration/sign_process/sign_up.dart';
import 'package:heal_her/features/onboard/presentation/pages/preferences/user_targets.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/user_name.dart';

List<GetPage> routes = [
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
