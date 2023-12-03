import 'package:dio/dio.dart';
import 'package:yt_flutter_movie_db/config/dio_http.dart';
import 'package:yt_flutter_movie_db/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<dynamic> RegisterSubmit() async {
    var data = {
      "username": usernameController.text,
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text
    };

    try {
      var response = await DioHttp.request.post("/api/register", data: data);

      print(response);

      Get.to(const LoginScreen());
    } on DioError catch (dioError) {
      var message = "";
      switch (dioError.response!.statusCode) {
        case 422:
          Map<String, dynamic> _errorData = dioError.response!.data["errors"];
          var getListMessage = _errorData.values;
          var result = getListMessage.map((item) =>
              item.toString().substring(1, item.toString().length - 2));

          message = result.join("\n");
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
