// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/auth/auth.dart';
import 'package:flutter_apptest/auth/login_or_register.dart';
import 'package:flutter_apptest/firebase_options.dart';
import 'package:flutter_apptest/pages/about_page.dart';
import 'package:flutter_apptest/pages/add_appliances_page.dart';
import 'package:flutter_apptest/pages/home_page.dart';
import 'package:flutter_apptest/pages/manage_appliances_page.dart';
import 'package:flutter_apptest/pages/profile_page.dart';
import 'package:flutter_apptest/pages/users_page.dart';
import 'package:flutter_apptest/theme/dark_mode.dart';
import 'package:flutter_apptest/theme/light_mode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase project',
      theme: lightmode,
      darkTheme: darkmode,
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/login_or_register':(context) => LoginOrRegister(),
        '/home_page':(context) =>const HomePage(),
        '/profile_page':(context) => MyProfile(),
        '/users_page':(context) =>const UsersPage(),
        '/about_page':(context) => const AboutPage(),
        '/add_appliances_page':(context) => AddAppliancesPage(),
        '/manage_appliances_page':(context) => ManageAppliancesPage(),
      },
    );
  }
}