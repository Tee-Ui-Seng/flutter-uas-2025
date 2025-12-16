import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../services/database_service.dart';

class QuizPage extends StatefulWidget {
  final String quizId;
  final String quizName;

  const QuizPage({
    super.key,
    required this.quizId,
    required this.quizName,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final DatabaseService _database = DatabaseService();
  final List<Map<String, dynamic>> _questions = [
    {
      'id': 'q1',
      'question': 'What is Flutter?',
      'options': ['Framework', 'Language', 'Database', 'OS'],
      'correctAnswer': 0,
    },
    {
      'id': 'q2',
      'question': 'Which language does Flutter use?',
      'options': ['Java', 'Kotlin', 'Dart', 'Swift'],
      'correctAnswer': 2,
    },
    // Add more questions
  ];

  Map<String, int> _userAnswers = {};
  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text(widget.quizName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              question['question'],
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ...List.generate(
              (question['options'] as List).length,
              (index) => RadioListTile<int>(
                title: Text(question['options'][index]),
                value: index,
                groupValue: _userAnswers[question['id']],
                onChanged: (value) {
                  setState(() {
                    _userAnswers[question['id']] = value!;
                  });
                },
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentQuestionIndex--;
                      });
                    },
                    child: const Text('Previous'),
                  ),
                if (_currentQuestionIndex < _questions.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentQuestionIndex++;
                      });
                    },
                    child: const Text('Next'),
                  ),
                if (_currentQuestionIndex == _questions.length - 1)
                  ElevatedButton(
                    onPressed: _submitQuiz,
                    child: const Text('Submit Quiz'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitQuiz() async {
    // Calculate score
    int score = 0;
    Map<String, bool> answers = {};

    for (var question in _questions) {
      final userAnswer = _userAnswers[question['id']];
      final isCorrect = userAnswer == question['correctAnswer'];
      answers[question['id']] = isCorrect;
      if (isCorrect) score++;
    }

    // Save to Firestore
    await _database.saveQuizResult(
      quizId: widget.quizId,
      quizName: widget.quizName,
      score: score,
      maxScore: _questions.length,
      answers: answers,
    );

    // Show result
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text('Your score: $score/${_questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}