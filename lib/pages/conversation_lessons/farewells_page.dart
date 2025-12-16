// Part 6
import 'package:flutter/material.dart';
import 'conversation_practice_page.dart';

class FarewellsPage extends StatelessWidget {
  const FarewellsPage({super.key});

  final List<Map<String, String>> farewells = const [
    {'english': 'Goodbye', 'persian': 'xodâ hâfez', 'script': 'خدا حافظ', 'usage': 'Most common farewell'},
    {'english': 'Bye (casual)', 'persian': 'xodâ negahdâr', 'script': 'خدا نگهدار', 'usage': 'Casual goodbye'},
    {'english': 'See you later', 'persian': 'badan mîbînamet', 'script': 'بعداً می‌بینمت', 'usage': 'When you\'ll see someone again'},
    {'english': 'See you tomorrow', 'persian': 'fardâ mîbînamet', 'script': 'فردا می‌بینمت', 'usage': 'Meeting tomorrow'},
    {'english': 'Take care', 'persian': 'xodetûn râ negah dârîn', 'script': 'خودتون را نگه دارید', 'usage': 'Wishing someone well'},
    {'english': 'Have a good one', 'persian': 'be xêr bâšîn', 'script': 'به خیر باشید', 'usage': 'General well-wishing'},
    {'english': 'Until next time', 'persian': 'tâ badî', 'script': 'تا بعدی', 'usage': 'Farewell until next meeting'},
    {'english': 'I have to go', 'persian': 'bâyad beravam', 'script': 'باید بروم', 'usage': 'Announcing departure'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farewells'),
        backgroundColor: Colors.blue,
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
              childAspectRatio: 1.4,
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
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          farewell['persian']!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          farewell['script']!,
                          style: const TextStyle(
                            fontSize: 16,
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
                  const Text(
                    'Complete Conversation Example:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),

                  _buildConversationLine('A:', 'Salâm! ci xabar?', 'Hello! What\'s up?'),
                  _buildConversationLine('B:', 'Salâm! xabarî nîst.', 'Hello! Nothing much.'),
                  _buildConversationLine('A:', 'bâyad beravam.', 'I have to go.'),
                  _buildConversationLine('B:', 'xub, ba\'dan mîbînamet.', 'Okay, see you later.'),
                  _buildConversationLine('A:', 'xodâ hâfez!', 'Goodbye!'),
                  _buildConversationLine('B:', 'xodâ hâfez!', 'Goodbye!'),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Navigation buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ConversationPracticePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Next: Practice'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConversationLine(String speaker, String persian, String english) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
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
                Text(persian, style: const TextStyle(fontStyle: FontStyle.italic)),
                Text(
                  english,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
