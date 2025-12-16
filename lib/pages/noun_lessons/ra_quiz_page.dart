import 'package:flutter/material.dart';
import 'package:flutter_application_uas/services/database_service.dart';

class RaQuizPage extends StatefulWidget {
  const RaQuizPage({super.key});

  @override
  State<RaQuizPage> createState() => _RaQuizPageState();
}

class _RaQuizPageState extends State<RaQuizPage> {
  final DatabaseService _database = DatabaseService();
  int _currentQuestion = 0;
  int _score = 0;
  bool _quizCompleted = false;
  List<bool?> _userAnswers = List.filled(5, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Does this sentence require "râ"?\n"man ketâb (râ) mixâham" (I want a book)',
      'correctAnswer': false,
      'explanation': 'No, because "a book" is indefinite (not specific).',
    },
    {
      'question': 'Does this sentence require "râ"?\n"u ostâd (râ) did" (He saw the teacher)',
      'correctAnswer': true,
      'explanation': 'Yes, because "the teacher" is definite (specific person).',
    },
    {
      'question': 'Does this sentence require "râ"?\n"mâ sib (râ) xaridim" (We bought apples)',
      'correctAnswer': false,
      'explanation': 'No, because "apples" is indefinite (some apples, not specific ones).',
    },
    {
      'question': 'Does this sentence require "râ"?\n"šumâ in ketâb (râ) xândid" (You read this book)',
      'correctAnswer': true,
      'explanation': 'Yes, because "this book" is definite (specific book).',
    },
    {
      'question': 'Does this sentence require "râ"?\n"ân pesar âb (râ) mixâhad" (That boy wants water)',
      'correctAnswer': false,
      'explanation': 'No, because "water" is general/indefinite here.',
    },
  ];

  void _submitAnswer(bool answer) {
    if (_userAnswers[_currentQuestion] != null) return;

    setState(() {
      _userAnswers[_currentQuestion] = answer == 
          _questions[_currentQuestion]['correctAnswer'];
      
      if (_userAnswers[_currentQuestion] == true) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
      });
    } else {
      _completeQuiz();
    }
  }

  Future<void> _completeQuiz() async {
    setState(() {
      _quizCompleted = true;
    });

    // Save quiz result to Firebase
    final userId = await _getCurrentUserId();
    if (userId != null) {
      await _database.saveQuizResult(
        quizId: 'ra_usage',
        quizName: 'Râ Usage Quiz',
        score: _score,
        maxScore: _questions.length,
        answers: {},
      );
    }
  }

  Future<String?> _getCurrentUserId() async {
    // Get current user ID - you need to implement this based on your auth
    return 'user_id'; // Replace with actual user ID
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text('"Râ" Usage Quiz'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            LinearProgressIndicator(
              value: (_currentQuestion + 1) / _questions.length,
              backgroundColor: Colors.grey.shade200,
              color: Colors.teal,
            ),
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${_currentQuestion + 1}/${_questions.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Score: $_score',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Question
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.teal),
              ),
              child: Text(
                question['question'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // True/False buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildAnswerButton(
                    label: 'TRUE',
                    isTrue: true,
                    isSelected: _userAnswers[_currentQuestion] != null &&
                        _userAnswers[_currentQuestion] == (question['correctAnswer'] == true),
                    isCorrect: question['correctAnswer'] == true,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildAnswerButton(
                    label: 'FALSE',
                    isTrue: false,
                    isSelected: _userAnswers[_currentQuestion] != null &&
                        _userAnswers[_currentQuestion] == (question['correctAnswer'] == false),
                    isCorrect: question['correctAnswer'] == false,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Explanation (if answered)
            if (_userAnswers[_currentQuestion] != null)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: _userAnswers[_currentQuestion] == true
                      ? Colors.green.shade50
                      : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _userAnswers[_currentQuestion] == true
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userAnswers[_currentQuestion] == true
                          ? 'Correct! ✅'
                          : 'Incorrect ❌',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _userAnswers[_currentQuestion] == true
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(question['explanation']),
                  ],
                ),
              ),
            
            const Spacer(),
            
            // Next/Finish button
            if (_quizCompleted)
              Column(
                children: [
                  Text(
                    'Quiz Completed!',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    'Your score: $_score/${_questions.length}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to home or next lesson
                      // Navigate back to home
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('Back to Home'),
                  ),
                ],
              )
            else if (_userAnswers[_currentQuestion] != null)
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(
                  _currentQuestion < _questions.length - 1
                      ? 'Next Question'
                      : 'Finish Quiz',
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerButton({
    required String label,
    required bool isTrue,
    required bool isSelected,
    required bool isCorrect,
  }) {
    Color backgroundColor = Colors.transparent;
    Color borderColor = Colors.grey;
    
    if (isSelected) {
      backgroundColor = isCorrect ? Colors.green.shade50 : Colors.red.shade50;
      borderColor = isCorrect ? Colors.green : Colors.red;
    }
    
    return ElevatedButton(
      onPressed: () {
        if (_userAnswers[_currentQuestion] == null) {
          _submitAnswer(isTrue);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: isSelected 
            ? (isCorrect ? Colors.green : Colors.red)
            : Colors.teal,
        side: BorderSide(color: borderColor, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}