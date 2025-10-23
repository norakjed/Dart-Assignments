import 'package:my_first_project/domain/Player.dart';
import 'package:my_first_project/domain/answer.dart';
import 'package:my_first_project/domain/Question.dart';
import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {
  Question q1 = Question(
      title: "2+2", choices: ["1", "2", "4"], goodChoice: "4", point: 10);
  Question q2 = Question(
      title: "2+3", choices: ["1", "2", "5"], goodChoice: "5", point: 50);

  Quiz quiz = Quiz(questions: [q1, q2]);

  test('Calculate score in point', () {
    quiz.addAnswer(Answer(question: q1, answerChoice: "4")); // correct
    quiz.addAnswer(Answer(question: q2, answerChoice: "2")); // incorrect

    expect(quiz.getScoreInPoint(), 10);

    int scoreInPoint = quiz.getScoreInPoint();

    quiz.addPlayer(Player(name: "Alice", score: scoreInPoint));

    expect(quiz.players.length, 1);
    expect(quiz.players[0].name, "Alice");
    expect(quiz.players[0].score, 10);
  });
}