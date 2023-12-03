import 'package:dio/dio.dart';
import 'package:yt_flutter_movie_db/config/dio_http.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yt_flutter_movie_db/main.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<dynamic> doLogin() async {
    var data = {"email": emailController.text, "password": passwordController.text};

    try {
      var response = await DioHttp.request.post("/api/login", data: data);
      
      print(response);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user-token', response.data["token"]);
      prefs.setString('user-email', emailController.text);

      emailController.text = "";
      passwordController.text = "";

      Get.to(const App());

    } on DioError catch (dioError) {
      var message = "";
      switch (dioError.response!.statusCode) {
        case 400:
          print(dioError.response!.data["message"].toString());
          message = dioError.response!.data["message"].toString();
          break;
        case 404:
          message = "server not found";
          break;
        default:

          message = "Server Error";
      }
      print(message);
    }
  }
}
