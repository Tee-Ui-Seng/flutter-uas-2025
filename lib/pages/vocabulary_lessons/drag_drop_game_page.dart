// Part 6
import 'package:flutter/material.dart';
import 'adverbs_place_page.dart';
import 'package:flutter_application_uas/services/database_service.dart';

class DragDropGamePage extends StatefulWidget {
  const DragDropGamePage({super.key});

  @override
  State<DragDropGamePage> createState() => _DragDropGamePageState();
}

class _DragDropGamePageState extends State<DragDropGamePage> {
  final DatabaseService _database = DatabaseService();
  int currentLevel = 1;
  int score = 0;
  bool levelCompleted = false;
  bool gameCompleted = false;
  Map<String, Map<String, dynamic>> levelData = {};
  Map<String, String?> currentMatches = {};
  List<String> currentDistractors = [];
  
  final Map<int, Map<String, dynamic>> levels = {
    1: {
      'title': 'Level 1: Easy',
      'description': 'Match basic numbers (1-99)',
      'numbers': [
        {'digit': '34', 'persian': 'sî u cahâr'},
        {'digit': '67', 'persian': 'šast u haft'},
        {'digit': '12', 'persian': 'davâzdah'},
        {'digit': '89', 'persian': 'haštâd u noh'},
      ],
      'distractors': [
        'panjâh u se',
        'hastâd u yek',
        'sad u bist',
        'nohâd u noh',
      ],
    },
    2: {
      'title': 'Level 2: Medium',
      'description': 'Match numbers (100-999)',
      'numbers': [
        {'digit': '127', 'persian': 'sad u bîst u haft'},
        {'digit': '509', 'persian': 'panj sad u noh'},
        {'digit': '350', 'persian': 'sî sad u panjâh'},
        {'digit': '888', 'persian': 'hašt sad u haštâd u hašt'},
      ],
      'distractors': [
        'do sad u panjâh u yek',
        'haft sad u nawad',
        'noh sad u bist u panj',
        'sî sad u bist',
      ],
    },
    3: {
      'title': 'Level 3: Hard',
      'description': 'Match numbers (1000+)',
      'numbers': [
        {'digit': '2168', 'persian': 'du hazâr u sad u šast u hašt'},
        {'digit': '5000', 'persian': 'panj hazâr'},
        {'digit': '1234', 'persian': 'yek hazâr u do sad u sî u cahâr'},
        {'digit': '7890', 'persian': 'haft hazâr u hašt sad u nawad'},
      ],
      'distractors': [
        'panj hazâr u sad u bist',
        'haft hazâr u panj sad',
        'yek hazâr u noh sad',
        'do hazâr u hašt sad u hašt',
      ],
    },
  };

  @override
  void initState() {
    super.initState();
    _loadLevel(currentLevel);
  }

  void _loadLevel(int level) {
    final levelInfo = levels[level]!;
    
    setState(() {
      currentLevel = level;
      levelCompleted = false;
      
      // Initialize matches as empty
      currentMatches.clear();
      for (var number in levelInfo['numbers'] as List<dynamic>) {
        currentMatches[number['digit']] = null;
      }
      
      // Prepare distractors (wrong answers)
      currentDistractors = List<String>.from(levelInfo['distractors']);
      
      // Randomize the order of options
      currentDistractors.shuffle();
    });
  }

  void _checkMatch(String digit, String persian) {
    setState(() {
      // Check if this is the correct match
      final levelInfo = levels[currentLevel]!;
      final numbers = levelInfo['numbers'] as List<dynamic>;
      
      bool isCorrect = false;
      for (var number in numbers) {
        if (number['digit'] == digit && number['persian'] == persian) {
          isCorrect = true;
          break;
        }
      }
      
      if (isCorrect) {
        // Accept the match
        currentMatches[digit] = persian;
        score++;
        
        // Check if level is completed
        bool allMatched = currentMatches.values.every((value) => value != null);
        if (allMatched) {
          levelCompleted = true;
        }
      } else {
        // Wrong match - don't accept it
        // The draggable will return to its original position automatically
      }
    });
  }

  void _nextLevel() async {
    if (currentLevel < 3) {
      _loadLevel(currentLevel + 1);
    } else {
      // Game completed
      setState(() {
        gameCompleted = true;
      });
      
      // Save game result to Firebase
      try {
        await _database.saveQuizResult(
          quizId: 'number_game',
          quizName: 'Number Matching Game',
          score: score,
          maxScore: _getTotalNumbers(),
          answers: _getGameAnswers(),
        );
      } catch (e) {
        print('Error saving game result: $e');
      }
    }
  }

  void _resetLevel() {
    _loadLevel(currentLevel);
    score = 0;
  }

  void _resetGame() {
    setState(() {
      currentLevel = 1;
      score = 0;
      levelCompleted = false;
      gameCompleted = false;
    });
    _loadLevel(1);
  }

  int _getTotalNumbers() {
    int total = 0;
    for (var level in levels.values) {
      total += (level['numbers'] as List).length;
    }
    return total;
  }

