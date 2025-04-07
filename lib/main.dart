import 'package:flutter/material.dart';
import 'package:it_habar/config/theme/theme_data.dart';
import 'package:it_habar/main_screen.dart';

void main() {
  runApp(
    ITHabarApp(),
  );
}

class ITHabarApp extends StatelessWidget {
  const ITHabarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        home: MainScreen());
  }
}
