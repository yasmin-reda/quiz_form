import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final String name;

  const ResultScreen({super.key, required this.score, required this.name});

  @override
  Widget build(BuildContext context) {
    String congratulatoryMessage;
    if (score == 3) {
      congratulatoryMessage = 'CONGRATULATIONS';
    } else if (score == 0) {
      congratulatoryMessage = 'GOOD LUCK';
    } else {
      congratulatoryMessage = 'WELL DONE';
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(199, 194, 175, 149),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(199, 131, 117, 98),
        title: const Text('QUIZ RESULT'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                congratulatoryMessage,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'HELLO $name, YOUR SCORE IS',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                '$score/${3}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text(
                  '  Finish  ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
