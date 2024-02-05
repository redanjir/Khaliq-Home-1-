import 'package:flutter/material.dart';

class EnergyGoalsPage extends StatefulWidget {
  const EnergyGoalsPage({super.key});

  @override
  State<EnergyGoalsPage> createState() => _EnergyGoalsPageState();
}

class _EnergyGoalsPageState extends State<EnergyGoalsPage> {
  double _currentSliderValue = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text('GOALS', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
        
          const SizedBox(height: 30,),
          // column with row
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:  EdgeInsets.all(3.0),
                child: Text('2023', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Container(
                width: 350, height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade600,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 80, width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('1000kWh in total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                          Text('currently: 800kWh', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 50,),

          //column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text('Set an Energy Goal for 2024' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Slider(
                activeColor: Theme.of(context).colorScheme.secondary  ,
                inactiveColor: Colors.grey.shade500,
                value: _currentSliderValue,
                max: 1000,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 10,),

           GestureDetector(
             child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(80, 8, 80, 8),
                    child: Text('Save', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),),
                  ),
                ),
              ),
            ),
            onTap:(){
              Navigator.pop(context);
            },
           ),

          const Padding(
            padding: EdgeInsets.all(50.0),
            child: Text('Tip: Turn off your Air-conditioners when not in use or on cold or rainy days. This helps to save energy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}