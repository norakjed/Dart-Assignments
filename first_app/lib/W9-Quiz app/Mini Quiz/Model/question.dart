class Question {
  final int id;
  final String title;
  final List<String> choices;
  final int goodChoice;
  final int point;

  Question({
    required this.id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    required this.point,
  });
}
