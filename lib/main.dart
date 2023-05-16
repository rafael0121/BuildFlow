import 'package:buildflow/manage_acc.dart';
import 'package:buildflow/settings_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sec-and-acs.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuildFlow',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/home/settings': (context) => Settings_page(),
        '/home/settings/account': (context) => ManageAcc(),
        '/home/settings/security': (context) => Sec_page(),
        '/home/settings/security/connected_apps': (context) =>
            ConnectedAppsPage(),
        '/home/settings/security/connected_accounts': (context) =>
            ConnectedAccountsPage(),
        '/home/settings/security/twofactors': (context) => TwoFactorAuthPage(),
      },
    );
  }
}
