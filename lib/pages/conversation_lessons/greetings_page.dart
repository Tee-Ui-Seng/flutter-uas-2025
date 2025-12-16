// Part 2
import 'package:flutter/material.dart';
import 'introductions_page.dart';

class GreetingsPage extends StatelessWidget {
  const GreetingsPage({super.key});

  final List<Map<String, String>> greetings = const [
    {
      'english': 'Hello!',
      'persian': 'Salâm!',
      'script': 'سلام',
      'responseEng': 'Hello!',
      'response': 'Salâm!',
      'responseScript': 'سلام'
    },
    {
      'english': 'How are you?',
      'persian': 'Xub asti?',
      'script': 'خوب استی؟',
      'responseEng': 'I’m fine, thanks.',
      'response': 'Xub astam, tašakur.',
      'responseScript': 'خوب استم، تشکر.'
    },
    {
      'english': 'How are you? (formal)',
      'persian': 'Xub asted?',
      'script': 'خوب استید؟',
      'responseEng': 'I’m fine, thank you.',
      'response': 'Xub astam, mamnûn.',
      'responseScript': 'خوب استم، ممنون.'
    },
    {
      'english': 'What\'s up? (casual)',
      'persian': 'Ci xabar?',
      'script': 'چه خبر؟',
      'responseEng': 'Nothing much.',
      'response': 'Xabarî nîst.',
      'responseScript': 'خبری نیست.'
    },
    {
      'english': 'How\'s it going?',
      'persian': 'Ciṭûrî?',
      'script': 'چطور میگذرد؟',
      'responseEng': 'Good, thanks.',
      'response': 'Xub, tašakur.',
      'responseScript': 'خوب، تشکر.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Greetings'),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Basic Persian Greetings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Learn the most common greetings in Persian',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // ===== GREETINGS CARDS (all scrollable now!) =====
            Column(
              children: greetings.map((greeting) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // English
                        Text(
                          greeting['english']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Persian + Response
                        Row(
                          children: [
                            // Left side
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    greeting['persian']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    greeting['script']!,
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'NotoNastaliqUrdu',
                                      height: 1.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 16),
                            const Icon(Icons.arrow_forward, color: Colors.grey),
                            const SizedBox(width: 16),

                            // Right side (response)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // ⭐ NEW: English translation for the Persian reply
                                  Text(
                                    greeting['responseEng']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),

                                  Text(
                                    greeting['response']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    greeting['responseScript']!,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 20,
                                      height: 1.8,
                                      fontFamily: 'NotoNastaliqUrdu',
                                      color: Colors.green[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // ===== PRONUNCIATION TIPS (also scrollable now!) =====
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pronunciation Tips:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '• "Salâm" has stress on the second syllable: sa-LAM\n'
                    '• "Xub" is pronounced like "khub" (خوب)\n'
                    '• "Cixabar" is usually said quickly as one word\n'
                    '• "Ciṭûrî" has stress on the last syllable',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ===== NAVIGATION =====
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
                      MaterialPageRoute(
                        builder: (context) => const IntroductionsPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Next: Introductions'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
