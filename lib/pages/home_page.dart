
// ignore_for_file: prefer_const_constructors

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/homepage_appliances.dart';
import 'package:flutter_apptest/components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;
  String ?username;
  String ?email;

  @override
  void initState() {
    super.initState();
    //fetch user details wehn the widget is initialized
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
          email=userData['email'];
          username = userData['username'];
        });
      }
    }
  }

  // List of smart appliances
List myAppliances = [
  // [title, icon, route]
  ["Add Appliances", Icons.add, '/add_appliances_page'],
  ["Manage Appliances", Icons.settings, '/manage_appliances_page'],
  ["Energy Consumption", Icons.flash_on, '/energy_page'],
  ["Set energy goal", Icons.timeline, '/profile_page'],
];


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          // Greeting
          Padding(
            padding: const EdgeInsets.only(right: 78, top: 30, left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Home', style: TextStyle(fontSize: 30, color: Colors.grey[700])),
                //if username is null, display an empty string
                Text(username ?? '', style: const TextStyle(fontSize: 50, color: Colors.black),)
              ],
            ),
          ),

          // Just a divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(color: Colors.grey[400], thickness: 1, ),
          ),

            Expanded(
              child: GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(26), // padding around the grid
                itemCount: myAppliances.length,
                itemBuilder: (context, index){
                  // fuck I confused myself with all the appliances and devices names... well it works anyway
                  return MyAppliances(
                    myAppliances[index][0],
                    myAppliances[index][1],
                    myAppliances[index][2],
                  );
                }
              ),
            ),
      
        ],
      ),
    );
  }
}