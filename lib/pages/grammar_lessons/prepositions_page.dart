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
      'script': 'در خانه',
      'meaning': 'at home',
    },
    {
      'persian': 'با',
      'pronunciation': 'bâ',
      'english': 'with',
      'example': 'bâ dost',
      'script': 'با دوست',
      'meaning': 'with friend',
    },
    {
      'persian': 'از',
      'pronunciation': 'az',
      'english': 'from',
      'example': 'az tehrân',
      'script': 'از تهران',
      'meaning': 'from Tehran',
    },
    {
      'persian': 'به',
      'pronunciation': 'ba',
      'english': 'to',
      'example': 'be madrasaeh',
      'script': 'به مدرسه',
      'meaning': 'to school',
    },
    {
      'persian': 'برای',
      'pronunciation': 'barâyi',
      'english': 'for',
      'example': 'barâyi tu',
      'script': 'برای تو',
      'meaning': 'for you',
    },
    {
      'persian': 'روی',
      'pronunciation': 'royi',
      'english': 'on',
      'example': 'royi mez',
      'script': 'روی میز',
      'meaning': 'on the table',
    },
    {
      'persian': 'زیر',
      'pronunciation': 'zer',
      'english': 'under',
      'example': 'zer mez',
      'script': 'زیر میز',
      'meaning': 'under the table',
    },
    {
      'persian': 'کنار',
      'pronunciation': 'kanâr',
      'english': 'next to',
      'example': 'kanâr daraxt',
      'script': 'کنار درخت',
      'meaning': 'next to the tree',
    },
  ];

  final List<Map<String, String>> examples = const [
    {
      'english': 'I am at the office',
      'persian': 'man dar kâr xâna astam', 
      'script': 'من در کار خانه هستم',
    },
    {
      'english': 'He is going with his father',
      'persian': 'o bâ padar-aš me-ravad',
      'script': 'او با پدرش می‌رود',
    },
    {
      'english': 'This book is from Tehran',
      'persian': 'in kitâb az tehrân ast', 
      'script': 'این کتاب از تهران است',
    },
    {
      'english': 'We go to school',
      'persian': 'mâ ba madrasa me-ravem',
      'script': 'ما به مدرسه می‌رویم',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Prepositions'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
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
                    '• Prepositions usually come before the noun they modify\n'
                    '• barâye + man = barâye man (for me)\n'
                    '• "در" can mean "in" or "at"\n'
                    '• "از" is used for origin, material, or cause',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // EXAMPLE SENTENCES
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child:
                _buildExampleTable(),
            ),

            const SizedBox(height: 24),

            // Buttons
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
                      MaterialPageRoute(builder: (context) => const GrammarQuizPage()),
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
                  // Persian (Nastaliq)
                  Text(
                    p['script']!,
                    style: const TextStyle(
                      fontFamily: 'NotoNastaliqUrdu',
                      fontSize: 18,
                    ),
                    textDirection: TextDirection.rtl,
                  ),

                  // Transliteration
                  Text(
                    '(${p['example']})',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.red,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text('Meaning: ${p['meaning']}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleTable() {
    return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.translate, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Text(
            'Example Sentences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700,
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),

      Column(
        children: List.generate(examples.length, (index) {
          final example = examples[index];
          final isLast = index == examples.length - 1;

          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    example['script']!,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'NotoNastaliqUrdu',
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    example['persian']!,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    example['english']!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    ],
    );
  }
}
