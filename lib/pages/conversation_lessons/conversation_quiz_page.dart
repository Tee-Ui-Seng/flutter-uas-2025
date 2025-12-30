// Part 8
import 'package:flutter/material.dart';
import 'package:flutter_application_uas/services/database_service.dart';

class ConversationQuizPage extends StatefulWidget {
  const ConversationQuizPage({super.key});

  @override
  State<ConversationQuizPage> createState() => _ConversationQuizPageState();
}

class _ConversationQuizPageState extends State<ConversationQuizPage> {
  final DatabaseService _database = DatabaseService();
  int _currentQuestion = 0;
  int _score = 0;
  bool _quizCompleted = false;
  List<int?> _userAnswers = List.filled(10, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How do you say "Hello" in Persian?',
      'options': ['Xub asti?', 'Salâm!', 'Tašakkur', 'Me-baxšed'],
      'correctAnswer': 1,
      'explanation': '"Hello" in Persian is "Salâm!" (سلام).',
    },
    {
      'question': 'What is the appropriate response to "Citor astî!"?',
      'options': ['Tašakkur', 'Salâm!', 'Me-baxšed', 'Xub astam'],
      'correctAnswer': 3,
      'explanation': 'The typical response to "Citor astî!" (how are you) is "Xub astam" (I am good)',
    },
    {
      'question': 'How do you ask "What is your name?" formally?',
      'options': ['Citor-î?', 'Nâm-i tu ci ast', 'Nâm-i šumâ ci ast?', 'Az kujâ asted?'],
      'correctAnswer': 2,
      'explanation': '"What is your name?" is "Nâm-i šumâ ci ast?" (اسم شما چه است؟)',
    },
    {
      'question': 'What does "az dîdan-itân xušhâl astam" mean?',
      'options': ['Thank you', 'Nice to meet you', 'Excuse me', 'Goodbye'],
      'correctAnswer': 1,
      'explanation': 'It means "Nice to meet you" (از دیدن تان خوشحال استم)',
    },
    {
      'question': 'How do you say "Thank you" in Persian?',
      'options': ['Me-baxšed', 'Lutfan', 'Xub', 'Tašakkur'],
      'correctAnswer': 3,
      'explanation': '"Thank you" is "Tašakkur" (تشکر)',
    },
    {
      'question': 'What is the appropriate response to "Tašakkur"?',
      'options': ['Lutfan', 'Xâhiš me-kunam', 'Bale', 'Me-baxšed'],
      'correctAnswer': 1,
      'explanation': 'The response to "Thank you" is "Xâhiš me-kunam" (خواهش می‌کنم) meaning "You\'re welcome"',
    },
    {
      'question': 'How do you say "Good morning" in Persian?',
      'options': ['Šab baxair!', 'Subh baxair!', 'Ba’d az zohr baxair!', 'Roz-i xub-î!'],
      'correctAnswer': 1,
      'explanation': '"Good morning" is "Subh baxair!" (صبح بخیر)',
    },
    {
      'question': 'What does "me-baxšed" mean?',
      'options': ['Please', 'Thank you', 'Excuse me/Sorry', 'Goodbye'],
      'correctAnswer': 2,
      'explanation': '"Me-baxšed" (ببخشین) means both "Excuse me" and "Sorry"',
    },
    {
      'question': 'How do you say "Goodbye" in Persian?',
      'options': ['Xudâ hâfiz', 'Salâm', 'Xub asti', 'Lutfan'],
      'correctAnswer': 0,
      'explanation': '"Goodbye" is "Xodâ hâfez" (خدا حافظ)',
    },
    {
      'question': 'What is the meaning of "lutfan"?',
      'options': ['Please', 'Thank you', 'Sorry', 'Yes'],
      'correctAnswer': 0,
      'explanation': '"Lutfan" (لطفاً) means "Please"',
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
        quizId: 'conversation_level_1',
        quizName: 'Conversation Level 1 Quiz',
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
        title: const Text('Conversation Quiz'),
        backgroundColor: Colors.blue,
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
              color: Colors.blue,
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
                    color: Colors.blue,
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
                      color: Colors.blue,
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
                      // Navigator.popUntil(
                      //   context,
                      //   ModalRoute.withName('/home'),
                      // );
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('Back to Home', style: TextStyle(color: Colors.white),),
                  ),
                ],
              )
            else if (_userAnswers[_currentQuestion] != null)
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
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