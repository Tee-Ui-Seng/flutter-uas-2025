// Part 7
import 'package:flutter/material.dart';
import 'package:flutter_application_uas/services/database_service.dart';
import 'package:flutter_application_uas/pages/home_page.dart';

class GrammarQuizPage extends StatefulWidget {
  const GrammarQuizPage({super.key});

  @override
  State<GrammarQuizPage> createState() => _GrammarQuizPageState();
}

class _GrammarQuizPageState extends State<GrammarQuizPage> {
  final DatabaseService _database = DatabaseService();
  int _currentQuestion = 0;
  int _score = 0;
  bool _quizCompleted = false;
  List<int?> _userAnswers = List.filled(8, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is a copula in Persian grammar?',
      'options': [
        'A word that connects subject and description',
        'A type of verb ending',
        'A preposition',
        'A conjunction'
      ],
      'correctAnswer': 0,
      'explanation': 'A copula connects the subject with words that describe it, like "to be" in English.',
    },
    {
      'question': 'How do you say "I am" in Persian using the copula?',
      'options': ['man nestam', 'man budam', 'man astam', 'man ast'],
      'correctAnswer': 2,
      'explanation': 'The correct form is "man astam" using the "astan" form.',
    },
    {
      'question': 'How do you form the negative of "astam"?',
      'options': ['Replace "a-" with "ne-"', 'Add "na" at the beginning', 'Add "ne" at the end', 'Remove "a-"'],
      'correctAnswer': 0,
      'explanation': 'To form negative, replace the beginning "a-" with "ne-": astam → nestam.',
    },
    {
      'question': 'What does "va" mean in Persian?',
      'options': ['but', 'or', 'because', 'and'],
      'correctAnswer': 3,
      'explanation': '"Va" (و) means "and" and connects words or sentences.',
    },
    {
      'question': 'Which conjunction means "because" in Persian?',
      'options': ['agar', 'amâ', 'cûnki', 'pas'],
      'correctAnswer': 2,
      'explanation': '"Cûnki" (چونکه) or "zerâ" (زیرا) both mean "because".',
    },
    {
      'question': 'What does the preposition "dar" mean?',
      'options': ['with', 'in/at', 'from', 'to'],
      'correctAnswer': 1,
      'explanation': '"Dar" (در) can mean both "in" and "at" depending on context.',
    },
    {
      'question': 'How do you say "with friend" in Persian?',
      'options': ['dar dost', 'bâ dost', 'az dost', 'ba dost'],
      'correctAnswer': 1,
      'explanation': '"Bâ" (با) means "with", so "bâ dost" means "with friend".',
    },
    {
      'question': 'barâdar meva ... gošt me-xorad.',
      'options': ['agar', 'amâ', 'cûnki', 'va'],
      'correctAnswer': 3,
      'explanation': 'The sentence translates to "Brother eats fruit and meat".',
    },
  ];

  void _submitAnswer(int selectedIndex) {
    if (_userAnswers[_currentQuestion] != null) return;

    setState(() {
      _userAnswers[_currentQuestion] = selectedIndex;

      if (selectedIndex == _questions[_currentQuestion]['correctAnswer']) {
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
        quizId: 'grammar_level_1',
        quizName: 'Grammar Level 1 Quiz',
        score: _score,
        maxScore: _questions.length,
        answers: {},
      );
    }
  }

  Future<String?> _getCurrentUserId() async {
    // Get current user ID - implement based on your auth
    return 'user_id'; // Replace with actual user ID
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];
    final isCorrect = _userAnswers[_currentQuestion] == question['correctAnswer'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grammar Quiz'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
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
              color: Colors.red,
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
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Question
            Text(
              question['question'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Options
            Expanded(
              child: ListView.builder(
                itemCount: (question['options'] as List).length,
                itemBuilder: (context, index) {
                  final hasAnswered = _userAnswers[_currentQuestion] != null;
                  final isCorrect = index == question['correctAnswer'];  
                  final isSelected = index == _userAnswers[_currentQuestion]; 
                  
                  Color backgroundColor = Colors.white;
                  Color borderColor = Colors.grey[300]!;
                  Color textColor = Colors.black;

                  if (hasAnswered) {
                    if (isCorrect) {
                      backgroundColor = Colors.green.shade50;
                      borderColor = Colors.green;
                      textColor = Colors.green.shade800;
                    }

                    if (isSelected && !isCorrect) {
                      backgroundColor = Colors.red.shade50;
                      borderColor = Colors.red;
                      textColor = Colors.red.shade800;
                    }
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_userAnswers[_currentQuestion] == null) {
                          _submitAnswer(index);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        foregroundColor: textColor,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: borderColor, width: 2),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: borderColor, width: 2),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                String.fromCharCode(65 + index), // A, B, C, D
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              question['options'][index],
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: index == 2 || index == 1 ? 'NotoNaskhArabic' : null,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                          if (hasAnswered && isCorrect)
                            const Icon(Icons.check_circle, color: Colors.green),

                          if (hasAnswered && isSelected && !isCorrect)
                            const Icon(Icons.cancel, color: Colors.red),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Explanation (if answered)
            if (_userAnswers[_currentQuestion] != null)
              Container(
                margin: const EdgeInsets.only(top: 24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isCorrect ? Colors.green[50] : Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isCorrect ? Colors.green[100]! : Colors.red[100]!,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(isCorrect ? '✓ Correct!' : '✗ Incorrect',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      question['explanation'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),
            
            // Next/Finish button
            if (_quizCompleted)
              Column(
                children: [
                  Text(
                    'Quiz Completed!',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'Your score: $_score/${_questions.length}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to home
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            else if (_userAnswers[_currentQuestion] != null)
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(
                  _currentQuestion < _questions.length - 1
                      ? 'Next Question'
                      : 'Finish Quiz',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}