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
  List<int?> _userAnswers = List.filled(10, null);

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
      'question': 'Which suffix is used for jobs or titles?',
      'options': ['-hâ', '-ân', '-ât', '-in'],
      'correctAnswer': 1,
      'explanation': 'Jobs or titles often use "-ân" suffix.',
    },
    {
      'question': 'How do you pluralize "paranda" (bird)?',
      'options': ['parandâ-hâ', 'parandân', 'parandât', 'parandagân'],
      'correctAnswer': 3,
      'explanation': 'The plural of "Paranda" is "parandagân" which is irregular.',
    },
    {
      'question': 'What is the plural of "gošt" (meat)?',
      'options': ['gošt-hâ', 'goštân', 'goštât', 'gošt'],
      'correctAnswer': 0,
      'explanation': 'Use "-hâ" for most inanimate objects like meats.',
    },
    {
      'question': 'How do you say "peoples" in Persian?',
      'options': ['mardum-hâ', 'mardumân', 'mardumât', 'mardumyân'],
      'correctAnswer': 1,
      'explanation': 'Use "-ân" for animate beings like students.',
    },
    {
      'question': 'What is the correct plural of "masjid" (mosque)?',
      'options': ['masjid-hâ', 'masjidân', 'masjidât', 'masâjid'],
      'correctAnswer': 3,
      'explanation': 'The plural for "masjid" is irregular.',
    },
    {
      'question': 'How do you say "fruits" in Persian?',
      'options': ['meva-hâ', 'mevân', 'mevât', 'mevajân'],
      'correctAnswer': 3,
      'explanation': 'The word "meva" uses "-jân" for collective plural.',
    },
    {
      'question': 'How do you pluralize "hayvân" (animal)?',
      'options': ['hayvân-hâ', 'hayvânân', 'hayvânât', 'hayvân'],
      'correctAnswer': 2,
      'explanation': '"Hayvân" uses "-ât" suffix.',
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
                  final selectedIndex = _userAnswers[_currentQuestion];
                  final hasAnswered = selectedIndex != null;

                  final isUserSelection = index == selectedIndex;
                  final isCorrectAnswer = index == question['correctAnswer'];  
                  
                  Color backgroundColor = Colors.white;
                  Color borderColor = Colors.grey[300]!;
                  Color textColor = Colors.black;

                  if (hasAnswered) {
                    if (isCorrectAnswer) {
                      // Always highlight correct answer
                      backgroundColor = Colors.green.shade50;
                      borderColor = Colors.green;
                      textColor = Colors.green.shade800;
                    }

                    if (isUserSelection && !isCorrectAnswer) {
                      // Highlight user's wrong choice
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
                          
                          if (hasAnswered && isCorrectAnswer)
                            const Icon(Icons.check_circle, color: Colors.green),

                          if (hasAnswered && isUserSelection && !isCorrectAnswer)
                            const Icon(Icons.cancel, color: Colors.red),
                        ],
                      ),
                    ),
                  );
                  
                  // return Card(
                  //   color: backgroundColor,
                  //   shape: RoundedRectangleBorder(
                  //     side: BorderSide(color: borderColor, width: 1),
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  //   child: ListTile(
                  //     title: Text(question['options'][index]),
                  //     onTap: () {
                  //       if (_userAnswers[_currentQuestion] == null) {
                  //         _submitAnswer(index);
                  //       }
                  //     },
                  //     trailing: isSelected
                  //         ? Icon(
                  //             isCorrect ? Icons.check : Icons.close,
                  //             color: isCorrect ? Colors.green : Colors.red,
                  //           )
                  //         : null,
                  //   ),
                  // );
                },
              ),
            ),
            
            // Explanation (if answered)
            if (_userAnswers[_currentQuestion] != null)
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