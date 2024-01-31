// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/manage_appliances.dart';

class ManageAppliancesPage extends StatelessWidget {
  ManageAppliancesPage();

  List items =[
    // [title, imagepath]
    ["Fans", "assets/images/fan.png"],
    ["Lights", "assets/images/light-bulb.png"],
    ["TVs", "assets/images/smart-tv.png"],
    ["Air-Conditioners", "assets/images/air-conditioner.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('APPLIANCES', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(
        
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index){
           return ManageAppliances(
              items[index][0],
              items[index][1],
            );
          }
        ),
      ),
    );
  }
}