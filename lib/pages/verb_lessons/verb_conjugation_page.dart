// Part 3
import 'package:flutter/material.dart';
import 'verb_practice_page.dart';
import 'verb_basics_page.dart'; // Add import for VerbBasicsPage

class VerbConjugationPage extends StatelessWidget {
  const VerbConjugationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verb Conjugation Table'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const VerbBasicsPage(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Center(
              child: Text(
                'Conjugation of "xurdan" (to eat)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Introduction
            const Text(
              'Here is the complete present tense conjugation table for the verb "xordan" (to eat):',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),

            // Conjugation Table
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Pronoun',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue.shade800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Persian Script',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue.shade800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Pronunciation',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue.shade800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Table Rows
                    _buildTableRow(
                      pronoun: 'من',
                      persian: 'می‌خورم',
                      pronunciation: 'me-xor-am',
                      backgroundColor: Colors.white,
                      latin: 'man',
                      enpro: 'I',
                      english: 'I eat',
                    ),
                    _buildTableRow(
                      pronoun: 'تو',
                      persian: 'می‌خوری',
                      pronunciation: 'me-xor-î',
                      backgroundColor: Colors.grey[50]!,
                      latin: 'tu',
                      enpro: 'you',
                      english: 'you eat',
                    ),
                    _buildTableRow(
                      pronoun: 'او',
                      persian: 'می‌خورد',
                      pronunciation: 'me-xor-ad',
                      backgroundColor: Colors.white,
                      latin: 'o',
                      enpro: 'he/she',
                      english: 'he/she eats',
                    ),
                    _buildTableRow(
                      pronoun: 'ما',
                      persian: 'می‌خوریم',
                      pronunciation: 'me-xor-em',
                      backgroundColor: Colors.grey[50]!,
                      latin: 'mâ',
                      enpro: 'we',
                      english: 'we eat',
                    ),
                    _buildTableRow(
                      pronoun: 'شما',
                      persian: 'می‌خورید',
                      pronunciation: 'me-xor-ed',
                      backgroundColor: Colors.white,
                      latin: 'šumâ',
                      enpro: 'you pl.',
                      english: 'you eat',
                    ),
                    _buildTableRow(
                      pronoun: 'آنها',
                      persian: 'می‌خورند',
                      pronunciation: 'me-xor-and',
                      backgroundColor: Colors.grey[50]!,
                      latin: 'âmhâ',
                      enpro: 'they',
                      english: 'they eat',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Additional Examples with note
            const Text(
              'Examples of irregular verbs:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The following verbs have irregular stems that need to be memorized.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),

            // Updated irregular verb cards
            _buildIrregularVerbCard(
              infinitive: 'dîdan',
              infinitiveScript: 'دیدن',
              meaning: 'to see',
              presentStem: 'بین',
              stemPronunciation: 'bîn',
              firstPerson: 'می‌بینم',
              firstPersonPronunciation: 'me-bîn-am',
            ),
            const SizedBox(height: 12),
            _buildIrregularVerbCard(
              infinitive: 'raftan',
              infinitiveScript: 'رفتن',
              meaning: 'to go',
              presentStem: 'رو',
              stemPronunciation: 'rav',
              firstPerson: 'می‌روم',
              firstPersonPronunciation: 'me-rav-am',
            ),
            const SizedBox(height: 12),
            _buildIrregularVerbCard(
              infinitive: 'navištan',
              infinitiveScript: 'نوشتن',
              meaning: 'to write',
              presentStem: 'نویس',
              stemPronunciation: 'navis',
              firstPerson: 'می‌نویسم',
              firstPersonPronunciation: 'me-navis-am',
            ),
            const SizedBox(height: 12),
            _buildIrregularVerbCard(
              infinitive: 'kardan',
              infinitiveScript: 'کردن',
              meaning: 'to do/work',
              presentStem: 'کن',
              stemPronunciation: 'kun',
              firstPerson: 'می‌کنم',
              firstPersonPronunciation: 'me-kun-am',
            ),
            const SizedBox(height: 30),

            // Key Points
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.lightbulb_outline, color: Colors.orange),
                        SizedBox(width: 8),
                        Text(
                          'Key Points to Remember:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildKeyPoint('The "me-" prefix is often pronounced as "mi-" in speech'),
                    _buildKeyPoint('The verb stem (without -dan) is called "riz" (ریشه)'),
                    _buildKeyPoint('Some verbs have irregular stems that need to be memorized'),
                    _buildKeyPoint('Negative form uses "ne-" before "me-" (نمی‌خورم = ne-me-xor-am)'),
                    _buildKeyPoint('The stem determines the conjugation pattern'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerbBasicsPage(),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back to Basics'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConjugationPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz),
                  label: const Text('Start Practice'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTableRow({
    required String pronoun,
    required String persian,
    required String pronunciation,
    required String latin,
    required String enpro,
    required String english,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  latin,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  pronoun,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '($enpro)',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  persian,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'NotoNaskhArabic',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '($english)',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              pronunciation,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Courier',
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIrregularVerbCard({
    required String infinitive,
    required String infinitiveScript,
    required String meaning,
    required String presentStem,
    required String stemPronunciation,
    required String firstPerson,
    required String firstPersonPronunciation,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.orange.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$infinitive ($meaning)',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      infinitiveScript,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'NotoNaskhArabic',
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: const Text(
                    'Irregular',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Stem information
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.orange, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Present Stem:',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              presentStem,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'NotoNaskhArabic',
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '($stemPronunciation)',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.orange,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Example conjugation
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text(
                    'I (من): ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    firstPerson,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoNaskhArabic',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '($firstPersonPronunciation)',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Note
            Text(
              'Note: The stem "$stemPronunciation" is irregular and must be memorized.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}