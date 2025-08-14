import 'package:austere/core/routes/app_routes.dart';
import 'package:austere/feature/temp/logic/binding/home/home_binding.dart';
import 'package:austere/feature/temp/logic/binding/splash/custom_splash_binding.dart';
import 'package:austere/feature/temp/logic/binding/forget_password/forget_password_binding.dart';
import 'package:austere/feature/temp/logic/binding/forget_password/reset_password_binding.dart';
import 'package:austere/feature/temp/logic/binding/forget_password/send_code_binding.dart';
import 'package:austere/feature/temp/logic/binding/login/login_binding.dart';
import 'package:austere/feature/temp/logic/binding/signUp/signUp_binding.dart';
import 'package:austere/feature/temp/logic/binding/user_list/user_list_binding.dart';
import 'package:austere/feature/temp/view/screen/forget_password/forget_password_screen.dart';
import 'package:austere/feature/temp/view/screen/forget_password/reset_password_screen.dart';
import 'package:austere/feature/temp/view/screen/forget_password/send_code_screen.dart';
import 'package:austere/feature/temp/view/screen/home/home_screen.dart';
import 'package:austere/feature/temp/view/screen/login_screen/login_screen.dart';
import 'package:austere/feature/temp/view/screen/signUp_screen/signUp_screen.dart';
import 'package:austere/feature/temp/view/screen/splash/splash_screen.dart';
import 'package:austere/feature/temp/view/screen/user_list/user_list_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static const initial = '/splash';
  static final routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => ForgotPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.sendCode,
      page: () => SendCodeScreen(),
      binding: SendCodeBinding(),
    ),

    
    GetPage(
      name: AppRoutes.SignUp,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.usersList,
      page: () => UsersListScreen(),
      binding: UsersListBinding(),
    ),

  ];
}
