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
            _buildSettingRow(
              label: 'Current Brightness:',
              value: widget.light.brightness?.toString() ?? 'N/A',
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
        labelText: labelText,
      ),
    );
  }

  void _updateSettings() {
    // Update the light brightness
    double? newBrightness = double.tryParse(_brightnessController.text);

    setState(() {
      widget.light.brightness = newBrightness;
    });

    // Display a snackbar to indicate that settings have been updated
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
