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
  List<bool?> _userAnswers = List.filled(10, null);

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
      'question': 'What does "az dîdan-i-tân xušhâl astam" mean?',
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
      'options': ['Lutfan', 'Qâbil nîst', 'Bale', 'Xub'],
      'correctAnswer': 1,
      'explanation': 'The response to "Thank you" is "Qâbil nîst" (قابل نیست) meaning "You\'re welcome"',
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
      _userAnswers[_currentQuestion] = selectedIndex == 
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversation Quiz'),
        backgroundColor: Colors.blue,
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
                  final isSelected = _userAnswers[_currentQuestion] != null;
                  final isCorrect = index == question['correctAnswer'];
                  
                  Color backgroundColor = Colors.transparent;
                  Color borderColor = Colors.grey;
                  
                  if (isSelected) {
                    backgroundColor = isCorrect ? Colors.green.shade50 : Colors.red.shade50;
                    borderColor = isCorrect ? Colors.green : Colors.red;
                  }
                  
                  return Card(
                    color: backgroundColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: borderColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(question['options'][index]),
                      onTap: () {
                        if (_userAnswers[_currentQuestion] == null) {
                          _submitAnswer(index);
                        }
                      },
                      trailing: isSelected
                          ? Icon(
                              isCorrect ? Icons.check : Icons.close,
                              color: isCorrect ? Colors.green : Colors.red,
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
            
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
                    child: const Text('Back to Home'),
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}