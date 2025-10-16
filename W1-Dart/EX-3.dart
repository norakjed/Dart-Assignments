void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  var passScores = scores.where((scores) => scores >= 50).toList();
  passScores.sort();

  print("Pass Score: ${passScores}");

}
