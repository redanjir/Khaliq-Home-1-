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
            _buildSettingRow(
              label: 'Current Speed:',
              value: widget.fan.fanSpeed?.toString() ?? 'N/A',
            ),
            _buildTextField(
              controller: _speedController,
              labelText: 'New Speed',
            ),
            const SizedBox(height: 20),
            _buildSettingRow(
              label: 'Current Brightness:',
              value: widget.fan.fanBrightness?.toString() ?? 'N/A',
            ),
            _buildTextField(
              controller: _brightnessController,
              labelText: 'New Brightness',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateSettings();
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingRow({required String label, required String value}) {
    return Row(
      children: [
        Text(label),
        SizedBox(width: 10),
        Text(value),
      ],
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller, required String labelText}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _updateSettings() {
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
  }

  @override
  void dispose() {
    // Dispose text controllers to free up resources
    _speedController.dispose();
    _brightnessController.dispose();
    super.dispose();
  }
}
