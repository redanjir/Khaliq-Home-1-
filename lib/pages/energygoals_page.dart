import 'package:flutter/material.dart';

class EnergyGoalsPage extends StatefulWidget {
  const EnergyGoalsPage({super.key});

  @override
  State<EnergyGoalsPage> createState() => _EnergyGoalsPageState();
}

class _EnergyGoalsPageState extends State<EnergyGoalsPage> {

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
          //container
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(80, 8, 80, 8),
                  child: Text('Energy Goals', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ),

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
                  color: Colors.orange,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 80, width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('1000kWh in total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text('currently: 800kWh', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20,),

          //Row with dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Set an Energy Goal' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
             
            ],
          ),

        ],
      ),
    );
  }
}