// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyDevices extends StatelessWidget {
  final String title;
  final String description;
  final String imagepath;
  MyDevices(this.title, this.description, this.imagepath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: ListTile(
          tileColor: Theme.of(context).primaryColor,
          leading: Image(image: AssetImage(imagepath), height: 70, width: 70,),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          subtitle: Text(description, style: TextStyle(fontSize: 20),),
          trailing: IconButton(icon: Icon(Icons.add, size: 30,), onPressed: (){},),
        ),
      ),
    );
  }
}
