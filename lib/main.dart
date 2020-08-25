import 'package:flutter/material.dart';
import 'TinderCard.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My App',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('Swipe left or right.'),
              ),
            ),
            Stack(
              children: [
                Container(
                  child: TinderCard(Colors.green),
                ),
                Container(
                  child: TinderCard(Colors.blue),
                ),
                Container(
                  child: TinderCard(Colors.red),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text('Options'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
