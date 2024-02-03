// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/lights.dart';

class LightPage extends StatelessWidget {
  final Lights lights1;
  
  const LightPage(this.lights1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text('LIGHTS', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        child: Text(lights1.lightName),
      ),
    );
  }
}