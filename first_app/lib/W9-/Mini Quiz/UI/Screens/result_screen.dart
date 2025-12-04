import 'package:flutter/material.dart';
import '../../Model/player.dart';
import '../../Model/question.dart';

class ResultScreen extends StatelessWidget {
  final Player player;
  final List<Question> questionList;
  final VoidCallback nextButton;

  const ResultScreen({
    super.key,
    required this.player,
    required this.questionList,
    required this.nextButton,
  });

  @override
  Widget build(BuildContext context) {
    int score = 0;

    // Count score
    for (int i = 0; i < questionList.length; i++) {
      if (player.answerList[i].playerChoice == questionList[i].goodChoice) {
        score++;
      }
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              const Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.white70,
              ),
              const SizedBox(height: 24),
              const Text(
                "Quiz Completed!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        score.toString(),
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff16C062),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "out of ${questionList.length}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "${((score / questionList.length) * 100).toStringAsFixed(1)}%",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff16C062),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: nextButton,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xff16C062),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Take Quiz Again",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
