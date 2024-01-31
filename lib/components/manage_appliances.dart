import 'package:flutter/material.dart';

class ManageAppliances extends StatefulWidget {
  final String title;
  final String imagepath;
  ManageAppliances(this.title, this.imagepath);

  @override
  State<ManageAppliances> createState() => _ManageAppliancesState();
}

class _ManageAppliancesState extends State<ManageAppliances> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary
        ),
        width: 380,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 300, // Image size basically
              child: Image(image: AssetImage(widget.imagepath)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.title, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}