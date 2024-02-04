import 'package:flutter/material.dart';
import 'package:flutter_apptest/models/TVs.dart';

class TvSettingsPage extends StatefulWidget {
  final TVs tv;

  TvSettingsPage(this.tv);

  @override
  _TvSettingsPageState createState() => _TvSettingsPageState();
}

class _TvSettingsPageState extends State<TvSettingsPage> {
  final TextEditingController _soundController = TextEditingController();
  final TextEditingController _brightnessController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current TV settings
    _soundController.text = widget.tv.sound?.toString() ?? '';
    _brightnessController.text = widget.tv.brightness?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TV Settings: ${widget.tv.tvName}',
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
              label: 'Current Sound:',
              value: widget.tv.sound?.toString() ?? 'N/A',
            ),
            _buildTextField(
              controller: _soundController,
              labelText: 'New Sound',
            ),
            const SizedBox(height: 20),
            _buildSettingRow(
              label: 'Current Brightness:',
              value: widget.tv.brightness?.toString() ?? 'N/A',
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
    // Update the TV sound and brightness
    double? newSound = double.tryParse(_soundController.text);
    double? newBrightness = double.tryParse(_brightnessController.text);

    setState(() {
      widget.tv.sound = newSound;
      widget.tv.brightness = newBrightness;
    });

    // Display a snackbar to indicate that settings have been updated
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('TV settings updated'),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose text controllers to free up resources
    _soundController.dispose();
    _brightnessController.dispose();
    super.dispose();
  }
}
