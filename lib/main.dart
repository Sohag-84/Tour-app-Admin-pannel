import 'package:flutter/material.dart';
import 'package:travel_agency_admin_app/views/home_screen.dart';

import 'Theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}