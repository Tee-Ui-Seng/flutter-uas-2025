import 'package:flutter/material.dart';
import 'pronoun_plural_quiz_page.dart';

class PluralizationPage extends StatelessWidget {
  const PluralizationPage({super.key});

  final List<Map<String, dynamic>> rules = const [
    {
      'rule': 'Most common plural',
      'suffix': '-hâ',
      'exampleFrom': 'kitâb',
      'exampleTo': 'kitâb-hâ',
      'meaning': 'book → books',
      'scriptFrom': 'کتاب',
      'scriptTo': 'کتاب‌ها',
    },
    {
      'rule': 'Some animate words',
      'suffix': '-ân / -yân (after a vowel)',
      'exampleFrom': 'dânišjû',
      'exampleTo': 'dânišjûyân',
      'meaning': 'student → students',
      'scriptFrom': 'دانشجو',
      'scriptTo': 'دانشجویان',
    },
    {
      'rule': 'Arabic loanwords',
      'suffix': '-ât',
      'exampleFrom': 'kalima',
      'exampleTo': 'kalimât',
      'meaning': 'word → words',
      'scriptFrom': 'کلمه',
      'scriptTo': 'کلمات',
      'notes': 'Note: The form kalima-hâ (کلمه‌ها) can also be found mostly in Tajik.',
    },
    {
      'rule': 'Irregular plurals',
      'suffix': '(irregular)',
      'exampleFrom': 'šay’',
      'exampleTo': 'ašyo’',
      'meaning': 'object → objects',
      'scriptFrom': 'شیء',
      'scriptTo': 'اشیاء',
      'notes': 'Note: The form šay’-hâ (شیءها) can also be found mostly in Tajik.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pluralizing Nouns'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // TITLE + INTRO
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'How to Pluralize Persian Nouns',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Persian nouns can be pluralized using different suffixes:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // ⭐ SCROLLABLE CONTENT ⭐
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ...rules.map((rule) {
                    final hasNotes = rule['notes'] != null;
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rule['rule'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // SUFFIX
                            Row(
                              children: [
                                const Text(
                                  'Suffix: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(rule['suffix']),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // ⭐ COMPARISON TABLE ⭐
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  // Latin script transformation
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        rule['exampleFrom'],
                                        style: const TextStyle(
                                          fontFamily: 'Courier',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                      const SizedBox(width: 8),
                                      Text(
                                        rule['exampleTo'],
                                        style: const TextStyle(
                                          fontFamily: 'Courier',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  // Persian script transformation
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        rule['scriptFrom'],
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NotoNastaliqUrdu',
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                      const SizedBox(width: 8),
                                      Text(
                                        rule['scriptTo'],
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NotoNastaliqUrdu',
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 6),

                                  // Meaning
                                  Text(
                                    rule['meaning'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // const SizedBox(height: 8),

                            // // English meaning
                            // Text(
                            //   rule['meaning'],
                            //   style: const TextStyle(
                            //     fontStyle: FontStyle.italic,
                            //     color: Colors.grey,
                            //   ),
                            // ),

                            // ⭐ CONDITIONAL NOTES SECTION ⭐
                            if (hasNotes) ...[
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.orange[50],
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.orange[200]!),
                                ),
                                child: Text(
                                  rule['notes']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.orange[800],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }).toList(),

                  // PRACTICE TIPS (now scrollable)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber),
                      color: Colors.amber.shade50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.tips_and_updates,
                                color: Colors.amber, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'Practice Tips',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[800],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '• Use "-hâ" for most inanimate objects\n'
                          '• Use "-ân" for animate beings & people\n'
                          '• Some nouns have irregular plurals\n'
                          '• Do NOT pluralize a noun if the number is specified',
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  ],                  
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // NAVIGATION BUTTONS
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: BorderSide(color: Colors.teal),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PronounPluralQuizPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Next: Practice Quiz',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.quiz, size: 16, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // const SizedBox(height: 16),
        ],
      ),
    );
  }
}