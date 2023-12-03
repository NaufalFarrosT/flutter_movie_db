import 'package:flutter/material.dart';
import 'package:yt_flutter_movie_db/nav/DrawerScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile"),
          ],
        ),
      ),
      drawer: DrawerScreen(),
    );
  }
}
