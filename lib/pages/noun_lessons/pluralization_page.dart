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
      'rule': 'Most animate words',
      'suffix': '-ân / -gân (after -a) / -yân (other vowels)',
      'exampleFrom': 'daraxt',
      'exampleTo': 'daraxtân',
      'meaning': 'tree → trees',
      'scriptFrom': 'درخت',
      'scriptTo': 'درختان',
      'exampleFrom2': 'dânišjû',
      'exampleTo2': 'dânišjûyân',
      'meaning2': 'student → students',
      'scriptFrom2': 'دانشجو',
      'scriptTo2': 'دانشجویان',
      'exampleFrom3': 'sitâra',
      'exampleTo3': 'sitâragân',
      'meaning3': 'star → stars',
      'scriptFrom3': 'ستاره',
      'scriptTo3': 'ستارگان',
      'notes': 'Note: In the formal standard language, -ân is usable with almost all words for persons and living creatures (animals and plants). It is also employed with a limited number of inanimate nouns such as چشمان (cašmân, “eyes”).'
      '\n\nThe form -gân is increasingly rare in Afghanistan, often replaced with -hâ.'
      '\n\nThe form -hâ can also be found in many of these cases, especially in colloquial speech.',
    },
    {
      'rule': 'Arabic loanwords',
      'suffix': '-ât (See notes)',
      'exampleFrom': 'kalima',
      'exampleTo': 'kalimât',
      'meaning': 'word → words',
      'scriptFrom': 'کلمه',
      'scriptTo': 'کلمات',
      'exampleFrom2': 'haivân',
      'exampleTo2': 'haivânât',
      'meaning2': 'animal → animals',
      'scriptFrom2': 'حیوان',
      'scriptTo2': 'حیوانات',
      'exampleFrom3': 'mawzu’',
      'exampleTo3': 'mawzu’ât',
      'meaning3': 'topic → topics',
      'scriptFrom3': 'موضوع',
      'scriptTo3': 'موضوعات',
      'exampleFrom4': 'sifat',
      'exampleTo4': 'sifât',
      'meaning4': 'trait → traits',
      'scriptFrom4': 'صفت',
      'scriptTo4': 'صفات',
      'notes': 'Note: If the noun ends in -at, replace it with the suffix. If the noun ends in a vowel, remove the vowel before suffixing.'
      '\n\nThe form kalima-hâ (کلمه‌ها), haivân-hâ (حیوان‌ها), mawzu’-hâ (موضوع‌ها), sifat-hâ (صفت‌ها) can also be found mostly in Tajik.',
    },
    {
      'rule': 'Irregular plurals',
      'suffix': '(irregular)',
      'exampleFrom': 'šay’',
      'exampleTo': 'ašyo’',
      'meaning': 'object → objects',
      'scriptFrom': 'شیء',
      'scriptTo': 'اشیاء',
      'exampleFrom2': 'masjid',
      'exampleTo2': 'masâjid',
      'meaning2': 'mosque → mosques',
      'scriptFrom2': 'مسجد',
      'scriptTo2': 'مساجد',
      'exampleFrom3': 'qânun',
      'exampleTo3': 'qavânin',
      'meaning3': 'law → laws',
      'scriptFrom3': 'قانون',
      'scriptTo3': 'قوانين',
      'exampleFrom4': 'jazîra',
      'exampleTo4': 'jazâir',
      'meaning4': 'island → islands',
      'scriptFrom4': 'جزیره',
      'scriptTo4': 'جزایر',
      'notes': 'Note: Irregular plurals are only found in Arabic loanwords. The form šay’-hâ (شیءها), masjid-hâ (مسجدها), qânun-hâ (قانون‌ها), jazîra-hâ (جزیره‌ها) can also be found mostly in Tajik.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pluralizing Nouns'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
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

                            // ⭐ PLURAL TRANSFORMATION ⭐
                            _moreExample(
                              exampleFrom: rule['exampleFrom'],
                              exampleTo: rule['exampleTo'],
                              scriptFrom: rule['scriptFrom'],
                              scriptTo: rule['scriptTo'],
                              meaning: rule['meaning'],
                            ),

                            if (rule['exampleFrom2'] != null) ...[
                              _moreExample(
                                exampleFrom: rule['exampleFrom2'],
                                exampleTo: rule['exampleTo2'],
                                scriptFrom: rule['scriptFrom2'],
                                scriptTo: rule['scriptTo2'],
                                meaning: rule['meaning2'],
                              ),
                            ],

                            if (rule['exampleFrom3'] != null) ...[
                              _moreExample(
                                exampleFrom: rule['exampleFrom3'],
                                exampleTo: rule['exampleTo3'],
                                scriptFrom: rule['scriptFrom3'],
                                scriptTo: rule['scriptTo3'],
                                meaning: rule['meaning3'],
                              ),
                            ],

                            if (rule['exampleFrom4'] != null) ...[
                              _moreExample(
                                exampleFrom: rule['exampleFrom4'],
                                exampleTo: rule['exampleTo4'],
                                scriptFrom: rule['scriptFrom4'],
                                scriptTo: rule['scriptTo4'],
                                meaning: rule['meaning4'],
                              ),
                            ],

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
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.shortcut_outlined,
                              color: Colors.blue.shade800,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Plural Usage Rule',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Unlike in English, pluralization is not used if the amount is described:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade800,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [   
                              _buildDialogLine(
                                '1',
                                'man panj sag dâram.',
                                'من پنج سگ دارم.',
                                'I have five dogs.',
                              ),
                              _buildDialogLine(
                                '2',
                                'man cand dâna sag dâram.',
                                'من چند دانه سگ دارم.',
                                'I have some dogs.',
                              ),
                              _buildDialogLine(
                                '3',
                                'man sag-hâ dâram.',
                                'من سگ‌ها دارم.',
                                'I have dogs.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Unlike in English, plural nouns don’t require plural demonstratives:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade800,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [   
                              _buildDialogLine(
                                '1',
                                'în kitâb-hâ naw astand.',
                                'این کتاب‌ها نو استند.',
                                'These books are new.',
                              ),
                              _buildDialogLine(
                                '2',
                                'înhâ naw astand.',
                                'این‌ها نو استند.',
                                'These (things) are new.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [     
                              _buildDialogLine(
                                '1',
                                'ân kitâb-hâ naw astand.',
                                'آن کتاب‌ها نو استند.',
                                'Those books are new.',
                              ),
                              _buildDialogLine(
                                '2',
                                'ânhâ naw astand.',
                                'آن‌ها نو استند.',
                                'Those (things) are new.',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  //   padding: const EdgeInsets.all(16),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12),
                  //     border: Border.all(color: Colors.amber),
                  //     color: Colors.amber.shade50,
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           const Icon(Icons.tips_and_updates,
                  //               color: Colors.amber, size: 20),
                  //           const SizedBox(width: 8),
                  //           Text(
                  //             'Practice Tips',
                  //             style: TextStyle(
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.amber[800],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       const SizedBox(height: 8),
                  //       const Text(
                  //         '• Use "-hâ" for most inanimate objects\n'
                  //         '• Use "-ân" for animate beings & people\n'
                  //         '• Some nouns have irregular plurals\n'
                  //         '• Do NOT pluralize a noun if the number is specified',
                  //         style: TextStyle(fontSize: 14, height: 1.5),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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

  Widget _moreExample({
    required String exampleFrom,
    required String exampleTo,
    required String scriptFrom,
    required String scriptTo,
    required String meaning,
  }) {
    return Container(
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
                exampleFrom,
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
                exampleTo,
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
                scriptFrom,
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
                scriptTo,
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
            meaning,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
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
      padding: const EdgeInsets.only(bottom: 8, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: Text(
              speaker,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    color: Colors.blue.shade700,
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