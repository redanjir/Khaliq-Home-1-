import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/helper/helper_functions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('USERS', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot){
          // any errors
          if(snapshot.hasError){
            displayMessagetoUser("Something went wrong", context);
          }

          //show loading circle
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.data == null){
            return const Text('No Data');
          }

          //get all users
          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length, // Set the number of items in the list
            itemBuilder: (context, index) {
              // Check if the index is within the bounds of the list
              if (index < users.length) {
                // Get individual user
                final user = users[index];
                
                return ListTile(
                  title: Text(user['username']),
                  subtitle: Text(user['email']),
                );
              } else {
                // Return an empty container if the index is out of bounds
                return Container();
              }
            },
          );


        },
        
      ),
    );
  }
}