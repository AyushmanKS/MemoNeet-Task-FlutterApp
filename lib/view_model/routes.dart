import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/view/home_screen.dart';
import 'package:memoneet_task_flutterapp/view/login_screen.dart';
import 'package:memoneet_task_flutterapp/view/registration_screen.dart';
import 'package:memoneet_task_flutterapp/view/splash_screen.dart';
import 'package:memoneet_task_flutterapp/view_model/name_routes.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // switch cases for nagitation through screens
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RouteName.loginScreen:
        final args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => LoginScreen(args: args));

      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RouteName.registrationScreen:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());

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
