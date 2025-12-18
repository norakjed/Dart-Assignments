import 'package:flutter/material.dart';
import '../../Model/answer.dart';
import '../../Model/player.dart';
import '../../Model/question.dart';

class QuestionScreen extends StatefulWidget {
  final VoidCallback nextButton;
  final Player player;
  final List<Question> questionList;

  const QuestionScreen({
    super.key,
    required this.player,
    required this.questionList,
    required this.nextButton,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late Question currQuestion;
  int currQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    currQuestion = widget.questionList[currQuestionIndex];

    // Initialize player answer list with empty answers if needed
    while (widget.player.answerList.length < widget.questionList.length) {
      widget.player.answerList.add(Answer(playerChoice: -1));
    }
  }

  void selectChoice(int choiceIndex) {
    setState(() {
      widget.player.answerList[currQuestionIndex].playerChoice = choiceIndex;
    });
  }

  void nextQuestion() {
    if (currQuestionIndex < widget.questionList.length - 1) {
      setState(() {
        currQuestionIndex++;
        currQuestion = widget.questionList[currQuestionIndex];
      });
    } else {
      widget.nextButton();
    }
  }

  void back() {
    if (currQuestionIndex > 0) {
      setState(() {
        currQuestionIndex--;
        currQuestion = widget.questionList[currQuestionIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedChoice =
        widget.player.answerList[currQuestionIndex].playerChoice;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Progress indicator
              LinearProgressIndicator(
                value: (currQuestionIndex + 1) / widget.questionList.length,
                minHeight: 8,
                backgroundColor: Colors.white30,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                "Question ${currQuestionIndex + 1} of ${widget.questionList.length}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              // Question card
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    currQuestion.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              // Choice buttons
              for (int i = 0; i < currQuestion.choices.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: selectedChoice == i ? 6 : 2,
                      color: selectedChoice == i
                          ? const Color(0xff16C062)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedChoice == i
                              ? const Color(0xff16C062)
                              : Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => selectChoice(i),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 14.0,
                            ),
                            child: Text(
                              currQuestion.choices[i],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: selectedChoice == i
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: back,
                      icon: const Icon(Icons.arrow_back),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white24,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      label: const Text("Back"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: nextQuestion,
                      icon: const Icon(Icons.arrow_forward),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xff16C062),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      label: Text(
                        currQuestionIndex + 1 >= widget.questionList.length
                            ? "Finish"
                            : "Next",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
