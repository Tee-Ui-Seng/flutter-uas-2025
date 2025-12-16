// Part
import 'package:flutter/material.dart';
import 'time_greetings_page.dart';

class PolitePhrasesPage extends StatelessWidget {
  const PolitePhrasesPage({super.key});

  final List<Map<String, String>> phrases = const [
    {'english': 'You\'re welcome', 'persian': 'qâbel nîst', 'script': 'قابل تان را ندارد', 'usage': 'Response to thank you'},
    {'english': 'Excuse me / Sorry', 'persian': 'bebaxšîn', 'script': 'ببخشین', 'usage': 'To get attention or apologize'},
    {'english': 'Please', 'persian': 'lotfan', 'script': 'لطفاً', 'usage': 'When making a request'},
    {'english': 'I understand', 'persian': 'mîfahmam', 'script': 'می‌فهمم', 'usage': 'Showing comprehension'},
    {'english': 'I don\'t understand', 'persian': 'namîfahmam', 'script': 'نمی‌فهمم', 'usage': 'When confused'},
    {'english': 'Could you repeat?', 'persian': 'mîtoned tekrâr koned?', 'script': 'می‌توانید تکرار کنید؟', 'usage': 'Asking to repeat'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polite Phrases'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Title
            const Text(
              'Polite Phrases and Expressions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Essential polite phrases for everyday conversation',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // ------------------------------------------------
            // NEW SECTION 1 — Affirmations & Negation
            // ------------------------------------------------
            _sectionTitle('Affirmations & Negation'),

            _subsectionCard(
              title: 'Yes (Affirmation)',
              pronunciation: 'bale / âre',
              persianIran: 'بله  /  آره',
              persianDari: 'بلی  /  آری',
              notes: [
                'In Iran, آره is only used informally.',
                'In Dari, بلی can also be used when answering a phone call or asking someone to repeat.',
              ],
            ),

            const SizedBox(height: 12),

            _subsectionCard(
              title: 'No (Negation)',
              pronunciation: 'na',
              persianIran: 'نه',
              persianDari: 'نه',
              notes: [],
            ),

            const SizedBox(height: 28),

            // ------------------------------------------------
            // NEW SECTION 2 — Gratitude
            // ------------------------------------------------
            _sectionTitle('Gratitude'),

            _subsectionCard(
              title: 'Thank you',
              pronunciation: 'tašakur',
              persianIran: 'تشکر',
              persianDari: 'تشکر',
              notes: [],
            ),

            const SizedBox(height: 12),

            _subsectionCard(
              title: 'Thank you (Iranian informal)',
              pronunciation: 'mersî',
              persianIran: 'ممنون',
              persianDari: '—', // No strong Dari equivalent
              notes: [],
            ),

            const SizedBox(height: 32),

            // ------------------------------------------------
            // ORIGINAL POLITE PHRASES LIST (nicely below new sections)
            // ------------------------------------------------
            _sectionTitle('Additional Polite Expressions'),

            const SizedBox(height: 8),

            ...phrases.map((phrase) {
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              phrase['english']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              phrase['persian']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              phrase['script']!,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'NotoNastaliqUrdu',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            phrase['usage']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 24),

            // ------------------------------------------------
            // CULTURAL NOTES
            // ------------------------------------------------
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cultural Notes:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '• Persians are generally very polite in conversation\n'
                    '• "tašakur" can be shortened to "mersî" (ممنون) in casual speech\n'
                    '• "bebaxšîn" is used for both "excuse me" and "sorry"\n'
                    '• Always use "lotfan" when making requests\n'
                    '• "bale" is more formal than "are"',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ------------------------------------------------
            // NAVIGATION BUTTONS
            // ------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TimeGreetingsPage(),
                      ),
                    );
                  },
                  child: const Text('Next: Time Greetings'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ======================
  // REUSABLE WIDGETS
  // ======================

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _subsectionCard({
    required String title,
    required String pronunciation,
    required String persianIran,
    required String persianDari,
    required List<String> notes,
  }) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              pronunciation,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text('Iran:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              persianIran,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'NotoNastaliqUrdu',
              ),
            ),

            const SizedBox(height: 6),

            const Text('Dari:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              persianDari,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'NotoNastaliqUrdu',
              ),
            ),

            if (notes.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Text(
                'Notes:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              ...notes.map((n) => Text('• $n')),
            ],
          ],
        ),
      ),
    );
  }
}
