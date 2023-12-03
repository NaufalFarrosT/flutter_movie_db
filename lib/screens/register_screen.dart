import 'package:yt_flutter_movie_db/controllers/registrationController.dart';
import 'package:yt_flutter_movie_db/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegistrationController registrationController =
      Get.put(RegistrationController());
  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff154C79),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: const Text(
                  'Register New User',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: registrationController.usernameController,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please enter username'
                      : null;
                },
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter your username'),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: registrationController.nameController,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please enter name'
                      : null;
                },
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name'),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: registrationController.emailController,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please Enter Email'
                      : null;
                },
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email'),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: registrationController.passwordController,
                obscureText: !_passwordVisible,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please enter password'
                      : null;
                },
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  height: 45,
                  width: 120,
                  child: TextButton(
                    onPressed: () => registrationController.RegisterSubmit(),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 25, color: Color(0xff154C79)),
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
                    'Already have an account? ',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const LoginScreen());
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      )),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
