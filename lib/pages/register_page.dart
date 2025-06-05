import 'package:flutter/material.dart';
import 'package:stylus/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

    // get the auth service
  final authService = AuthService();

  // text controllers

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // sign up button pressed

  void signUp() async {
    //prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    final confrimPassword = _confirmPasswordController.text;

    //check that the passwords match
    if (password != confrimPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords don't match...")));
      return;
    }

    //attempt signup
    try {
      await authService.signUpWithEmailPassword(email, password);

      // pop this current register page
      Navigator.pop(context);
    } 
    // if there are errors
    catch(e) {
      if (mounted){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: ListView(
        children: [
          // email
          TextField(controller: _emailController,),
          
          
          
          // password

          TextField(controller: _passwordController,),

          // confirm password

          TextField(controller: _confirmPasswordController,),

          // button
          ElevatedButton(onPressed: signUp, child: const Text("Sign Up")),

        ],
      ),
    );
  }
  }