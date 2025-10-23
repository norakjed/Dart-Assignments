import '../domain/answer.dart';
import '../domain/Player.dart';
import '../domain/quiz.dart';
import 'dart:io';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print("--- Welcome to the Quiz ---");

    while (true) {
      stdout.write("\nYour name: ");
      String? name = stdin.readLineSync();

      if (name == null || name.isEmpty) {
        print("\n--- Quiz Finished ---");
        quiz.displayScore();
        break;
      }

      quiz.answers = []; // reset answers each time

      for (var question in quiz.questions) {
        print("\nQuestion: ${question.title} - (${question.point} points)");
        print("Choices: ${question.choices}");
        stdout.write("Your answer: ");
        String? answer = stdin.readLineSync() ?? "";

        quiz.addAnswer(Answer(question: question, answerChoice: answer));
      }

      int scoreInPoint = quiz.getScoreInPoint();
      int scoreInPercentage = quiz.getScoreInPercentage();

      // Create and add player with their score
      Player player = Player(name: name, score: scoreInPoint);
      quiz.addPlayer(player);

      print(
          "$name, your score in percentage: $scoreInPercentage% | in points: $scoreInPoint");
      quiz.displayScore();
    }
  }
}
