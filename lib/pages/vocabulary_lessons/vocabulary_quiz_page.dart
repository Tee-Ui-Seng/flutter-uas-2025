// Part 10
import 'package:flutter/material.dart';
import 'package:flutter_application_uas/services/database_service.dart';

class VocabularyQuizPage extends StatefulWidget {
  const VocabularyQuizPage({super.key});

  @override
  State<VocabularyQuizPage> createState() => _VocabularyQuizPageState();
}

class _VocabularyQuizPageState extends State<VocabularyQuizPage> {
  final DatabaseService _database = DatabaseService();
  int _currentQuestion = 0;
  int _score = 0;
  bool _quizCompleted = false;
  List<int?> _userAnswers = List.filled(10, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the Persian word for "5"?',
      'options': ['panj', 'šaš', 'haft', 'noh'],
      'correctAnswer': 0,
      'explanation': '5 in Persian is "panj" (پنج).',
    },
    {
      'question': 'How do you say "15" in Persian?',
      'options': ['pânjdah', 'panjâh', 'panjdah', 'pânzdah'],
      'correctAnswer': 3,
      'explanation': '15 is "pânzdah" (پانزده) - note the modification from "panj" to "pânz".',
    },
    {
      'question': 'What does "bîst u yak" mean?',
      'options': ['12', '21', '31', '41'],
      'correctAnswer': 1,
      'explanation': '"bîst" means 20, "u" means and, "yak" means 1. So "bîst u yak" = 21.',
    },
    {
      'question': 'How is 5294 formed in Persian?',
      'options': [
        'panj hazâr u du sad u nawad u cahâr',
        'panj hazâr u sad u nawad u cahâr',
        'panj hazâr u du sad u noh u cahâr',
        'panj hazâr u du sad u nawad u se'
      ],
      'correctAnswer': 0,
      'explanation': '5294 = panj hazâr (5000) u du sad (200) u nawad (90) u cahâr (4).',
    },
    {
      'question': 'What is the adverb of place for "here"?',
      'options': ['ânjâ', 'înjâ', 'harjâ', 'jâyî'],
      'correctAnswer': 1,
      'explanation': '"Here" is "înjâ" (اینجا) "this place" in Persian.',
    },
    {
      'question': 'How do you say "tomorrow" in Persian?',
      'options': ['imroz', 'dîroz', 'fardâ', 'aknûn'],
      'correctAnswer': 2,
      'explanation': '"Tomorrow" is "fardâ" (فردا) in Persian.',
    },
    {
      'question': 'What does "hameša" mean?',
      'options': ['never', 'sometimes', 'soon', 'always'],
      'correctAnswer': 3,
      'explanation': '"Hameša" (همیشه) means "always".',
    },
    {
      'question': 'What is the Persian word for "red"?',
      'options': ['sabz', 'zard', 'surx', 'âbî'],
      'correctAnswer': 2,
      'explanation': '"Red" is "surx" (سرخ) in Persian.',
    },
    {
      'question': 'How do you say "father" in Persian?',
      'options': ['mâdar', 'padar', 'barâdar', 'xâhar'],
      'correctAnswer': 1,
      'explanation': '"Father" is "padar" (پدر) in Persian.',
    },
    {
      'question': 'What does "nân" mean in Persian?',
      'options': ['water', 'rice', 'meat', 'bread'],
      'correctAnswer': 3,
      'explanation': '"Nân" (نان) means "bread" in Persian. In Afghanistan, this word is colloquially used to refer to "food".',
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
        quizId: 'vocabulary_level_1',
        quizName: 'Vocabulary Level 1 Quiz',
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
        title: const Text('Vocabulary Quiz'),
        backgroundColor: Colors.amber,
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
              color: Colors.amber,
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
                    color: Colors.amber,
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
                      color: Colors.amber,
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
                      backgroundColor: Colors.amber,
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
                  backgroundColor: Colors.amber,
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