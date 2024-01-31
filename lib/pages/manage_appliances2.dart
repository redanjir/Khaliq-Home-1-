// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ManageAppliancesNextPage extends StatefulWidget {
  final String imagepath;
  final String title;
  ManageAppliancesNextPage(this.title, this.imagepath);

  @override
  State<ManageAppliancesNextPage> createState() => _ManageAppliancesNextPageState();
}

class _ManageAppliancesNextPageState extends State<ManageAppliancesNextPage> {
  double _speedSliderValue = 2;
  double _powerSliderValue = 4;
  String _speedSliderTitle = 'Speed';
  String _powerSliderTitle = 'Power';

  @override
  Widget build(BuildContext context) {
    // Check the image path to determine slider titles
    if (widget.imagepath == "assets/images/fan.png") {
      _speedSliderTitle = 'Fan Speed';
      _powerSliderTitle = 'Fan Power';
    } else if (widget.imagepath == "assets/images/light-bulb.png") {
      _speedSliderTitle = 'Light Brightness';
      _powerSliderTitle = 'Light Power';
    } else if (widget.imagepath == "assets/images/smart-tv.png") {
      _speedSliderTitle = 'TV Volume';
      _powerSliderTitle = 'TV Power';
    } else if (widget.imagepath == "assets/images/air-conditioner.png") {
      _speedSliderTitle = 'AC Speed';
      _powerSliderTitle = 'AC Power';
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              //Picture box
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  height: 200,
                  child: Image(image: AssetImage(widget.imagepath)),
                ),
              ),
        
              SizedBox(height: 30,),
        
              // Slider and slider title
              Column(
                children: [
                  Padding(  
                    padding:  EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(_speedSliderTitle,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Slider(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: _speedSliderValue, 
                    max: 10,
                    divisions: 5,
                    label: _speedSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _speedSliderValue = value;
                      });
                    },
                  )
                ],
              ),
        
              SizedBox(height: 30,),

              // Slider and slider title
              Column(
                children: [
                  Padding(  
                    padding:  EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(_powerSliderTitle,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Slider(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: _powerSliderValue, 
                    max: 10,
                    divisions: 5,
                    label: _powerSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _powerSliderValue = value;
                      });
                    },
                  )
                ],
              ),

              SizedBox(height: 30,),

              TextButton(
                child: Text('Save', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                onPressed: () {
                  Navigator.pushNamed(context, '/manage_appliances_page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
