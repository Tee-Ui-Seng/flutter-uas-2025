// Part 5
import 'package:flutter/material.dart';
import 'prepositions_page.dart';

class ConjunctionsPage extends StatelessWidget {
  const ConjunctionsPage({super.key});

  final List<Map<String, dynamic>> conjunctions = const [
    {
      'persian': 'و',
      'pronunciation': 'va',
      'english': 'and',
      'example': 'man va tu',
      'script': 'من و تو',
      'meaning': 'I and you',
    },
    {
      'persian': 'یا',
      'pronunciation': 'yâ',
      'english': 'or',
      'example': 'seb yâ mâlta',
      'script': 'سیب یا مالته',
      'meaning': 'apple or orange',
    },
    {
      'persian': 'اما',
      'pronunciation': 'amâ',
      'english': 'but',
      'example': 'man me-xâham, amâ na me-tavânam',
      'script': 'من می‌خواهم، اما نمی‌توانم',
      'meaning': 'I want, but I cannot',
    },
    {
      'persian': 'چونکه / زیرا',
      'pronunciation': 'zerâ / čûnki',
      'english': 'because',
      'example': 'na me-ravam čunki bemâram',
      'script': 'نمی‌روم چونکه بیمارم',
      'meaning': 'I am not going because I am sick',
    },
    {
      'persian': 'اگر',
      'pronunciation': 'agar',
      'english': 'if',
      'example': 'agar mexâhî, biraw!',
      'script': '!اگر میخواهی برو',
      'meaning': 'If you want, go!',
    },
    {
      'persian': 'پس',
      'pronunciation': 'pas',
      'english': 'so / then',
      'example': 'bârân me-bârad, pas mâ dar xâna me-mânem',
      'script': 'باران می‌بارد، پس ما در خانه می‌مانیم',
      'meaning': 'It is raining, so we stay at home',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Conjunctions'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Persian Conjunctions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn how to connect ideas and sentences in Persian.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('Common Conjunctions'),

            // LIST OF CONJUNCTIONS
            ...conjunctions.map((cj) => _buildConjunctionCard(cj)),

            const SizedBox(height: 24),

            // USAGE TIPS
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
                    '• Conjunctions usually come between the words or clauses they connect.\n'
                    '• "و" (va) can connect nouns, verbs, or entire sentences.\n'
                    '• "اگر" (agar) is often used at the beginning of conditional sentences.\n'
                    '• "چونکه" and "زیرا" are interchangeable for "because".',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // EXAMPLE CONVERSATION
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
                        'Example Conversation',
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
                    'me-xâhî biravî sînemâ?',
                    'می‌خواهی بروی سینما؟',
                    'Do you want to go to cinema?',
                  ),
                  _buildDialogLine(
                    'B:',
                    'me-xâham, amâ na me-tavânam',
                    'می‌خواهم، اما نمی‌توانم',
                    'I want, but I cannot',
                  ),
                  _buildDialogLine(
                    'A:',
                    'čarâ?',
                    'چرا؟',
                    'Why?',
                  ),
                  _buildDialogLine(
                    'B:',
                    'čûnki kâr dâram',
                    'چونکه کار دارم',
                    'Because I have work',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // NAV BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrepositionsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Next: Prepositions',
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
    );
  }

  // SECTION TITLE
  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.red,
        ),
      ),
    );
  }

  // CONJUNCTION CARD
  Widget _buildConjunctionCard(Map<String, dynamic> cj) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  cj['persian'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'NotoNastaliqUrdu',
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // default for English word
                      ),
                      children: [
                        // const TextSpan(text: '  '),

                        // pronunciation in red
                        TextSpan(
                          text: '(${cj['pronunciation']})',
                          style: const TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
                        ),

                        const TextSpan(text: '  '),
                        TextSpan(text: cj['english']),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cj['script'],
                    style: const TextStyle(
                      fontFamily: 'NotoNastaliqUrdu',
                      fontSize: 18,
                    ),
                    textDirection: TextDirection.rtl,
                  ),

                  Text(
                    '(${cj['example']})',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.red,
                    ),
                  ),
                  
                  const SizedBox(height: 4),

                  Text('Meaning: ${cj['meaning']}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // DIALOG LINES
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
