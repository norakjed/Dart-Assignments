import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'hello my name is Norakjed',
            style: TextStyle(color: Colors.orange, fontSize: 50.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
