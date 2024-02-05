import 'package:flutter/material.dart';
import 'package:flutter_apptest/components/texfield.dart';
import 'package:flutter_apptest/models/AirConditioners.dart';
import 'package:flutter_apptest/pages/manage_appliances/manageACs.dart';

class AirConPage extends StatefulWidget {
  final AirConditioners ac1;
  final List<AirConditioners> aclist;

  const AirConPage(this.ac1, this.aclist);

  @override
  State<AirConPage> createState() => _AirConPageState();
}

class _AirConPageState extends State<AirConPage> {
  final TextEditingController _acNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD Air Conditioners', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  widget.ac1.imagePath,
                  color: Theme.of(context).colorScheme.secondary,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            MyTextField(
              hintext: 'Air Conditioner Name', 
              obscuretext: false, 
              controller: _acNameController
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  String acName = _acNameController.text.trim();
                  
                  // Check if the Air Conditioner name is empty or if it's a duplicate
                  bool isNameEmpty = acName.isEmpty;
                  bool isDuplicateName = widget.aclist.any((ac) => ac.acName == acName);

                  if (!isNameEmpty && !isDuplicateName) {
                    AirConditioners newAC = AirConditioners(acName, widget.ac1.imagePath);
                    setState(() {
                      widget.aclist.add(newAC);
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAirConPage(widget.aclist)));
                  } else {
                    // Show a snackbar indicating the error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isNameEmpty ? 'Air Conditioner name cannot be empty.' : 'Air Conditioner name already exists.'),
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
                  foregroundColor: Colors.black87, 
                  backgroundColor: Colors.grey.shade400, 
                  elevation: 5,
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
