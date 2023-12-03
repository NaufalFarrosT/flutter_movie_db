import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yt_flutter_movie_db/config/dio_http.dart';
import 'package:dio/dio.dart';
import 'package:yt_flutter_movie_db/screens/splash_screen.dart';
import 'package:yt_flutter_movie_db/screens/profile.dart';
import 'package:get/get.dart';
import 'package:yt_flutter_movie_db/main.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var email = "coba2@gmail.com";

  void main() {
    getEmail().then((String result) {
      email = result;
    });
  }

  Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userEmail = prefs.getString('user-email') ?? '';
    return userEmail;
  }

  Future<dynamic> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user-token');

    try {
      print('logout');
      var response = await DioHttp.request.post('/api/logout',
          options: Options(headers: {"authorization": "Bearer $userToken"}));

      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
    } catch (e) {
      print("gagal");
    }
  }

  @override
  void initState() {
    getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(email),
          currentAccountPicture:
              CircleAvatar(backgroundImage: AssetImage("assets/img/empty.png")),
          accountEmail: Text(email),
        ),
        DrawerListTile(
          iconData: Icons.group,
          title: "Home",
          onTilePressed: () {
            Get.to(const App());
          },
        ),
        DrawerListTile(
          iconData: Icons.person,
          title: "Profile",
          onTilePressed: () {
            Get.off(ProfileScreen());
          },
        ),
        DrawerListTile(
          iconData: Icons.logout,
          title: "Logout",
          onTilePressed: () {
            logout();
          },
        ),
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile(
      {Key? key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
