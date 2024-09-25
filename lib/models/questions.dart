class Question {
  final String text;
  final List<String> answers;
  final String correctAnswer; // Add this field

  Question({
    required this.text,
    required this.answers,
    required this.correctAnswer,
  });
}
