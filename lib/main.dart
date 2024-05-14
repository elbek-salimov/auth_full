import 'package:auth/screens/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      navigatorKey: navigatorKey,
      initialRoute: RouteNames.splashRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
