import 'package:flutter/material.dart';
import 'ProfileScreen.dart';
import 'SwipeScreen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => SwipeScreen(),
        '/expandProfile': (context) => ProfileScreen(),
      },
    ),
  );
}
