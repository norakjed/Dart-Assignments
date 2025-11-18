import 'dart:math';

import 'package:flutter/material.dart';

const String diceImage1 = 'assets/images/dice/dice-1.png';
const String diceImage2 = 'assets/images/dice/dice-2.png';
const String diceImage3 = 'assets/images/dice/dice-3.png';
const String diceImage4 = 'assets/images/dice/dice-4.png';
const String diceImage5 = 'assets/images/dice/dice-5.png';
const String diceImage6 = 'assets/images/dice/dice-6.png';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = diceImage2;

  void rollDice() {
    // tells Flutter to rebuild!
    setState(() {
      var randomDice = Random().nextInt(6) + 1;
      randomDice == 1
          ? activeDiceImage = diceImage1
          : randomDice == 2
          ? activeDiceImage = diceImage2
          : randomDice == 3
          ? activeDiceImage = diceImage3
          : randomDice == 4
          ? activeDiceImage = diceImage4
          : randomDice == 5
          ? activeDiceImage = diceImage5
          : activeDiceImage = diceImage6;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: rollDice,
          child: Image.asset(activeDiceImage, width: 200),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ),
  );
}
