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
        title: Text('Fan Settings: ${widget.fan.fanName} ' , style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Speed: ${widget.fan.fanSpeed ?? 'N/A'}'),
            TextField(
              controller: _speedController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'New Speed'),
            ),
            const SizedBox(height: 20),
            Text('Current Brightness: ${widget.fan.fanBrightness ?? 'N/A'}'),
            TextField(
              controller: _brightnessController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'New Brightness'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the fan speed and brightness
                double? newSpeed = double.tryParse(_speedController.text);
                double? newBrightness = double.tryParse(_brightnessController.text);

                setState(() {
                  widget.fan.fanSpeed = newSpeed;
                  widget.fan.fanBrightness = newBrightness;
                });

                // Display a snackbar to indicate that settings have been updated
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fan settings updated'),
                  ),
                );
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
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
