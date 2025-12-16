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
      'rule': 'For words pertaining to humans',
      'suffix': '-ân',
      'exampleFrom': 'dânešju',
      'exampleTo': 'dânešjuyân',
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
      'notes': 'Note: The form kalima-hā (کلمه‌ها) can also be found mostly in Tajik.',
    },
    {
      'rule': 'Irregular plurals',
      'suffix': '(irregular)',
      'exampleFrom': 'šay\'',
      'exampleTo': 'ašyo\'',
      'meaning': 'object → objects',
      'scriptFrom': 'شیء',
      'scriptTo': 'اشیاء',
      'notes': 'Note: The form šay\'-hā (شیءها) can also be found mostly in Tajik.',
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
                  children: rules.map((rule) {
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
                            Table(
                              border: TableBorder.all(
                                color: Colors.grey.shade300,
                              ),
                              columnWidths: const {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(1),
                              },
                              children: [
                                const TableRow(
                                  decoration:
                                      BoxDecoration(color: Color(0xFFE0F2F1)),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Singular',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Plural',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    // LEFT CELL - Singular
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            rule['exampleFrom'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            rule['scriptFrom'],
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'NotoNastaliqUrdu',
                                            ),
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ],
                                      ),
                                    ),

                                    // RIGHT CELL - Plural
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            rule['exampleTo'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            rule['scriptTo'],
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'NotoNastaliqUrdu',
                                            ),
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // English meaning
                            Text(
                              rule['meaning'],
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                              ),
                            ),

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
                ),
              ),
            ),
          ),

          // IMPORTANT NOTE
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber),
            ),
            child: const Text(
              'Important:\n'
              '- Use "-hâ" for most inanimate objects\n'
              '- Use "-ân" for animate beings & people\n'
              '- Some nouns have irregular plurals',
              style: TextStyle(fontSize: 14),
            ),
          ),

          const SizedBox(height: 16),

          // NAV BUTTONS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
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
                        builder: (context) =>
                            const PronounPluralQuizPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text('Practice Quiz'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}