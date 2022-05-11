import 'dart:io';
import 'package:get/get.dart';
import 'package:tmdb_movie/auth.dart/Login.dart';
import 'package:tmdb_movie/constants/colors.dart';
import 'package:tmdb_movie/controller/api_services.dart';
import 'package:tmdb_movie/text_inputfile.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // File? image = authController.selectedImage;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  void register() {
    authController.registerUser(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
      File(authController.selectedImage.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: backgroudcolor,
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Movie Jaano",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 14,
                      color: primarycolor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Obx(
                        () => authController.selectedImage.value == ''
                            ? const CircleAvatar(
                                radius: 64,
                                backgroundColor: Colors.black,
                                backgroundImage: NetworkImage(
                                    'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundColor: Colors.black,
                                backgroundImage: Image.file(File(
                                        authController.selectedImage.value))
                                    .image),
                      ),
                      Positioned(
                        bottom: -8,
                        left: 85,
                        child: IconButton(
                          onPressed: () => authController.pickImage(),
                          icon: const Icon(
                            Icons.add_a_photo,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInputField(
                      controller: _usernameController,
                      labelText: 'Username',
                      icon: Icons.person,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInputField(
                      controller: _emailController,
                      labelText: 'Email',
                      icon: Icons.email,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInputField(
                      controller: _passwordController,
                      labelText: 'Password',
                      icon: Icons.lock,
                      isObscure: true,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: buttoncolor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        register();
                      },
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
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
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Loginscreen(),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
