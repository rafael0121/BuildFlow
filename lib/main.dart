import 'package:buildflow/%20%CC%A3only_report_page.dart';
import 'package:buildflow/addreport_page.dart';
import 'package:buildflow/report_page.dart';
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
import 'build_page.dart';
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
        '/home': (context) => HomePage(),
        '/home/add_build': (context) => Add_build(),
        '/home/build': (context) => Build_page(),
        '/home/build/report': (context) => Report_page(),
        '/home/build/report/only_report': (context) => Only_report_page(),
        '/home/build/report/add_report': (context) => Addreport_page(),
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
