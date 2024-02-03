// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/TVs.dart';

class TvPage extends StatelessWidget {
  final TVs tV1;
  
  const TvPage(this.tV1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text('TVs', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        child: Text(tV1.tvName),
      ),
    );
  }
}