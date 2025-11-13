import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Buttons')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.send,
              position: IconPosition.left,
              type: ButtonType.primary,
            ),
            CustomButton(
              label: 'time',
              icon: Icons.timer,
              position: IconPosition.right,
              type: ButtonType.secondary,
            ),
            CustomButton(
              label: 'Disabled',
              icon: Icons.widgets,
              position: IconPosition.right,
              type: ButtonType.disabled,
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition position;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.position = IconPosition.left,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: type == ButtonType.primary
            ? Colors.blue
            : type == ButtonType.secondary
            ? Colors.green
            : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: position == IconPosition.left
              ? [
                  Icon(icon, color: Colors.white),
                  SizedBox(width: 10),
                  Text(label, style: TextStyle(color: Colors.white)),
                ]
              : [
                  Text(label, style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10),
                  Icon(icon, color: Colors.white),
                ],
        ),
      ),
    );
  }
}
