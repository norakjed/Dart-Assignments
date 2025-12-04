import 'package:flutter/material.dart';

class Bottommodal extends StatelessWidget {
  const Bottommodal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Close Modal'),
        onPressed: () => Navigator.pop(context),
      ),
      
    );
  }
}