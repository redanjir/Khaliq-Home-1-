import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/lights.dart';

class LightSettingsPage extends StatefulWidget {
  final Lights light;

  LightSettingsPage(this.light);

  @override
  _LightSettingsPageState createState() => _LightSettingsPageState();
}

class _LightSettingsPageState extends State<LightSettingsPage> {
  final TextEditingController _brightnessController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controller with current light brightness
    _brightnessController.text = widget.light.brightness?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Light Settings: ${widget.light.lightName}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display current brightness
            Row(
              children: [
                Text('Current Brightness:'),
                SizedBox(width: 10),
                Text(widget.light.brightness?.toString() ?? 'N/A'),
              ],
            ),
            // Text field for entering new brightness
            TextField(
              controller: _brightnessController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'New Brightness',
              ),
            ),
            const SizedBox(height: 20),
            // Button to save settings
            ElevatedButton(
              onPressed: () {
                _updateSettings(); // Call function to update light settings
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to update light settings
  void _updateSettings() {
    // Parse new brightness from text field
    double? newBrightness = double.tryParse(_brightnessController.text);

    // Update light brightness
    setState(() {
      widget.light.brightness = newBrightness;
    });

    // Show snackbar to indicate that settings have been updated
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Light settings updated'),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose text controller to free up resources
    _brightnessController.dispose();
    super.dispose();
  }
}
