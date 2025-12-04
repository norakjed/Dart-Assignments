import '../Model/question.dart';

List<Question> questionList = [
  Question(
    id: 1,
    title: "Who is the best teacher?",
    choices: ["Ronan Ogor", "Nicolas Tesla", "Bill Gate"],
    goodChoice: 0,
    point: 25,
  ),
  Question(
    id: 2,
    title: "What is 2+2?",
    choices: ["1", "2", "3", "4"],
    goodChoice: 3,
    point: 25,
  ),
  Question(
    id: 3,
    title: "What is the best pet",
    choices: ["cat", "dog", "pig"],
    goodChoice: 1,
    point: 25,
  ),
  Question(
    id: 4,
    title: "What is the captial of Cambodia?",
    choices: ["Phnom Penh", "Siem Reap", "Sihanoukville"],
    goodChoice: 0,
    point: 25,
  ),
];
