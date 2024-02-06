import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/AirConditioners.dart';

class AirConSettingsPage extends StatefulWidget {
  final AirConditioners airCon;

  AirConSettingsPage(this.airCon);

  @override
  _AirConSettingsPageState createState() => _AirConSettingsPageState();
}

class _AirConSettingsPageState extends State<AirConSettingsPage> {
  final TextEditingController _temperatureController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controller with current air conditioner temperature
    _temperatureController.text = widget.airCon.temperature?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Air Conditioner Settings: ${widget.airCon.acName}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display current temperature
            Row(
              children: [
                Text('Current Temperature:'),
                SizedBox(width: 10),
                Text(widget.airCon.temperature?.toString() ?? 'N/A'),
              ],
            ),
            // Text field for entering new temperature
            TextField(
              controller: _temperatureController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'New Temperature',
              ),
            ),
            const SizedBox(height: 20),
            // Button to save settings
            ElevatedButton(
              onPressed: () {
                _updateSettings(); // Call function to update air conditioner settings
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to update air conditioner settings
  void _updateSettings() {
    // Parse new temperature from text field
    double? newTemperature = double.tryParse(_temperatureController.text);

    // Update air conditioner temperature
    setState(() {
      widget.airCon.temperature = newTemperature;
    });

    // Show snackbar to indicate that settings have been updated
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Air Conditioner settings updated'),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose text controller to free up resources
    _temperatureController.dispose();
    super.dispose();
  }
}
