import 'package:flutter/material.dart';
import 'result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final String name;

  const QuestionScreen({super.key, required this.name});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': '         What does RAM stand for?     ',
      'answers': [
        'Random Access Memory',
        'Read All Memory              ',
        'Run Access Memory         '
      ],
      'correct': 'Random Access Memory',
    },
    {
      'question': '    Which of these is an operating system?     ',
      'answers': ['Windows', 'Python  ', 'HTML    '],
      'correct': 'Windows',
    },
    {
      'question': '          What does HTML stand for?           ',
      'answers': [
        'Hyper Text Markup Language               ',
        'Home Tool Markup Language               ',
        'Hyperlinks and Text Markup Language'
      ],
      'correct': 'Hyper Text Markup Language',
    },
  ];

  void _answerQuestion(String answer) {
    if (answer.trim() ==
        (_questions[_questionIndex]['correct'] as String).trim()) {
      _score++;
    }

    if (_questionIndex + 1 == _questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: _score, name: widget.name),
        ),
      );
    } else {
      setState(() {
        _questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(199, 194, 175, 149),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(199, 131, 117, 98),
        title: const Text('QUIZ'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Question ${_questionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 30, color: Colors.brown),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _questions[_questionIndex]['question'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...(_questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(
                        color: Color.fromARGB(255, 175, 120, 76)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => _answerQuestion(answer),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      answer,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
