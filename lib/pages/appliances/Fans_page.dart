// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/fans.dart';
import 'package:flutter_apptest/pages/manage_appliances/manageFans.dart';

class FansPage extends StatefulWidget {
  final Fans fan1;
  final List<Fans> fanlist;
  const FansPage(this.fan1, this.fanlist);

  @override
  State<FansPage> createState() => _FansPageState();
}

class _FansPageState extends State<FansPage> {
  final TextEditingController _fanNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD FANS', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  widget.fan1.imagePath,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 20,),
        
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  filled: true, hintText: 'Add a new Fan Name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(width: 3, color: Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(width: 3, color: Colors.grey)
                  )
                ),
                controller: _fanNameController,
              ),
            ),
            const SizedBox(height: 20,),
        
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  String fanName = _fanNameController.text.trim();
                  
                  // Check if the fan name is empty or if it's a duplicate
                  bool isNameEmpty = fanName.isEmpty;
                  bool isDuplicateName = widget.fanlist.any((fan) => fan.fanName == fanName);

                  if (!isNameEmpty && !isDuplicateName) {
                    Fans newFan = Fans(fanName, widget.fan1.imagePath);
                    setState(() {
                      widget.fanlist.add(newFan);
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ManageFansPage(widget.fanlist)));
                  } else {
                    // Show a snackbar indicating the error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isNameEmpty ? 'Fan name cannot be empty.' : 'Fan name already exists.'),
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