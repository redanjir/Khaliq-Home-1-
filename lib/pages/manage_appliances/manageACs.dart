import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/AirConditioners.dart';
import 'package:flutter_apptest/pages/appliances_settings/ac_settings_page.dart';

class ManageAirConPage extends StatelessWidget {
  final List<AirConditioners> aclist;

  ManageAirConPage(this.aclist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MANAGE AIR CONDITIONERS', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          const Text('Your Air Conditioners: ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(26), // padding around the grid
              itemCount: aclist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onAirConTap(context, aclist[index]); // Call function to handle tap
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 120, // height of the size box, the icon is in it
                            child: Image.asset(aclist[index].imagePath ,color: Theme.of(context).colorScheme.secondary),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(aclist[index].acName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to handle tap event
  void _onAirConTap(BuildContext context, AirConditioners ac) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AirConSettingsPage(ac), // Pass the current air conditioner
      ),
    );
  }
}
