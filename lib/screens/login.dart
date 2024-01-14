//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shawarmaversion2/screens/signup.dart';
import 'package:shawarmaversion2/screens/profile.dart';
import 'package:shawarmaversion2/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: AssetImage("images/bg.png"),
          fit: BoxFit.fill,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage('images/Logo.png')),
          Text(
            "SHARAMHA",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    // Email Validation
    bool isEmailValid(String email) {
      // Regular expression for a simple email validation
      // This is a basic example and may not cover all edge cases
      // For a more robust solution, consider using a dedicated email validation package
      RegExp emailRegExp =
          RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      return emailRegExp.hasMatch(email);
    }

    // Password Validation
    bool isPasswordValid(String password) {
      // Regular expression for password validation
      // Requires at least one capital letter, one digit, and a minimum length of 6 characters
      RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
      return passwordRegExp.hasMatch(password);
    }

    return Form(
      key: _loginFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(
                color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
          ),
          _buildGreyText("Please login with your information"),
          const SizedBox(height: 60),
          _buildGreyText("Email address"),
          _buildInputField(emailController, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email address';
            } else if (isEmailValid(value)) {
              // Email is valid, proceed with login logic
              // Your login logic here
            } else {
              // Invalid email, show an error message or handle accordingly
              return 'Invalid email address';
            }
            // You can add additional email format validation here if needed.
            return null;
          }),
          const SizedBox(height: 40),
          _buildGreyText("Password"),
          _buildInputField(passwordController, isPassword: true,
              validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (isPasswordValid(value)) {
              // Password is valid, proceed with registration or password change logic
              // Your logic here
            } else {
              // Invalid password, show an error message or handle accordingly
              return ('Invalid password format\nYour password must contain at least A capital letter,\nat least a digit, and must be of length at least 6.');
            }
            return null;
          }),
          const SizedBox(height: 20),
          _buildRememberForgot(),
          const SizedBox(height: 20),
          _buildLoginButton(),
          const SizedBox(height: 20),
          _buildOtherLogin(),
        ],
      ),
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false, String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
      validator: validator,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              },
              activeColor: Color.fromARGB(255, 255, 212, 148),
            ),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SingUpPage()),
              );
            },
            child: _buildGreyText("Create account"))
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_loginFormKey.currentState!.validate()) {
          _handleLogin();
          // Perform login logic
          // debugPrint("Email : ${emailController.text}");
          // debugPrint("Password : ${passwordController.text}");
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => MyHomePage()),
          // );
        }
        // debugPrint("Email : ${emailController.text}");
        // debugPrint("Password : ${passwordController.text}");
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => MyHomePage()),
        // );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 212, 148),
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("Or Login with"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 35,
                width: 35,
                child: Image(image: AssetImage("images/google.png")),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _handleLogin() {
    Auth()
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .whenComplete(() {
      print("User logged in succesfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    });
  }
}
