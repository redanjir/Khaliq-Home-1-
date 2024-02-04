import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/fans.dart';
import 'package:flutter_apptest/pages/appliances_settings/fan_settings_page.dart';

class ManageFansPage extends StatelessWidget {
  final List<Fans> fanlist;

  ManageFansPage(this.fanlist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MANAGE FANS', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          const Text('Your Fans: ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(26), // padding around the grid
              itemCount: fanlist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onFanTap(context, fanlist[index]); // Call function to handle tap
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
                            child: Image.asset(fanlist[index].imagePath),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(fanlist[index].fanName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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
  void _onFanTap(BuildContext context, Fans fan) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FanSettingsPage(fan), // Pass the current fan
      ),
    );
  }
}

