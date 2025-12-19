import 'package:flutter/material.dart';
import 'package:flutter_application_uas/services/database_service.dart';
import 'ra_usage_page.dart';

class PronounPluralQuizPage extends StatefulWidget {
  const PronounPluralQuizPage({super.key});

  @override
  State<PronounPluralQuizPage> createState() => _PronounPluralQuizPageState();
}

class _PronounPluralQuizPageState extends State<PronounPluralQuizPage> {
  final DatabaseService _database = DatabaseService();
  int _currentQuestion = 0;
  int _score = 0;
  bool _quizCompleted = false;
  List<int?> _userAnswers = List.filled(5, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the plural of "kitâb" (book)?',
      'options': ['kitâb-hâ', 'kitâbân', 'kitâbât', 'kitâb'],
      'correctAnswer': 0,
      'explanation': 'Use "-hâ" for most inanimate objects like books.',
    },
    {
      'question': 'How do you say "mothers" in Persian?',
      'options': ['mâdar-hâ', 'mâdarân', 'mâdarât', 'mâdaryân'],
      'correctAnswer': 1,
      'explanation': 'Use "-ân" for animate beings like students.',
    },
    {
      'question': 'What is the correct plural of "daraxt" (tree)?',
      'options': ['daraxt-hâ', 'daraxtân', 'daraxtât', 'daraxt'],
      'correctAnswer': 1,
      'explanation': 'Use "-ân" for some animate beings like trees.',
    },
    {
      'question': 'Which suffix is used for Arabic loanwords?',
      'options': ['-hâ', '-ân', '-ât', '-in'],
      'correctAnswer': 2,
      'explanation': 'Arabic loanwords often use "-ât" suffix.',
    },
    {
      'question': 'How do you pluralize "zan" (woman)?',
      'options': ['zanhâ', 'zanân', 'zanât', 'zanin'],
      'correctAnswer': 1,
      'explanation': '"Zan" uses "-ân" suffix.',
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
        quizId: 'noun_pluralization',
        quizName: 'Noun Pluralization Quiz',
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
        title: const Text('Pluralization Quiz'),
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
                  final isSelected = _userAnswers[_currentQuestion] != null &&
                      index == _getSelectedIndex();
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
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.teal),
                ),
                child: Text(
                  question['explanation'],
                  style: const TextStyle(fontSize: 14),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RaUsagePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text(
                      'Next: Using "râ"',
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

  int? _getSelectedIndex() => _userAnswers[_currentQuestion];
}