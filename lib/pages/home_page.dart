import 'package:flutter/material.dart';
import 'package:stylus/pages/stylists_page.dart';

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
    const Center(child: Text("Account Page")),
    const Center(child: Text("Messages Page")),
    const Center(child: Text("Cloest Page")),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Stylus"),
        backgroundColor: Colors.transparent,
        elevation: 0,
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