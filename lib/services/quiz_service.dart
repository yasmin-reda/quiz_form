import 'package:app/models/questions.dart';

class QuizService {
  List<Question> getQuestions() {
    return [
      Question(
        text: 'What does RAM stand for?',
        answers: [
          'Random Access Memory',
          'Read All Memory',
          'Run Access Memory'
        ],
        correctAnswer: 'Random Access Memory',
      ),
      Question(
        text: 'Which of these is an operating system?',
        answers: ['Windows', 'Python', 'HTML'],
        correctAnswer: 'Windows',
      ),
      Question(
        text: 'What does HTML stand for?',
        answers: [
          'Hyper Text Markup Language',
          'Home Tool Markup Language',
          'Hyperlinks and Text Markup Language'
        ],
        correctAnswer: 'Hyper Text Markup Language',
      ),
    ];
  }
}
