import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;
  final List<String> answers;
  final ValueChanged<String> onAnswerSelected;
  const QuestionWidget({
    super.key,
    required this.questionText,
    required this.answers,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            questionText,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          ...answers.map((answer) {
            return AnswerButton(
              answerText: answer,
              onPressed: () => onAnswerSelected(answer),
            );
          }),
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String answerText;
  final VoidCallback onPressed;

  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(answerText),
      ),
    );
  }
}
