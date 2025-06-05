import 'package:flutter/material.dart';
import 'package:stylus/auth/auth_service.dart';
import 'package:stylus/pages/home_page.dart';
import 'package:stylus/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get the auth service
  final authService = AuthService();

  // text controllers

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // login button pressed
  void login() async {
    // prepare the data
    final email = _emailController.text;
    final password = _passwordController.text;

    //attempt to login...
    try {
      await authService.signInWithEmailPassword(email, password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: ${e}")));
      }
    }
  }
  // build ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: ListView(
        children: [
          // email
          TextField(controller: _emailController,),
          
          
          
          // password

          TextField(controller: _passwordController,),

          // button
          ElevatedButton(onPressed: login, child: const Text("Login")),

          // sign up

          GestureDetector(
            onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
            child: Center(child: Text("Don't have an account? Sign Up")))
        ],
      ),
    );
  }
}
