import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_task_flutterapp/firebase_options.dart';
import 'package:memoneet_task_flutterapp/view_model/routes/name_routes.dart';
import 'package:memoneet_task_flutterapp/view_model/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // routes for navigating through screens
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
