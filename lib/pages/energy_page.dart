import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EnergyPage extends StatelessWidget {
  const EnergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ENERGY', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                value: 300,
                title: 'Fans: 300kwh',
                showTitle: true,
                radius: 100,
                color: Colors.red
              ),
               PieChartSectionData(
                value: 100,
                title: 'Lights',
                showTitle: true,
                radius: 100,
                color: Colors.orange
              ),
               PieChartSectionData(
                value: 100,
                title: 'TVs',
                showTitle: true,
                radius: 100,
                color: Colors.yellow
              ),
               PieChartSectionData(
                value: 400,
                title: 'Air-Conditioners: 400kwh',
                showTitle: true,
                radius: 100,
                color: Colors.blue
              ),
              
            ]
          )
        ),
      ),
    );
  }
}