// Part 6
import 'package:flutter/material.dart';
import 'conversation_practice_page.dart';

class FarewellsPage extends StatelessWidget {
  const FarewellsPage({super.key});

  final List<Map<String, String>> farewells = const [
    {'english': 'Goodbye', 'persian': 'xudâ hâfiz', 'script': 'خداحافظ', 'usage': 'Most common farewell, "may God be thy protector"'},
    {'english': 'Bye (casual)', 'persian': 'xudâ nigahdâr', 'script': 'خدا نگهدار', 'usage': 'Casual goodbye'},
    {'english': 'See you later', 'persian': 'badan me-bînam-at', 'script': 'بعداً می‌بینمت', 'usage': 'When you’ll see someone again'},
    {'english': 'See you tomorrow', 'persian': 'fardâ me-bînam-at', 'script': 'فردا می‌بینمت', 'usage': 'Meeting tomorrow'},
    {'english': 'Take care', 'persian': 'muvâzib-itân bâšed', 'script': 'مواظب تان باشید', 'usage': 'Wishing someone well'},
    {'english': 'Have a good one', 'persian': 'ba xair bâšed', 'script': 'به خیر باشید', 'usage': 'General well-wishing'},
    {'english': 'Until next time', 'persian': 'tâ bad', 'script': 'تا بعد', 'usage': 'Farewell until next meeting'},
    {'english': 'I have to go', 'persian': 'bâyad biravam', 'script': 'باید بروم', 'usage': 'Announcing departure'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farewells'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // ★★★ EVERYTHING scrolls together! ★★★
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Saying Goodbye in Persian',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn different ways to say goodbye in Persian',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // ★★★ Farewells Grid — NOT scrollable anymore ★★★
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: farewells.map((farewell) {
                return Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          farewell['english']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          farewell['persian']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          farewell['script']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'NotoNastaliqUrdu',
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            farewell['usage']!,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // ★★★ Conversation Example — INSIDE same scroll view ★★★
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
                        'Conversation Example',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  _buildDialogLine(
                    'A:',
                    'Salâm! ci xabar?',
                    'سلام! چی خبر؟',
                    'Hello! What’s up?',
                  ),
                  _buildDialogLine(
                    'B:',
                    'Salâm! xabarî nest.',
                    'سلام! خبری نیست.',
                    'Hello! Nothing much.',
                  ),
                  _buildDialogLine(
                    'A:',
                    'bâyad biravam.',
                    'باید بروم.',
                    'I have to go.',
                  ),
                  _buildDialogLine(
                    'B:',
                    'xub, ba’dan me-bînam-at.',
                    'خوب، بعدا می‌بینمت.',
                    'Okay, see you later.',
                  ),
                  _buildDialogLine(
                    'A:',
                    'xudâ hâfiz!',
                    'خداحافظ!',
                    'Goodbye!',
                  ),
                  _buildDialogLine(
                    'B:',
                    'xudâ hâfiz!',
                    'خداحافظ!',
                    'Goodbye!',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

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
                      MaterialPageRoute(builder: (context) => const ConversationPracticePage()),
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
                        'Next: Practice',
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
