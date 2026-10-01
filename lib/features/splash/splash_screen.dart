import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/utile/app_constance.dart';
import 'package:todo_app/features/home/home_screen.dart';
import 'package:todo_app/features/login/data/user_model.dart';
import 'package:todo_app/features/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      nextpage();
    });
    super.initState();
  }

  nextpage() {
    UserModel? user = Hive.box<UserModel>(AppConstants.userBox).get(AppConstants.currentUser);
    print('User from Hive: ${user?.name}, ${user?.image}'); // Debugging line
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/icons/Checklist.json')),
    );
  }
}
