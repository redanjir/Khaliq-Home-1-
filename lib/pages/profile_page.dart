// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, use_build_context_synchronously

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/texfield.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  // Current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // Text editing controllers for the email and username fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch user details when the widget is initialized
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic>? userData = snapshot.data();
      if (userData != null) {
        setState(() {
          _emailController.text = userData['email'];
          _usernameController.text = userData['username'];
        });
      }
    }
  }


  Future<void> updateUserCredentials() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .update({
      'email': _emailController.text,
      'username': _usernameController.text,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User credentials updated')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PROFILE', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile pic
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(25),
                child: const Icon(Icons.person, size: 64),
              ),
              const SizedBox(height: 25),
          
              //Email textfield
              MyTextField(
                  hintext: "Email",
                  obscuretext: false,
                  controller: _emailController,
                ),
              const SizedBox(height: 15),
          
              //Email textfield
                MyTextField(
                  hintext: "Username",
                  obscuretext: false,
                  controller: _usernameController,
                ),
              const SizedBox(height: 25),
          
              // Update button
              ElevatedButton(
                onPressed: updateUserCredentials,
                child: const Text('Update', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
