// Part 3
import 'package:flutter/material.dart';
import 'polite_phrases_page.dart';

class IntroductionsPage extends StatelessWidget {
  const IntroductionsPage({super.key});

  final List<Map<String, String>> introductions = const [
    {'english': 'My name is ...', 'persian': 'nâm man ... ast', 'script': 'نام من ... است'},
    {'english': 'What is your name?', 'persian': 'nâm-i šumâ ci ast?', 'script': 'نام شما چه است؟'},
    {'english': 'I’m from ...', 'persian': 'man az ... astam', 'script': 'من از ... استم'},
    {'english': 'Where are you from?', 'persian': 'šumâ az kujâ asted?', 'script': 'شما از کجا استید؟'},
    {'english': 'Nice to meet you', 'persian': 'az dîdan-i-tân xušhâl astam', 'script': 'از دیدن تان خوشحال استم'},
    {'english': 'Likewise / Me too', 'persian': 'man ham', 'script': 'من هم'},
    {'english': 'What do you do?', 'persian': 'šumâ ci kâr me-kuned?', 'script': 'شما چه کار می‌کنید؟'},
    {'english': 'I am a student', 'persian': 'man dânišjû astam', 'script': 'من دانشجو استم'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introductions'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
                  childAspectRatio: 1,
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
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            intro['script']!,
                            style: const TextStyle(
                              fontSize: 20,
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

              const SizedBox(height: 16),

              // NOTE SECTION
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.tips_and_updates, color: Colors.amber, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Usage Tips',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '• In Iran, the word for "name" is "ism" (اسم) instead of "nâm" (نام).\n'
                      '• The word "ci ast" (چه است) may be shortened into "cîst" (چیست).',
                      style: const TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Sample Conversation
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.message, color: Colors.green, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Sample Conversation',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                      _buildDialogLine('A:', 'Salâm! nâm-i šumâ cîst?', 'سلام! نام شما چیست؟', 'Hello! What is your name?'),
                      _buildDialogLine('B:', 'Salâm! nâm-i man Ahmad ast.', 'سلام! نام من احمد است.', 'Hello! My name is Ahmad.'),
                      _buildDialogLine('A:', 'šumâ az kujâ asted?', 'شما از کجا استید؟', 'Where are you from?'),
                      _buildDialogLine('B:', 'man az Kâbul astam.', 'من از کابل استم.', 'I’m from Kabul.'),
                      _buildDialogLine('A:', 'az dîdan-i-tân xušhâl astam.', 'از دیدن تان خوشحال استم.', 'Nice to meet you.'),
                      _buildDialogLine('B:', 'man ham.', 'من هم.', 'Likewise.'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Navigation buttons
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
                        MaterialPageRoute(builder: (context) => const PolitePhrasesPage()),
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
                          'Next: Polite Phrases',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogLine(
    String speaker,
    String persian,
    String script,
    String english,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: Text(
              speaker,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nastaliq
                Text(
                  script,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'NotoNastaliqUrdu',
                  ),
                  textDirection: TextDirection.rtl,
                ),

                // Romanization
                Text(
                  persian,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    height: 1.3,
                  ),
                ),

                // English
                Text(
                  english,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
