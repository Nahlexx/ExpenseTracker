import 'package:expense_tracker/intros/forgotpass.dart';
import 'package:expense_tracker/intros/signup.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
//FOR THE LOGINPAGE

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A73E8), Color(0xFF64B5F6)],
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: SizedBox(
                  height: 400, 
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTitle(),
                            const SizedBox(height: 30),
                            CustomInputField(
                              labelText: "Username",
                              icon: Icons.person,
                            ),
                            const SizedBox(height: 15),
                            CustomInputField(
                              labelText: "Password",
                              icon: Icons.lock,
                              obscureText: true,
                            ),
                            const SizedBox(height: 5),
                            _buildForgotPassword(context),
                            const SizedBox(height: 25),
                            _buildLoginButton(context),
                            const SizedBox(height:25),
                            _buildCreateAccount(context),
                          ],
                        ),
                      ),



                      const VerticalDivider(
                        color: Colors.black26,
                        thickness: 1,
                        width: 40,
                      ),

                     _buildRight(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      "USER LOGIN",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomehPage()),
          );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:  Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

Widget _buildForgotPassword(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2),
    child: Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPassPage()),
          );
        },
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ),
  );
}

Widget _buildCreateAccount(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2),
    child: Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupPage()),
          );
      },
        child: const Text(
          "Create Account",
          style: TextStyle(
            color: Colors.blue,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    ),
  );
}

Widget _buildRight() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
        CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('assets/storm.jpg'),
        ),
        SizedBox(height:20),
        Text(
        "Take control of your finances with our easy-to-use expense tracking app.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue,
          fontFamily: 'Poppins',
          height: 1.5,
          letterSpacing: 0.3,
        ),
      ),
        ],
      ),
      
    ),
  );
}

}

class CustomInputField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon),
      ),
    );
  }
}