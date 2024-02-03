import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/fans.dart';

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
          const Text('Your Fans: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(26), // padding around the grid
              itemCount: fanlist.length,
              itemBuilder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120, // height of the size box, the icon is in it
                          child: Image.asset(fanlist[index].imagePath),
                        ),
                        // SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(fanlist[index].fanName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
      
    );
  }
}
