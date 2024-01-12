import 'package:flutter/material.dart';

import 'screens/homePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dialogBackgroundColor: Colors.white30,
      ),
      home: HomePage()
    );
  }
}
