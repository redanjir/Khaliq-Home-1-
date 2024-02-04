// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_build_context_synchronously


import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/button.dart';
import 'package:flutter_apptest/components/texfield.dart';
import 'package:flutter_apptest/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final Function() onTap;

  RegisterPage(this.onTap);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

 void register() async {
  // Show loading circle
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
  
  // Make sure passwords match
  if (_confirmpasswordController.text != _passwordController.text) {
    // Pop loading circle
    Navigator.pop(context);

    // Show error message to user
    displayMessagetoUser("Passwords don't match!", context);
    return; // Exit function early if passwords don't match
  }
  else{
    // Try creating the user
    try {
      // Create the user using FirebaseAuth
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      //create a user document and add to firestore
      await createUserDocument(userCredential, _usernameController.text);

      // Pop the loading circle
      Navigator.pop(context);

      // Show registration success message to user
      displayMessagetoUser("User registered successfully!", context);
    } catch (e) {
      // Pop the loading circle
      Navigator.pop(context);

      // Show error message to user
      displayMessagetoUser("Registration failed: ${e.toString()}", context);
    }
  }
}

//Create a user document and collect them in firestore
Future createUserDocument(UserCredential userCredential, String username) async{
  if(userCredential.user != null ){
    await FirebaseFirestore.instance
    .collection("Users")
    .doc(userCredential.user!.email)
    .set({
      'email' : userCredential.user!.email,
      'username': _usernameController.text,
    });
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
                
                Text('KHALIQ HOME',style: TextStyle(fontSize: 20),),

                SizedBox(height: 20,),

                //Username textfield
                MyTextField(
                  hintext: "Username",
                  obscuretext: false,
                  controller: _usernameController,
                ),

                SizedBox(height: 10,),

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

                //Confirm Password textfield
                MyTextField(
                  hintext: "Confirm Password",
                  obscuretext: true,
                  controller: _confirmpasswordController,
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

                //Register button
                MyButton(
                  text: 'Register',
                  onTap: register,
                ),

                SizedBox(height: 30,),

                //Login here
                GestureDetector(
                  onTap: widget.onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      Text(" Login Here", style: TextStyle(fontWeight: FontWeight.bold),),
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