  Map<String, bool> _getGameAnswers() {
    final Map<String, bool> answers = {};
    // For simplicity, we'll just record overall completion
    for (int i = 1; i <= 3; i++) {
      answers['level$i'] = i <= currentLevel;
    }
    return answers;
  }

  @override
  Widget build(BuildContext context) {
    final levelInfo = levels[currentLevel]!;
    final numbers = levelInfo['numbers'] as List<dynamic>;
    final allOptions = [
      ...numbers.map((n) => n['persian'] as String),
      ...currentDistractors,
    ]..shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Matching Game'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showInstructions,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Level indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      levelInfo['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      levelInfo['description'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.amber),
                  ),
                  child: Text(
                    'Level $currentLevel/3',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade800,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Score and Progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Score: $score',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                if (levelCompleted)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.check_circle, size: 16, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          'Level Completed!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Game Instructions
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info, color: Colors.blue, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Drag Persian words onto the correct Arabic numerals. Wrong answers will return to their position.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Game Area
            Expanded(
              child: Row(
                children: [
                  // Left column - Arabic numerals
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Arabic Numerals',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: ListView.builder(
                            itemCount: numbers.length,
                            itemBuilder: (context, index) {
                              final number = numbers[index];
                              final isMatched = currentMatches[number['digit']] != null;
                              
                              return DragTarget<String>(
                                builder: (context, candidateData, rejectedData) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: isMatched ? Colors.green.shade100 : Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: isMatched ? Colors.green : Colors.blue,
                                        width: 2,
                                      ),
                                      boxShadow: candidateData != null
                                          ? [
                                              BoxShadow(
                                                color: Colors.blue.withValues(alpha: 0.3),
                                                blurRadius: 8,
                                                spreadRadius: 2,
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        number['digit']!,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: isMatched ? Colors.green.shade800 : Colors.blue.shade800,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                onWillAccept: (data) {
                                  // Allow any draggable to be dropped
                                  return true;
                                },
                                onAccept: (data) {
                                  _checkMatch(number['digit']!, data);
                                },
                                onLeave: (data) {
                                  // Called when a draggable is dragged away
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Right column - Persian options
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Persian Words',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: ListView.builder(
                            itemCount: allOptions.length,
                            itemBuilder: (context, index) {
                              final option = allOptions[index];
                              final isUsed = currentMatches.values.contains(option);
                              
                              return LongPressDraggable<String>(
                                data: option,
                                feedback: Material(
                                  elevation: 6,
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    width: 200,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.amber.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.amber, width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 8,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                childWhenDragging: Opacity(
                                  opacity: 0.5,
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                      child: Text(
                                        option,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: isUsed ? Colors.green.shade100 : Colors.amber.shade100,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isUsed ? Colors.green : Colors.amber,
                                      width: isUsed ? 2 : 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      option,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isUsed ? Colors.green.shade800 : Colors.black,
                                        fontStyle: isUsed ? FontStyle.italic : FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Game Controls
            const SizedBox(height: 24),
            
            if (gameCompleted)
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '🎉 Game Completed! 🎉',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Final Score: $score/${_getTotalNumbers()}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Your score has been saved!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            
            if (levelCompleted && !gameCompleted)
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Level Completed!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'You matched ${numbers.length} numbers correctly!',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _resetLevel,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset Level'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                
                if (levelCompleted && !gameCompleted)
                  ElevatedButton.icon(
                    onPressed: _nextLevel,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Next Level'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  )
                else if (gameCompleted)
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdverbsPlacePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  )
                else
                  Container(), // Empty container to maintain layout
                
                // Level selector
                PopupMenuButton<int>(
                  icon: const Icon(Icons.stacked_bar_chart),
                  onSelected: (level) {
                    if (!gameCompleted) {
                      _loadLevel(level);
                      // Reset score when switching levels manually
                      score = 0;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: currentLevel >= 1 ? Colors.green : Colors.grey,
                            size: 12,
                          ),
                          const SizedBox(width: 8),
                          const Text('Level 1: Easy'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: currentLevel >= 2 ? Colors.green : Colors.grey,
                            size: 12,
                          ),
                          const SizedBox(width: 8),
                          const Text('Level 2: Medium'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: currentLevel >= 3 ? Colors.green : Colors.grey,
                            size: 12,
                          ),
                          const SizedBox(width: 8),
                          const Text('Level 3: Hard'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // Progress indicator
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: currentLevel / 3,
                    backgroundColor: Colors.grey.shade200,
                    color: Colors.amber,
                    minHeight: 8,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$currentLevel/3',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  void _showInstructions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Game Instructions'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'How to Play:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('1. There are 3 levels of increasing difficulty'),
              const Text('2. Drag Persian words onto matching Arabic numerals'),
              const Text('3. Wrong matches will return to their position'),
              const Text('4. Complete all numbers to finish a level'),
              const Text('5. Score points for correct matches'),
              const SizedBox(height: 16),
              const Text(
                'Difficulty Levels:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('• Level 1: Basic numbers (1-99)'),
              const Text('• Level 2: Hundreds (100-999)'),
              const Text('• Level 3: Thousands (1000+)'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber),
                ),
                child: const Text(
                  'Tip: Long press on Persian words to drag them!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}