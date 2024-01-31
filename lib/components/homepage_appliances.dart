// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyAppliances extends StatefulWidget {
  final IconData icon;
  final String title;
  final String route;

   const MyAppliances(this.title, this.icon, this.route);

  @override
  State<MyAppliances> createState() => _MyAppliancesState();
}

class _MyAppliancesState extends State<MyAppliances> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120, // height of the size box, the icon is in it
                child: Icon(
                  widget.icon,
                  size:90, // Adjust the size of the icon as needed
                ),
              ),
              // SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
        ),
      ),

      onTap:(){
        Navigator.pushNamed(context, widget.route);
      },
    );
  }
}