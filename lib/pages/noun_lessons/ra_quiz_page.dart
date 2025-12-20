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
  List<bool?> _userAnswers = List.filled(10, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'man kitâb (râ) me-xâham\nمن کتاب (را) می‌خواهم\nI want a book',
      'correctAnswer': false,
      'explanation': 'No, because "a book" is indefinite (not specific).',
    },
    {
      'question': 'o ustâd (râ) dîd\nاو استاد (را) دید\nHe saw the teacher',
      'correctAnswer': true,
      'explanation': 'Yes, because "the teacher" is definite.',
    },
    {
      'question': 'mâ seb (râ) xarîdem\nما سیب (را) خریدیم\nWe bought apples',
      'correctAnswer': false,
      'explanation': 'No, because "apples" is indefinite (some apples).',
    },
    {
      'question': 'šumâ în kitâb (râ) xândîd\nشما این کتاب (را) خواندید\nYou read this book',
      'correctAnswer': true,
      'explanation': 'Yes, because "this book" is definite.',
    },
    {
      'question': 'ân pisar âb (râ) me-xâhad\nآن پسر آب (را) می‌خواهد\nThat boy wants water',
      'correctAnswer': false,
      'explanation': 'No, because "water" is a general mass noun.',
    },
    {
      'question': 'man dost-am (râ) dîdam\nمن دوستم (را) دیدم\nI saw my friend',
      'correctAnswer': true,
      'explanation': 'Yes, because "my friend" is definite.',
    },
    {
      'question': 'o film (râ) dîd\nاو فیلم (را) دید\nShe watched a movie',
      'correctAnswer': false,
      'explanation': 'No, because "a movie" is indefinite.',
    },
    {
      'question': 'mâ în mâšîn (râ) xarîdem\nما این ماشین (را) خریدیم\nWe bought this car',
      'correctAnswer': true,
      'explanation': 'Yes, because "this car" is definite.',
    },
    {
      'question': 'man nân (râ) xordam\nمن نان (را) خوردم\nI ate bread',
      'correctAnswer': false,
      'explanation': 'No, because "bread" is a general mass noun.',
    },
    {
      'question': 'o kitâb-hâ-yi jadîd (râ) xarîd\nاو کتاب‌های جدید (را) خرید\nHe bought the new books',
      'correctAnswer': true,
      'explanation': 'Yes, because the books are specific.',
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
            

            const Text(
              'Does this sentence require “râ”?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 12),
            
            // Question
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.teal),
              ),
              child: _buildFormattedQuestion(question['question']),
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
            
            const SizedBox(height: 30),
            
            // Explanation (if answered)
            if (_userAnswers[_currentQuestion] != null)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _userAnswers[_currentQuestion] == true
                      ? Colors.green[50]
                      : Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _userAnswers[_currentQuestion] == true
                        ? Colors.green[100]!
                        : Colors.red[100]!,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userAnswers[_currentQuestion] == true
                          ? '✓ Correct!'
                          : '✗ Incorrect',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: _userAnswers[_currentQuestion] == true
                            ? Colors.green
                            : Colors.red,
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
            
            // if (_userAnswers[_currentQuestion] != null)
            //   Container(
            //     padding: const EdgeInsets.all(12),
            //     margin: const EdgeInsets.only(bottom: 16),
            //     decoration: BoxDecoration(
            //       color: _userAnswers[_currentQuestion] == true
            //           ? Colors.green.shade50
            //           : Colors.red.shade50,
            //       borderRadius: BorderRadius.circular(8),
            //       border: Border.all(
            //         color: _userAnswers[_currentQuestion] == true
            //             ? Colors.green
            //             : Colors.red,
            //       ),
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           _userAnswers[_currentQuestion] == true
            //               ? 'Correct! ✅'
            //               : 'Incorrect ❌',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: _userAnswers[_currentQuestion] == true
            //                 ? Colors.green
            //                 : Colors.red,
            //           ),
            //         ),
            //         const SizedBox(height: 8),
            //         Text(question['explanation']),
            //       ],
            //     ),
            //   ),
            
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
                  backgroundColor: Colors.teal,
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

  Widget _buildFormattedQuestion(String text) {
    final parts = text.split('\n');

    return Column(
      children: [
        // Romanization
        Text(
          parts[0],
          style: const TextStyle(
            fontFamily: 'Courier',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),

        // Nastaliq (RTL)
        Text(
          parts[1],
          style: const TextStyle(
            fontFamily: 'NotoNastaliqUrdu',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),

        // English
        Text(
          parts[2],
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.grey[700],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAnswerButton({
    required String label,
    required bool isTrue,
    required bool isSelected,
    required bool isCorrect,
  }) {
    Color backgroundColor = Colors.teal;
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
            : Colors.white,
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