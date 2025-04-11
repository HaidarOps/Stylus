import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylus/components/stylist_item.dart';
import 'package:stylus/models/stylist_list.dart';
import 'package:stylus/pages/home_page.dart';
import 'package:stylus/pages/intro_page.dart';
import 'package:stylus/pages/stylists_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => StylistList(),
    builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
    );
  }
}