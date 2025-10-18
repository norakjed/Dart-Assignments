class Question {
  String title;
  List<String> choices;
  String goodChoice;

  Question(this.title, this.choices, this.goodChoice);

  bool isCorrect(String correct) {
    if (correct == goodChoice) {
      return true;
    } else {
      return false;
    }
  }
}

class Answer {
  String answerChoice;
  bool isGoodAnswer;

  Answer(this.answerChoice, this.isGoodAnswer);
}

class Quiz {
  List<Answer> ans = [];

  void addAnswer(Answer answer){
    ans.add(answer);
  }

  int getScore() {
    int score = 0;
    for (var answer in ans) {
      if (answer.isGoodAnswer) {
        score++;
      }
    }
    return score;
  }
}
