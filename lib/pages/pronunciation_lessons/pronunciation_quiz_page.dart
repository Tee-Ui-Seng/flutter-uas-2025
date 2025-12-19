// Part 4
import 'package:flutter/material.dart';
import 'package:flutter_application_uas/services/database_service.dart';

class PronunciationQuizPage extends StatefulWidget {
  const PronunciationQuizPage({super.key});

  @override
  State<PronunciationQuizPage> createState() => _PronunciationQuizPageState();
}

class _PronunciationQuizPageState extends State<PronunciationQuizPage> {
  final DatabaseService _database = DatabaseService();
  int _currentQuestion = 0;
  int _score = 0;
  bool _quizCompleted = false;
  List<bool?> _userAnswers = List.filled(8, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How is "a" pronounced in Iranian Persian?',
      'options': ['[a]', '[æ]', '[ɑ]', '[e]'],
      'correctAnswer': 1,
      'explanation': 'In Iranian Persian, "a" is pronounced as [æ] (like "cat" in English).',
    },
    {
      'question': 'Which dialect pronounces "w" as [v]?',
      'options': ['Classical Persian only', 'Dari only', 'Iran and Tajik', 'Hazaragi only'],
      'correctAnswer': 2,
      'explanation': 'In Iranian and Tajik Persian, "w" (و) is pronounced as [v].',
    },
    {
      'question': 'What is the IPA for "š" (ش) in Persian?',
      'options': ['[ʃ]', '[ʂ]', '[s]', '[z]'],
      'correctAnswer': 0,
      'explanation': '"š" (ش) is always pronounced as [ʃ] (like "sh" in "shoe").',
    },
    {
      'question': 'How is "â" (long a) pronounced in Dari?',
      'options': ['[æː]', '[ɑː]', '[ɔː]', '[ɒː]'],
      'correctAnswer': 1,
      'explanation': 'In Dari, "â" is pronounced as [ɑː] (like "a" in "father").',
    },
    {
      'question': 'Which consonant is aspirated in initial position?',
      'options': ['[p] only', '[p], [t], [k], [t͡ʃ]', '[b], [d], [g]', 'None are aspirated'],
      'correctAnswer': 1,
      'explanation': '[pʰ], [tʰ], [kʰ], and [t͡ʃʰ] are aspirated in initial position.',
    },
    {
      'question': 'How is "x" (خ) pronounced in Tajik?',
      'options': ['[x]', '[χ]', '[h]', '[k]'],
      'correctAnswer': 1,
      'explanation': 'In Tajik, "x" is pronounced as uvular fricative [χ].',
    },
    {
      'question': 'What is the difference between "o" and "ô" in Hazaragi?',
      'options': [
        'No difference',
        'ô is pronounced [u] when specific conditions are met',
        'o is always [o], ô is always [u]',
        'ô does not exist in Hazaragi'
      ],
      'correctAnswer': 1,
      'explanation': 'ô is pronounced [u] in Hazaragi under specific conditions (see notes).',
    },
    {
      'question': 'How is /h/ pronounced between vowels in most dialects?',
      'options': ['Silent', '[h]', '[ɦ]', '[ʔ]'],
      'correctAnswer': 2,
      'explanation': '/h/ is pronounced as voiced glottal fricative [ɦ] between vowels in most dialects.',
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
        quizId: 'pronunciation_level_1',
        quizName: 'Pronunciation Level 1 Quiz',
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
        title: const Text('Pronunciation Quiz'),
        backgroundColor: Colors.deepPurple,
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
              color: Colors.deepPurple,
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
                    color: Colors.deepPurple,
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
                      color: Colors.deepPurple,
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
                      backgroundColor: Colors.deepPurple,
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
                  backgroundColor: Colors.deepPurple,
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