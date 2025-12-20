// Part 7 (UPDATED)
import 'package:flutter/material.dart';
import 'conversation_quiz_page.dart';

class ConversationPracticePage extends StatefulWidget {
  const ConversationPracticePage({super.key});

  @override
  State<ConversationPracticePage> createState() => _ConversationPracticePageState();
}

class _ConversationPracticePageState extends State<ConversationPracticePage> {
  int _currentScenario = 0;

  final List<Map<String, dynamic>> _scenarios = [
    {
      'title': 'Meeting Someone New',
      'description': 'You meet someone for the first time at a party',
      'lines': [
        {'role': 'You', 'text': 'Salâm!', 'english': 'Hello!'},
        {'role': 'Friend', 'text': 'Salâm!', 'english': 'Hello!'},
        {'role': 'You', 'text': 'nâm-i šumâ ci ast?', 'english': 'What is your name?'},
        {'role': 'Friend', 'text': 'nâm man Sara ast.', 'english': 'My name is Sara.'},
        {'role': 'You', 'text': 'az dîdan-i-tân xušhâl astam.', 'english': 'Nice to meet you.'},
      ]
    },
    {
      'title': 'Morning at Work',
      'description': 'Greeting your colleague in the morning',
      'lines': [
        {'role': 'You', 'text': 'subh baxair!', 'english': 'Good morning!'},
        {'role': 'Colleague', 'text': 'subh baxair!', 'english': 'Good morning!'},
        {'role': 'You', 'text': 'ci xabar?', 'english': 'How are you?'},
        {'role': 'Colleague', 'text': 'xub astam, tašakur.', 'english': 'I’m good, thank you.'},
        {'role': 'Colleague', 'text': 'šumâ ci tawr asted?', 'english': 'How about you?'},
        {'role': 'You', 'text': 'man ham xub astam.', 'english': 'I’m also good.'},
      ]
    },
    {
      'title': 'Asking for Help',
      'description': 'You need directions and need to be polite',
      'lines': [
        {'role': 'You', 'text': 'me-baxšen!', 'english': 'Excuse me!'},
        {'role': 'Stranger', 'text': 'bale?', 'english': 'Yes?'},
        {'role': 'You', 'text': 'lutfan, mi-toned kumak-am kuned?', 'english': 'Please, can you help me?'},
        {'role': 'Stranger', 'text': 'bale, ci me-xâhî?', 'english': 'Yes, what do you need?'},
        {'role': 'You', 'text': 'me-xâham ba dukân bîravam.', 'english': 'I want to go to the shop.'},
        {'role': 'Stranger', 'text': 'ânjâ ast.', 'english': 'It’s there.'},
        {'role': 'You', 'text': 'bisyâr tašakur!', 'english': 'Thank you very much!'},
        {'role': 'Stranger', 'text': 'qâbil-î na dârad.', 'english': 'You’re welcome.'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    final scenario = _scenarios[_currentScenario];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Conversations'),
        backgroundColor: Colors.blue,
      ),

      // 🔥 EVERYTHING scrolls together now
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Title
            Text(
              scenario['title']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              scenario['description']!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Scenario Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _currentScenario > 0
                      ? () => setState(() => _currentScenario--)
                      : null,
                ),
                Text(
                  'Scenario ${_currentScenario + 1}/${_scenarios.length}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _currentScenario < _scenarios.length - 1
                      ? () => setState(() => _currentScenario++)
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 🔵 Conversation bubble list (NO Expanded here)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: (scenario['lines'] as List).map((line) {
                    final isYou = line['role'] == 'You';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isYou) const Spacer(),
                          _buildBubble(line, isYou),
                          if (isYou) const Spacer(),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 🔥 Practice box MOVED INSIDE scroll
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange),
              ),
              child: Column(
                children: [
                  const Text(
                    'Practice Your Own Response:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Try to create your own response for the next line.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Write your Persian response here...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ConversationQuizPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Take Quiz',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.quiz, size: 16, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Conversation bubble builder
  Widget _buildBubble(Map line, bool isYou) {
    return Column(
      crossAxisAlignment:
          isYou ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isYou ? Colors.blue.shade100 : Colors.green.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment:
                isYou ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(line['text'], style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Text(
                line['english'],
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          line['role'],
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isYou ? Colors.blue : Colors.green,
          ),
        ),
      ],
    );
  }
}
