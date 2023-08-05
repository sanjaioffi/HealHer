import 'package:get/get.dart';
import 'package:heal_her/presentation/screens/onboarding/view/height/user_height.dart';
import 'package:heal_her/presentation/screens/onboarding/view/weight/user_weight.dart';
import '../screens/onboarding/view/activities/activities_screen.dart';
import '../screens/onboarding/view/dob/date_of_birth.dart';
import '../screens/onboarding/view/food/onboard_food.dart';
import '../screens/onboarding/view/gender/onboard_gender.dart';
import '../screens/onboarding/view/last_period_date/last_period_date_screen.dart';
import '../screens/onboarding/view/medical_condition/medical_condition.dart';
import '../screens/onboarding/view/notification/onboard_notification.dart';
import '../screens/onboarding/view/period_length/period_length_screen.dart';
import '../screens/onboarding/view/profile_choice/profile_icon_choice.dart';
import '../screens/onboarding/view/region/onboard_region.dart';
import '../screens/onboarding/view/sign_process/login.dart';
import '../screens/onboarding/view/sign_process/sign_up.dart';
import '../screens/onboarding/view/targets/targets_screen.dart';
import '../screens/onboarding/view/user_name/user_name.dart';
import '../screens/onboarding/view/welcome/welcome_screen.dart';

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
  GetPage(name: '/weight', page: () => const OnboardWeight()),
  GetPage(name: '/food_type', page: () => const OnboardFoodScreen()),
  GetPage(name: '/region', page: () => const OnboardRegionScreen()),
  GetPage(name: '/targets', page: () => const TargetsScreen()),
  GetPage(name: '/activities', page: () => const ActivitiesScreen()),
  GetPage(
      name: '/medical_condition', page: () => const MedicalConditionScreen()),
  GetPage(name: '/profile', page: () => const ProfileChoice()),
  GetPage(name: '/notification', page: () => const OnBoardNotificationScreen()),
];
