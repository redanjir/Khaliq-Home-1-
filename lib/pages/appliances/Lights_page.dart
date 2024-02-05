import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/texfield.dart';
import 'package:flutter_apptest/models/lights.dart';
import 'package:flutter_apptest/pages/manage_appliances/manageLights.dart';

class LightPage extends StatefulWidget {
  final Lights light1;
  final List<Lights> lightlist;
  const LightPage(this.light1, this.lightlist);

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  final TextEditingController _lightNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD LIGHTS', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  widget.light1.imagePath,
                  color: Theme.of(context).colorScheme.secondary,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 20,),
        
            MyTextField(
              hintext: 'Light Name', 
              obscuretext: false, 
              controller: _lightNameController
              ),
            const SizedBox(height: 20,),
        
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  String lightName = _lightNameController.text.trim();
                  
                  // Check if the light name is empty or if it's a duplicate
                  bool isNameEmpty = lightName.isEmpty;
                  bool isDuplicateName = widget.lightlist.any((light) => light.lightName == lightName);

                  if (!isNameEmpty && !isDuplicateName) {
                    Lights newLight = Lights(lightName, widget.light1.imagePath);
                    setState(() {
                      widget.lightlist.add(newLight);
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ManageLightsPage(widget.lightlist)));
                  } else {
                    // Show a snackbar indicating the error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isNameEmpty ? 'Light name cannot be empty.' : 'Light name already exists.'),
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
