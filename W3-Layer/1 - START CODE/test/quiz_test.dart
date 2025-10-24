import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {
  Question q1 = Question(
    title: "Capital of France?",
    choices: ["Paris", "London", "Rome"],
    goodChoice: "Paris",
    points: 60,
  );
  Question q2 = Question(
    title: "2 + 2 = ?",
    choices: ["2", "4", "5"],
    goodChoice: "4",
    points: 40,
  );

  Player p1 = Player(name: 'Jed');
  Player p2 = Player(name: 'Poly');

  Quiz quiz = Quiz(players: [p1, p2], questions: [q1, q2]);

   test('All answers correct (100%)', () {
    Answer a1 = Answer(question: q1, answerChoice: 'Paris');
    Answer a2 = Answer(question: q2, answerChoice: '4');

    quiz.addAnswer(p1, a1);
    quiz.addAnswer(p1, a2);

    expect(quiz.getScoreInPercentage(p1), 100);
    expect(quiz.getScore(p1), 100);
  });

  test('One answer wrong (50%)', () {
    Answer a1 = Answer(question: q1, answerChoice: 'Paris');
    Answer a2 = Answer(question: q2, answerChoice: '5');

    quiz.addAnswer(p2, a1);
    quiz.addAnswer(p2, a2);

    expect(quiz.getScoreInPercentage(p2), 50);
    expect(quiz.getScore(p2), 60);
  });
}