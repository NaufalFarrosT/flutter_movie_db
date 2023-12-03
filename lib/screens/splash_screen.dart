import 'package:yt_flutter_movie_db/main.dart';
import 'package:yt_flutter_movie_db/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    autoLogin();
    super.initState();
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user-token');
    if (userToken != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(const App());
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(const LoginScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/img/logo.png", height: 90, width: 140,),
            const SizedBox(
              height: 15,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
