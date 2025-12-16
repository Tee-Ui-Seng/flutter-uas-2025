// Part 6 — UPDATED
import 'package:flutter/material.dart';
import 'grammar_quiz_page.dart';

class PrepositionsPage extends StatelessWidget {
  const PrepositionsPage({super.key});

  static const List<Map<String, String>> prepositions = [
    {
      'persian': 'در',
      'pronunciation': 'dar',
      'english': 'in/at',
      'example': 'dar xâna',
      'meaning': 'at home',
    },
    {
      'persian': 'با',
      'pronunciation': 'bâ',
      'english': 'with',
      'example': 'bâ dost',
      'meaning': 'with friend',
    },
    {
      'persian': 'از',
      'pronunciation': 'az',
      'english': 'from',
      'example': 'az tehrân',
      'meaning': 'from Tehran',
    },
    {
      'persian': 'به',
      'pronunciation': 'ba',
      'english': 'to',
      'example': 'be madrasaeh',
      'meaning': 'to school',
    },
    {
      'persian': 'برای',
      'pronunciation': 'barâyi',
      'english': 'for',
      'example': 'barâyi tu',
      'meaning': 'for you',
    },
    {
      'persian': 'روی',
      'pronunciation': 'royi',
      'english': 'on',
      'example': 'royi mez',
      'meaning': 'on the table',
    },
    {
      'persian': 'زیر',
      'pronunciation': 'zer',
      'english': 'under',
      'example': 'zer mez',
      'meaning': 'under the table',
    },
    {
      'persian': 'کنار',
      'pronunciation': 'kanâr',
      'english': 'next to',
      'example': 'kanâr daraxt',
      'meaning': 'next to the tree',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Prepositions'),
        backgroundColor: Colors.red,
      ),

      // Everything scrolls together
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TITLE
            const Text(
              'Persian Prepositions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Learn essential prepositions and their usage in Persian.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            // LIST OF PREPOSITION CARDS (using Conjunction styling)
            ...prepositions.map((prep) => _buildPrepositionCard(prep)),

            const SizedBox(height: 24),

            // USAGE TIPS (unchanged)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Usage Tips:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '• Prepositions usually come before the noun they modify\n'
                    '• barâye + man = barâye man (for me)\n'
                    '• "در" can mean "in" or "at"\n'
                    '• "از" is used for origin, material, or cause',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // EXAMPLE SENTENCES
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
                    'Example Sentences:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildSentence('man dar kâr xâna astam', 'I am at the office'),
                  _buildSentence('o bâ padaraš me-ravad', 'He is going with his father'),
                  _buildSentence('in kitâb az tehrân ast', 'This book is from Tehran'),
                  _buildSentence('mâ ba madrasaeh me-ravem', 'We go to school'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Buttons
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
                      MaterialPageRoute(builder: (context) => const GrammarQuizPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Take Quiz'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // PREPOSITION CARD (same layout as Conjunction card)
  Widget _buildPrepositionCard(Map<String, String> p) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  p['persian']!,
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
                          text: '(${p['pronunciation']})',
                          style: const TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
                        ),

                        const TextSpan(text: '  '),
                        TextSpan(text: p['english']),
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
                  Text('Example: ${p['example']}',
                      style: const TextStyle(fontStyle: FontStyle.italic)),
                  Text('Meaning: ${p['meaning']}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSentence(String persian, String english) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(persian, style: const TextStyle(fontStyle: FontStyle.italic)),
          Text(english, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
