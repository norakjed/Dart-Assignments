import 'package:first_app/W9-Quiz%20app/Mini%20Quiz/Data/players_data.dart';
import 'package:flutter/material.dart';
import 'Data/questions_data.dart';
import 'UI/Screens/question_screen.dart';
import 'UI/Screens/result_screen.dart';
import 'UI/Screens/welcome_screen.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: true, home: QuizApp()));
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Widget currScreen;

  @override
  void initState() {
    super.initState();
    currScreen = WelcomeScreen(nextButton: goQuestion);
  }

  void goQuestion() {
    setState(() {
      currScreen = QuestionScreen(
        player: jad,
        questionList: questionList,
        nextButton: goResult,
      );
    });
  }

  void goWelcome() {
    setState(() {
      currScreen = WelcomeScreen(nextButton: goQuestion);
    });
  }

  void goResult() {
    setState(() {
      currScreen = ResultScreen(
        player: jad,
        questionList: questionList,
        nextButton: goWelcome,
      );
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currScreen,
        ),
      ),
    );
  }
}
