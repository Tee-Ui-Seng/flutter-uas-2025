// Part 3
import 'package:flutter/material.dart';
import 'polite_phrases_page.dart';

class IntroductionsPage extends StatelessWidget {
  const IntroductionsPage({super.key});

  final List<Map<String, String>> introductions = const [
    {'english': 'My name is ...', 'persian': 'ism man ... ast', 'script': 'اسم من ... است'},
    {'english': 'What is your name?', 'persian': 'ism-e šumâ ci ast?', 'script': 'اسم شما چه است؟'},
    {'english': 'I\'m from ...', 'persian': 'man az ... astam', 'script': 'من از ... استم'},
    {'english': 'Where are you from?', 'persian': 'šumâ az kojâ hasted?', 'script': 'شما از کجا هستید؟'},
    {'english': 'Nice to meet you', 'persian': 'az dîdan-e tân xošhâl astam', 'script': 'از دیدن تان خوشحال استم'},
    {'english': 'Likewise / Me too', 'persian': 'man ham', 'script': 'من هم'},
    {'english': 'What do you do?', 'persian': 'šumâ ci kâr mîkoned?', 'script': 'شما چه کار می‌کنید؟'},
    {'english': 'I am a student', 'persian': 'man dânešju hastam', 'script': 'من دانشجو هستم'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introductions'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Introducing Yourself',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Learn how to introduce yourself and ask about others',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              // Introductions Grid
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: introductions.length,
                itemBuilder: (context, index) {
                  final intro = introductions[index];
                  return Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            intro['english']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            intro['persian']!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            intro['script']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'NotoNastaliqUrdu',
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Sample Conversation
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sample Conversation:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildDialogLine('A:', 'Salâm! ism-e šumâ ci ast?', 'Hello! What is your name?'),
                    _buildDialogLine('B:', 'Salâm! ism man Ahmed ast.', 'Hello! My name is Ahmed.'),
                    _buildDialogLine('A:', 'šumâ az kojâ hasted?', 'Where are you from?'),
                    _buildDialogLine('B:', 'man az Kabul astam.', 'I\'m from Kabul.'),
                    _buildDialogLine('A:', 'az dîdan-e tân xošhâl astam.', 'Nice to meet you.'),
                    _buildDialogLine('B:', 'man ham.', 'Likewise.'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Navigation buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PolitePhrasesPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Next: Polite Phrases'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogLine(String speaker, String persian, String english) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            speaker,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  persian,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  english,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
