import 'package:flutter/material.dart';

void main() {
  runApp(AssetReturnApp());
}

class AssetReturnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset Return Calculator',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blueAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      home: AssetReturnHomePage(),
    );
  }
}

class AssetReturnHomePage extends StatefulWidget {
  @override
  _AssetReturnHomePageState createState() => _AssetReturnHomePageState();
}

class _AssetReturnHomePageState extends State<AssetReturnHomePage> {
  String selectedAsset = 'Nifty 50';
  String selectedPeriod = 'Yearly';
  double inputAmount = 100000;
  double returnPercentage = 12.0; // Placeholder for demo

  List<String> assets = ['Nifty 50', 'Sensex', 'Gold', 'Real Estate', 'Bitcoin', 'Fixed Deposit'];
  List<String> periods = ['Weekly', 'Monthly', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    double finalValue = inputAmount * (1 + returnPercentage / 100);

    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Return Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedAsset,
              items: assets.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) => setState(() => selectedAsset = value!),
              decoration: InputDecoration(labelText: 'Select Asset Class'),
            ),
            SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedPeriod,
              items: periods.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) => setState(() => selectedPeriod = value!),
              decoration: InputDecoration(labelText: 'Select Period'),
            ),
            SizedBox(height: 12),
            TextFormField(
              initialValue: inputAmount.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Investment Amount'),
              onChanged: (value) => setState(() {
                inputAmount = double.tryParse(value) ?? 100000;
              }),
            ),
            SizedBox(height: 24),
            Text(
              'Return: ₹${finalValue.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // In real app: fetch API based return % here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Calculated using $returnPercentage% return')),
                );
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
