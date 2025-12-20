// Part 6
import 'package:flutter/material.dart';
import 'package:flutter_application_uas/services/database_service.dart';

class VerbPracticePage extends StatefulWidget {
  const VerbPracticePage({super.key});

  @override
  State<VerbPracticePage> createState() => _VerbPracticePageState();
}

class _VerbPracticePageState extends State<VerbPracticePage> {
  final DatabaseService _database = DatabaseService();
  int _currentQuestion = 0;
  int _score = 0;
  List<int?> _userAnswers = List.filled(10, null);
  List<bool> _showResult = List.filled(10, false);
  bool _quizCompleted = false;

  // Updated VerbPracticePage quiz array
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the infinitive form of "to eat" in Persian?',
      'options': ['می‌خورم', 'خور', 'خوردن', 'خورده'],
      'correctAnswer': 2,
      'explanation': 'The infinitive form is "خوردن" (xordan) which ends with "-dan".',
    },
    {
      'question': 'What prefix is required for present tense in Persian?',
      'options': ['be-', 'na-', 'me-', '-dan'],
      'correctAnswer': 2,
      'explanation': '"me-" is added to indicate present/imperfect aspect.',
    },
    {
      'question': 'How do you say "I eat" in Persian?',
      'options': ['می‌خوری', 'می‌خورم', 'می‌خورد', 'می‌خوریم'],
      'correctAnswer': 1,
      'explanation': '"می‌خورم" (me-xoram) is the first person singular conjugation.',
    },
    {
      'question': 'What suffix is added for "you (singular)"?',
      'options': ['-ed', '-î', '-ad', '-em'],
      'correctAnswer': 1,
      'explanation': 'The suffix "-î" is added for second person singular.',
    },
    {
      'question': 'How do you say "they eat" in Persian?',
      'options': ['می‌خورند', 'می‌خوریم', 'می‌خورید', 'می‌خورد'],
      'correctAnswer': 0,
      'explanation': '"می‌خورند" (me-xorand) is the third person plural conjugation.',
    },
    {
      'question': 'What is the present stem of "xâbîdan" (to sleep)?',
      'options': ['xâbî', 'xâb', 'xâbid', 'xâbîd'],
      'correctAnswer': 1,
      'explanation': 'The present stem is "xâb" (remove "-îdan" from the infinitive).',
    },
    {
      'question': 'How do you say "we work" in Persian?',
      'options': ['می‌کنیم', 'می‌کنند', 'می‌کنید', 'می‌کنم'],
      'correctAnswer': 0,
      'explanation': '"می‌کنیم" (me-kunem) is the first person plural of "kardan" (to do/work).',
    },
    {
      'question': 'How do you form negative verbs in Persian present tense?',
      'options': ['Add "ne" at the end', 'Remove "me-" prefix', 'Add "ne-" prefix', 'Add "na" before "me-"'],
      'correctAnswer': 3,
      'explanation': 'Add "na" prefix before the "me-" prefix: na me-xoram (I do not eat).',
    },
    {
      'question': 'How do you say "I do not drink" in Persian?',
      'options': ['می‌نوشم', 'می‌نوشم نه', 'نوشم نمی', 'نمی‌نوشم'],
      'correctAnswer': 3,
      'explanation': '"نمی‌نوشم" (na me-nošam) - "na" before "me-" creates the negative.',
    },
    {
      'question': 'Which is the correct negative form of "me-xâbad" (he sleeps)?',
      'options': ['می‌خوابد نه', 'نمی‌خوابد', 'می‌خوابد ن', 'خوابد نمی'],
      'correctAnswer': 1,
      'explanation': '"نمی‌خوابد" (na me-xâbad) means "he does not sleep".',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Exercises'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Bar
              LinearProgressIndicator(
                value: (_currentQuestion + 1) / _questions.length,
                backgroundColor: Colors.grey[200],
                color: Colors.green,
                minHeight: 8,
              ),
              const SizedBox(height: 16),

              // Score and Progress
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
                    'Score: $_score/${_questions.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
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
              ...List.generate(
                (question['options'] as List).length,
                (index) => _buildOptionButton(index, question),
              ),

              // Result/Explanation
              if (_showResult[_currentQuestion])
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _userAnswers[_currentQuestion] ==
                            question['correctAnswer']
                        ? Colors.green[50]
                        : Colors.red[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _userAnswers[_currentQuestion] ==
                              question['correctAnswer']
                          ? Colors.green[100]!
                          : Colors.red[100]!,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _userAnswers[_currentQuestion] ==
                                question['correctAnswer']
                            ? '✓ Correct!'
                            : '✗ Incorrect',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: _userAnswers[_currentQuestion] ==
                                  question['correctAnswer']
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

              const SizedBox(height: 40),

              // Navigation Buttons
              if (_quizCompleted)
                Column(
                  children: [
                    Text(
                      'Quiz Completed!',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Your score: $_score/${_questions.length}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const Text('Back to Home', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                )
              else
                ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: Text(
                    _currentQuestion < _questions.length - 1
                        ? 'Next Question'
                        : 'Finish Quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     ElevatedButton.icon(
                //       onPressed: _currentQuestion > 0 ? _previousQuestion : null,
                //       icon: const Icon(Icons.arrow_back, color: Colors.white),
                //       label: const Text('Previous', style: TextStyle(color: Colors.white),),
                //     ),
                //     if (_currentQuestion < _questions.length - 1)
                //       ElevatedButton.icon(
                //         onPressed:
                //             _userAnswers[_currentQuestion] != null
                //                 ? _nextQuestion
                //                 : null,
                //         icon: const Icon(Icons.arrow_forward, color: Colors.white),
                //         label: const Text('Next', style: TextStyle(color: Colors.white),),
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.blue,
                //         ),
                //       )
                //     else
                //       ElevatedButton.icon(
                //         onPressed:
                //             _userAnswers[_currentQuestion] != null
                //                 ? _completeQuiz
                //                 : null,
                //         icon: const Icon(Icons.quiz, color: Colors.white),
                //         label: const Text('Finish Quiz', style: TextStyle(color: Colors.white),),
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.green,
                //         ),
                //       ),
                //   ],
                // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(int index, Map<String, dynamic> question) {
    final isSelected = _userAnswers[_currentQuestion] == index;
    final isCorrect = index == question['correctAnswer'];
    final showResult = _showResult[_currentQuestion];

    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey[300]!;
    Color textColor = Colors.black;

    if (showResult) {
      if (isCorrect) {
        backgroundColor = Colors.green[50]!;
        borderColor = Colors.green;
        textColor = Colors.green[800]!;
      } else if (isSelected) {
        backgroundColor = Colors.red[50]!;
        borderColor = Colors.red;
        textColor = Colors.red[800]!;
      }
    } else if (isSelected) {
      backgroundColor = Colors.blue[50]!;
      borderColor = Colors.blue;
      textColor = Colors.blue[800]!;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () {
          if (!_showResult[_currentQuestion]) {
            _selectAnswer(index);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
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
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: borderColor),
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
            if (showResult && isCorrect)
              const Icon(Icons.check_circle, color: Colors.green),
            if (showResult && isSelected && !isCorrect)
              const Icon(Icons.cancel, color: Colors.red),
          ],
        ),
      ),
    );
  }

  void _selectAnswer(int index) {
    setState(() {
      _userAnswers[_currentQuestion] = index;
      _showResult[_currentQuestion] = true;
      
      // Update score if correct
      if (index == _questions[_currentQuestion]['correctAnswer'] && 
          _score <= _currentQuestion) {
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

  // void _previousQuestion() {
  //   setState(() {
  //     _currentQuestion--;
  //   });
  // }

  Future<void> _completeQuiz() async {
    try {
      // Save quiz result to Firebase
      await _database.saveQuizResult(
        quizId: 'verb_practice_quiz',
        quizName: 'Verb Practice Quiz',
        score: _score,
        maxScore: _questions.length,
        answers: _getAnswersMap(),
      );

      setState(() {
        _quizCompleted = true;
      });
      
      // Show success dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Quiz Completed!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You scored $_score out of ${_questions.length}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Text(
                _score == _questions.length
                    ? 'Excellent! You mastered the present tense! 🎉'
                    : _score >= _questions.length / 2
                        ? 'Good job! Keep practicing! 👍'
                        : 'Review the material and try again! 💪',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Your score has been saved to your profile!',
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                setState(() {
                  // Reset quiz if they want to review
                  _currentQuestion = 0;
                  _score = 0;
                  _userAnswers = List.filled(10, null);
                  _showResult = List.filled(10, false);
                  _quizCompleted = false;
                });
              },
              child: const Text('Review Again'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.of(context).popUntil((route) => route.isFirst); // Go to HomePage
              },
              child: const Text('Finish'),
            ),
          ],
        ),
      );
    } catch (e) {
      // Show error if Firebase save fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Could not save your quiz result. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Map<String, bool> _getAnswersMap() {
    final Map<String, bool> answers = {};
    for (int i = 0; i < _questions.length; i++) {
      answers['q${i + 1}'] = _userAnswers[i] == _questions[i]['correctAnswer'];
    }
    return answers;
  }
}