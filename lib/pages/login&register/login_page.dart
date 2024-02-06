// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/button.dart';
import 'package:flutter_apptest/components/texfield.dart';
import 'package:flutter_apptest/helper/helper_functions.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage(this.onTap);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Validate form fields
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      // Pop loading circle
      Navigator.pop(context);

      // Show error message to user
      displayMessagetoUser("Email and password are required!", context);
      return; // Exit function early if any field is empty
    }

    try {
      // Try signing in
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseException catch (e) {
      // Pop loading circle
      Navigator.pop(context);
      displayMessagetoUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                SizedBox(height: 20,),

                Text('KHALIQ HOME', style: TextStyle(fontSize: 20),),

                SizedBox(height: 20,),

                //Email textfield
                MyTextField(
                  hintext: "Email",
                  obscuretext: false,
                  controller: _emailController,
                ),

                SizedBox(height: 10,),

                //Password textfield
                MyTextField(
                  hintext: "Password",
                  obscuretext: true,
                  controller: _passwordController,
                ),

                SizedBox(height: 10,),

                //Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password', style: TextStyle(color: Theme.of(context).colorScheme.secondary),)
                  ],
                ),

                SizedBox(height: 30,),

                //Login button
                MyButton(
                  text: 'Login',
                  onTap: login,
                ),

                SizedBox(height: 30,),

                //Register here
                GestureDetector(
                  onTap: widget.onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      Text(" Register Here", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
