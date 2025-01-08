import 'package:flutter/material.dart';
import 'package:movie_riverpod/presentation/screens/bottom_tabs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomTabScreen(),
            ));
      },
    );
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF685d5d),
      body: Center(
        child: Image.asset('assets/loading.jpg'),
      ),
    );
  }
}
