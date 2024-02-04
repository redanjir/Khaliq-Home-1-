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
            _buildSettingRow(
              label: 'Current Temperature:',
              value: widget.airCon.temperature?.toString() ?? 'N/A',
            ),
            _buildTextField(
              controller: _temperatureController,
              labelText: 'New Temperature',
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
    // Update the air conditioner temperature
    double? newTemperature = double.tryParse(_temperatureController.text);

    setState(() {
      widget.airCon.temperature = newTemperature;
    });

    // Display a snackbar to indicate that settings have been updated
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
