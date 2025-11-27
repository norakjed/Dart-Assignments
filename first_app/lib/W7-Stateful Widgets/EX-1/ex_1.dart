import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClickableButton(label: "Button 1"),
            SizedBox(height: 20),
            ClickableButton(label: "Button 2"),
            SizedBox(height: 20),
            ClickableButton(label: "Button 3"),
          ],
        ),
      ),
    ),
  ),
);

class ClickableButton extends StatefulWidget {
  final String label;
  const ClickableButton({super.key, required this.label});

  @override
  State<ClickableButton> createState() => _ClickableButtonState();
}

class _ClickableButtonState extends State<ClickableButton> {
  bool isClicked = false;

  void onClicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        backgroundColor: isClicked ? Colors.lightBlue : Colors.blueGrey,
      ),
      child: Text(
        isClicked ? "Selected" : "Not Selected",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
