import 'package:yt_flutter_movie_db/controllers/loginController.dart';
import 'package:yt_flutter_movie_db/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff154C79),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/img/logo.png",
                    height: 100,
                    width: 140,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Username',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: loginController.emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Enter an email",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: loginController.passwordController,
                  obscureText: !_passwordVisible,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Enter a password",
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    height: 45,
                    width: 120,
                    child: TextButton(
                      onPressed: () => loginController.doLogin(),
                      child: const Text(
                        'Login',
                        style:
                            TextStyle(fontSize: 25, color: Color(0xff154C79)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do not have an account? ',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(const RegisterScreen());
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        )),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
