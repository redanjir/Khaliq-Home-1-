import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/fans.dart';

class FanSettingsPage extends StatefulWidget {
  final Fans fan;

  FanSettingsPage(this.fan);

  @override
  _FanSettingsPageState createState() => _FanSettingsPageState();
}

class _FanSettingsPageState extends State<FanSettingsPage> {
  final TextEditingController _speedController = TextEditingController();
  final TextEditingController _brightnessController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current fan speed and brightness
    _speedController.text = widget.fan.fanSpeed?.toString() ?? '';
    _brightnessController.text = widget.fan.fanBrightness?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fan Settings: ${widget.fan.fanName}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display current speed
            Text(
              'Current Speed: ${widget.fan.fanSpeed?.toString() ?? 'N/A'}',
            ),
            // Text field for entering new speed
            TextField(
              controller: _speedController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'New Speed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Display current brightness
            Text(
              'Current Brightness: ${widget.fan.fanBrightness?.toString() ?? 'N/A'}',
            ),
            // Text field for entering new brightness
            TextField(
              controller: _brightnessController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'New Brightness',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Button to save settings
            ElevatedButton(
              onPressed: () {
                _updateSettings(); // Call function to update fan settings
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Save Settings',
                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to update fan settings
  void _updateSettings() {
    // Take new speed and brightness from text fields
    double? newSpeed = double.tryParse(_speedController.text);
    double? newBrightness = double.tryParse(_brightnessController.text);

    // Update fan speed and brightness
    setState(() {
      widget.fan.fanSpeed = newSpeed;
      widget.fan.fanBrightness = newBrightness;
    });

    // Show snackbar to indicate that settings have been updated
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fan settings updated'),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose text controllers to free up resources
    _speedController.dispose();
    _brightnessController.dispose();
    super.dispose();
  }
}
