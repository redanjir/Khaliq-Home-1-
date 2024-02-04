// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_apptest/pages/login&register/login_page.dart';
import 'package:flutter_apptest/pages/login&register/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // First show login Page
  bool showloginpage = true;

  // Toggle between login and register page
  togglepages(){
    setState(() {
      showloginpage = !showloginpage;
    });
  }
  @override
  Widget build(BuildContext context) {
    //If showloginpage is true, go to LoginPage, else go to registerPage
    // The togglepages changes the showloginpage to true or false
    if(showloginpage){
      return LoginPage(togglepages);
    }else{
      return RegisterPage(togglepages);
    }
  }
}