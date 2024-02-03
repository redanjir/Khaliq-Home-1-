// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/AirConditioners.dart';

class AirConPage extends StatelessWidget {
  final AirConditioners ac1;
  
  const AirConPage(this.ac1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD APPLIANCES', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        child: Text(ac1.acName),
      ),
    );
  }
}