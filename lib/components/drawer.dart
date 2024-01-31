import 'package:auth/auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //drawer header
          DrawerHeader(
            child: Icon(Icons.person, size: 80,
            color: Theme.of(context).colorScheme.primary,
            ),
          ),

          //Home tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.home,
              color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('H O M E'),
              onTap: (){
                // pop the drawer open :P
                Navigator.pop(context);
              }
            ),
          ),

          //Profile tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.person,
              color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('P R O F I L E'),
              onTap: (){
                //pop the drawer open :P
                Navigator.pop(context);

               //navigate to the respective page
                Navigator.pushNamed(context, '/profile_page');
              }
            ),
          ),

          //Appliances tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.settings,
              color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('A P P L I A N C E S'),
              onTap: (){
                //pop the drawer open :P
                Navigator.pop(context);

                
               //navigate to the respective page
                Navigator.pushNamed(context, '/manage_appliances_page');
              }
            ),
          ),

          //about tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.question_mark,
              color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('A B O U T'),
              onTap: (){
                //pop the drawer open :P
                Navigator.pop(context);

                //navigate to the respective page
                Navigator.pushNamed(context, '/about_page');
              }
            ),
          ),

          //Users tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.group,
              color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('U S E R S'),
              onTap: (){
                // Pop open the drawer :P
                Navigator.pop(context);

                //navigate to the respective page
                Navigator.pushNamed(context, '/users_page');
              }
            ),
          ),

          const Spacer(flex: 10,),
          //Logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout,
              color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('L O G O U T'),
              onTap: (){
                // Pop out the drawer :P
                Navigator.pop(context);

                //logout
                logout();
              }
            ),
          ),

          const Spacer()
        ],
      ),
    );
  }
}