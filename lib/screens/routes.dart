import 'package:auth/screens/auth/login_screen.dart';
import 'package:auth/screens/auth/password_reset_screen.dart';
import 'package:auth/screens/auth/register_screen.dart';
import 'package:auth/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashRoute:
        return navigate(const SplashScreen());

      case RouteNames.loginRoute:
        return navigate(const LoginScreen());

      case RouteNames.registerRoute:
        return navigate(const RegisterScreen());

      case RouteNames.passwordResetRoute:
        return navigate(const PasswordResetScreen());

      // Route for move the value to another window
      // case RouteNames.editProduct:
      //   Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
      //   return navigate(
      //     EditProductScreen(productName: map['productName'] as String),
      //   );

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashRoute = "/";
  static const String loginRoute = "/login_route";
  static const String registerRoute = "/register_route";
  static const String passwordResetRoute = "/password_reset_route";
}
