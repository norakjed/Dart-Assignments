import './answer.dart';
import 'Player.dart';
import './Question.dart';

class Quiz {
  List<Question> questions;
  List<Answer> answers = [];
  List<Player> players = [];

  Quiz({required this.questions});

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  void addPlayer(Player player) {
    this.players.add(player);
  }

  int getScoreInPercentage() {
    int totalSCore = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalSCore++;
      }
    }
    return ((totalSCore / questions.length) * 100).toInt();
  }

  int getScoreInPoint() {
    int totalPoint = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalPoint += answer.question.point;
      }
    }
    return totalPoint;
  }

  void displayScore() {
    print("\n--- Player Scores ---");
    for (var player in players) {
      print("Player: ${player.name}\tScore: ${player.score}");
    }
  }
}
