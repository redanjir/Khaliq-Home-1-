// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/texfield.dart';
import 'package:flutter_apptest/models/TVs.dart';
import 'package:flutter_apptest/pages/manage_appliances/manageTVs.dart';

class TvPage extends StatefulWidget {
  final TVs tv1;
  final List<TVs> tvlist;
  const TvPage(this.tv1, this.tvlist);

  @override
  State<TvPage> createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
  final TextEditingController _tvNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD TVs', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            const SizedBox(height: 30,),
            // The Image
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.primary
                ),
                child: Image.asset(
                  widget.tv1.imagePath,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 20,),
        
            MyTextField(
              hintext: 'TV Name', 
              obscuretext: false, 
              controller: _tvNameController
              ),
            const SizedBox(height: 20,),
        
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  String tvName = _tvNameController.text.trim();
                  
                  // Check if the TV name is empty or if it's a duplicate
                  bool isNameEmpty = tvName.isEmpty;
                  bool isDuplicateName = widget.tvlist.any((tv) => tv.tvName == tvName);

                  if (!isNameEmpty && !isDuplicateName) {
                    TVs newTV = TVs(tvName, widget.tv1.imagePath);
                    setState(() {
                      widget.tvlist.add(newTV);
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ManageTVsPage(widget.tvlist)));
                  } else {
                    // Show a snackbar indicating the error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isNameEmpty ? 'TV name cannot be empty.' : 'TV name already exists.'),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87, backgroundColor: Colors.grey.shade400, elevation: 5,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                ), 
                child: const Text('Save', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
