import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylus/auth/auth_gate.dart';
import 'package:stylus/components/stylist_item.dart';
import 'package:stylus/models/stylist_list.dart';
import 'package:stylus/pages/home_page.dart';
import 'package:stylus/pages/intro_page.dart';
import 'package:stylus/pages/login_page.dart';
import 'package:stylus/pages/stylists_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  await Supabase.initialize(url: 'https://ivfccgvhuavdmtjgmile.supabase.co', 
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml2ZmNjZ3ZodWF2ZG10amdtaWxlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQxMDk2NTgsImV4cCI6MjA1OTY4NTY1OH0.xYoQ45EEzqQViVQUyrx9jFz4P7847_W37yaVgk0aIIM',  
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => StylistList(),
    builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    ),
    );
  }
}