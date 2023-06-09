import 'package:buildflow/signup.page.dart';

import 'addbuild_page.dart';
import 'info.dart';
import 'manage_acc.dart';
import 'settings_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login_page.dart';
import 'sec-and-acs.dart';
import 'home_page.dart';
import 'construction_page.dart';
import 'reset-password.page.dart';
import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/signup': (context) => SignupPage(),
        '/passwordreset': (context) => ResetPasswordPage(),
        '/home': (context) => HomePage(),
        '/home/construction': (context) => Construction_page(),
        '/home/addobra': (context) => AddObraPage(),
        '/home/settings': (context) => Settings_page(),
        '/home/settings/account': (context) => ManageAcc(),
        '/home/settings/security': (context) => Sec_page(),
        '/home/settings/info': (context) => AppInfoPage(),
        '/home/settings/security/connected_apps': (context) =>
            ConnectedAppsPage(),
        '/home/settings/security/connected_accounts': (context) =>
            ConnectedAccountsPage(),
        '/home/settings/security/twofactors': (context) => TwoFactorAuthPage(),
      },
    );
  }
}
