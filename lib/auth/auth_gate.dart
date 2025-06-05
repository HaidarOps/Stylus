/*

  AUTH GATE - Continously look for auth state changes

  ----------------------------------------------------

  unauthenticated -> LoginPage()
  authenticated -> HomePage()


 */

import 'package:flutter/material.dart';
import 'package:stylus/pages/home_page.dart';
import 'package:stylus/pages/login_page.dart';
import 'package:stylus/pages/stylists_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final session = supabase.auth.currentSession;

    // Add a slight delay to allow the splash screen to be visible if desired
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    if (session != null) {
      // User is logged in
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // User is not logged in
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
