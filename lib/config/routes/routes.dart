import 'package:get/get.dart';
import 'package:heal_her/features/app/presentation/app.dart';
import 'package:heal_her/features/onboard/presntation/onboard.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/activities/activities_screen.dart';
import 'package:heal_her/features/step/presentation/step.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/date_of_birth.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/food/onboard_food.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/gender/onboard_gender.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/user_height.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/last_period_date/last_period_date_screen.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/medical_condition/medical_condition.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/period_length/period_length_screen.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/onboard_region.dart';
import 'package:heal_her/features/onboard/presntation/pages/registration/sign_process/login.dart';
import 'package:heal_her/features/onboard/presntation/pages/registration/sign_process/sign_up.dart';
import 'package:heal_her/features/onboard/presntation/pages/preferences/targets/targets_screen.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/user_name.dart';

List<GetPage> routes = [
  GetPage(name: '/', page: () => const WelcomeScreen()),
  GetPage(name: '/signup', page: () => const SignUp()),
  GetPage(name: '/signin', page: () => const Login()),
  GetPage(name: '/name', page: () => const OnBoardingNameScreen()),
  GetPage(name: '/dob', page: () => const OnBoardingDOB()),
  GetPage(name: '/gender', page: () => const OnBoardGenderScreen()),
  GetPage(name: '/period_length', page: () => const PeriodLengthScreen()),
  GetPage(name: '/last_period_date', page: () => const LastPeriodDateScreen()),
  GetPage(name: '/height', page: () => const OnBoardHeight()),
  GetPage(name: '/weight', page: () => const OnBoardHeight()),
  GetPage(name: '/food_type', page: () => const OnboardFoodScreen()),
  GetPage(name: '/region', page: () => const OnboardRegionScreen()),
  GetPage(name: '/targets', page: () => const TargetsScreen()),
  GetPage(name: '/activities', page: () => const ActivitiesScreen()),
  GetPage(
      name: '/medical_condition', page: () => const MedicalConditionScreen()),
  GetPage(name: '/steps', page: () => const StepsScreen()),
  GetPage(name: '/main', page: () => const MainScreen())
];
