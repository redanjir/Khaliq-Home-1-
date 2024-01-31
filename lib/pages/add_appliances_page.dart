// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/add_appliances.dart';

class AddAppliancesPage extends StatelessWidget {
   AddAppliancesPage({super.key});

  List mydevices = [
    // [title, description, ImagePath]
    ["Fans", "Connect a new Fan to Khaliq Home", "assets/images/fan.png"],
    ["Lights", "Connect a new Light to Khaliq Home", "assets/images/light-bulb.png"],
    ["TV", "Connect a new TV to Khaliq Home", "assets/images/smart-tv.png"],
    ["Air-Conditioners", "Connect a new Air-Conditioner to Khaliq Home", "assets/images/air-conditioner.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD APPLIANCES', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      body: ListView.builder(
        itemCount: mydevices.length,
        itemBuilder: (context, index){
          return MyDevices(
            mydevices[index][0],
            mydevices[index][1],
            mydevices[index][2],
          );
        }
      ),
    );
  }
}