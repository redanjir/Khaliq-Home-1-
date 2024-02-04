import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/TVs.dart';
import 'package:flutter_apptest/pages/appliances_settings/tv_settings_page.dart';

class ManageTVsPage extends StatelessWidget {
  final List<TVs> tvlist;

  ManageTVsPage(this.tvlist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MANAGE TVs', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          const Text('Your TVs: ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(26), // padding around the grid
              itemCount: tvlist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onTvTap(context, tvlist[index]); // Call function to handle tap
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
                            child: Image.asset(tvlist[index].imagePath),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(tvlist[index].tvName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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
  void _onTvTap(BuildContext context, TVs tv) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TvSettingsPage(tv), // Pass the current TV
      ),
    );
  }
}
