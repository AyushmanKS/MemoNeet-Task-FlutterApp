import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view/home_screen.dart';
import 'package:memoneet_task_flutterapp/view/login_screen.dart';
import 'package:memoneet_task_flutterapp/view/profile_screen.dart';
import 'package:memoneet_task_flutterapp/view/registration_screen.dart';
import 'package:memoneet_task_flutterapp/view/splash_screen.dart';
import 'package:memoneet_task_flutterapp/view/users_screen.dart';
import 'package:memoneet_task_flutterapp/view_model/routes/name_routes.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // switch cases for nagitation through screens
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RouteName.loginScreen:
        //final args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case RouteName.homeScreen:
        //final args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case RouteName.registrationScreen:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());

      case RouteName.profileScreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen());

      case RouteName.usersScreen:
        return MaterialPageRoute(builder: (context) => const UsersScreen());

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong...'),
              ),
            );
          },
        );
    }
  }
}
