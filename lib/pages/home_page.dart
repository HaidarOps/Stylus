import 'package:flutter/material.dart';
import 'package:stylus/auth/auth_service.dart';
import 'package:stylus/pages/account_page.dart';
import 'package:stylus/pages/login_page.dart';
import 'package:stylus/pages/stylists_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  final List <Widget> _pages = [
    StylistsPage(),
    const Center(child: Text("Feed Page")),
    AccountPage(),
    const Center(child: Text("Messages Page")),
    const Center(child: Text("Cloest Page")),



];


    // get authiccation servie
    final authService = AuthService();
    //current email


    void logout () async {

      //logout
      await authService.signOut();
      if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (route) => false); // Assuming you have a named route for login
    // OR use: Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Stylus"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          //logout button
          IconButton(onPressed: logout, icon: const Icon(Icons.logout)),

        ],
      ),
      body: Container(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Stylists'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.style), label: 'Closet'),


        ],
      ),
    );
  }
}