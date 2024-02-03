// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/AirConditioners.dart';
import 'package:flutter_apptest/models/TVs.dart';
import 'package:flutter_apptest/models/fans.dart';
import 'package:flutter_apptest/models/lights.dart';
import 'package:flutter_apptest/pages/appliances/AirConditioners_page.dart';
import 'package:flutter_apptest/pages/appliances/Fans_page.dart';
import 'package:flutter_apptest/pages/appliances/Lights_page.dart';
import 'package:flutter_apptest/pages/appliances/TVs_page.dart';

class AddAppliancesPage extends StatelessWidget {
   AddAppliancesPage();
   List<Fans> fanlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD APPLIANCES', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                tileColor: Theme.of(context).primaryColor,
                leading: const Image(image: AssetImage("assets/images/fan.png"), height: 70, width: 70,),
                title: const Text("Fans", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                subtitle: const Text("Connect a new Fan to Khaliq Home", style: TextStyle(fontSize: 20),),
                trailing: IconButton(icon: const Icon(Icons.add, size: 30,), 
                  onPressed: (){
                    Fans fan1 = Fans("Fans", "assets/images/fan.png",);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FansPage(fan1, fanlist)));
                    },),
              ),
            ),
          ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                tileColor: Theme.of(context).primaryColor,
                leading: const Image(image: AssetImage("assets/images/light-bulb.png"), height: 70, width: 70,),
                title: const Text("Lights", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                subtitle: const Text("Connect a new Light to Khaliq Home", style: TextStyle(fontSize: 20),),
                trailing: IconButton(icon: const Icon(Icons.add, size: 30,), 
                  onPressed: (){
                    Lights lights1 = Lights("Lights", "assets/images/light-bulb.png");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LightPage(lights1)));
                    },),
              ),
            ),
          ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                tileColor: Theme.of(context).primaryColor,
                leading: const Image(image: AssetImage("assets/images/smart-tv.png"), height: 70, width: 70,),
                title: const Text("TVs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                subtitle: const Text("Connect a new TV to Khaliq Home", style: TextStyle(fontSize: 20),),
                trailing: IconButton(icon: const Icon(Icons.add, size: 30,), 
                  onPressed: (){
                    TVs tV1 = TVs("TVs", "assets/images/smart-tv.png");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TvPage(tV1)));
                    },),
              ),
            ),
          ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                tileColor: Theme.of(context).primaryColor,
                leading: const Image(image: AssetImage("assets/images/air-conditioner.png"), height: 70, width: 70,),
                title: const Text("Air Condtioners", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                subtitle: const Text("Connect a new Air-Conditioner to Khaliq Home", style: TextStyle(fontSize: 20),),
                trailing: IconButton(icon: const Icon(Icons.add, size: 30,), 
                  onPressed: (){
                    AirConditioners ac1 = AirConditioners("Air Conditioners", "assets/images/air-conditioner.png");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AirConPage(ac1)));
                    },),
              ),
            ),
          ),
        ],
      )
    );
  }
}