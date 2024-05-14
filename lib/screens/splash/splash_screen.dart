import 'package:auth/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/size/app_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RouteNames.loginRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'ELBEK\nMOBILE\nDEV',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  shadows: [
                    const Shadow(
                        offset: Offset(3, 3),
                        color: Colors.black38,
                        blurRadius: 10),
                    Shadow(
                        offset: const Offset(-3, -3),
                        color: Colors.white.withOpacity(0.85),
                        blurRadius: 10)
                  ],
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
