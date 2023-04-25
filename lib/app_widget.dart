import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'settings_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: LoginPage(),
    );
  }
}
