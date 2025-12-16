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
  List<bool?> _userAnswers = List.filled(8, null);

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
      'options': ['man astam', 'man hastam', 'man hast', 'man ast'],
      'correctAnswer': 0,
      'explanation': 'The correct form is "man astam" using the "astan" form.',
    },
    {
      'question': 'How do you form the negative of "astam"?',
      'options': ['Replace "a-" with "nî-"', 'Add "na-" at the beginning', 'Add "nî-" at the end', 'Remove "a-"'],
      'correctAnswer': 0,
      'explanation': 'To form negative, replace the beginning "a-" with "nî-": astam → nîstam.',
    },
    {
      'question': 'What does "va" mean in Persian?',
      'options': ['and', 'but', 'or', 'because'],
      'correctAnswer': 0,
      'explanation': '"Va" (و) means "and" and connects words or sentences.',
    },
    {
      'question': 'Which conjunction means "because" in Persian?',
      'options': ['agar', 'ammâ', 'čunke', 'pas'],
      'correctAnswer': 2,
      'explanation': '"Čunke" (چونکه) or "zirâ" (زیرا) both mean "because".',
    },
    {
      'question': 'What does the preposition "dar" mean?',
      'options': ['with', 'in/at', 'from', 'to'],
      'correctAnswer': 1,
      'explanation': '"Dar" (در) can mean both "in" and "at" depending on context.',
    },
    {
      'question': 'How do you say "with friend" in Persian?',
      'options': ['dar dust', 'bâ dust', 'az dust', 'be dust'],
      'correctAnswer': 1,
      'explanation': '"Bâ" (با) means "with", so "bâ dust" means "with friend".',
    },
    {
      'question': 'What is the colloquial form of "šumâ asted"?',
      'options': ['šumâ asten', 'šumâ astî', 'šumâ ast', 'šumâ astem'],
      'correctAnswer': 0,
      'explanation': 'Colloquially, people say "šumâ asten" instead of "šumâ asted".',
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grammar Quiz'),
        backgroundColor: Colors.red,
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
                    child: const Text('Back to Home'),
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}