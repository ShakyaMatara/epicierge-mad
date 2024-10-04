import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:untitled4/screens/homepage.dart';
import '../rounded_button.dart';
import '../services/auth_services.dart';
import '../services/globals.dart';
import 'theme_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  createAccountPressed() async {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      http.Response response =
      await AuthServices.register(username, phone, email, password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  orientation == Orientation.portrait
                      ? "assets/register_background_portrait.png"
                      : "assets/register_background_landscape.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: isDarkMode ? Colors.black.withOpacity(0.7) : Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to Epicierge!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                        hintText: 'Username',
                        hintStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                        hintText: 'email@domain.com',
                        hintStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      obscureText: true,
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          confirmPassword = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      obscureText: true,
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDarkMode ? Colors.grey[800] : Colors.orangeAccent,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Sign up'),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
