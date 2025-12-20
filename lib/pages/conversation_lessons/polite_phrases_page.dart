// Part
import 'package:flutter/material.dart';
import 'time_greetings_page.dart';

class PolitePhrasesPage extends StatelessWidget {
  const PolitePhrasesPage({super.key});

  final List<Map<String, String>> phrases = const [
    {'english': 'You’re welcome', 'persian': 'xâhiš me-kunam', 'script': 'خواهش می‌کنم', 'usage': 'Response to thank you'},
    {'english': 'Don’t mention it', 'persian': 'qâbil-î na dârad', 'script': 'قابلی ندارد', 'usage': 'Response to thank you'},
    {'english': 'Excuse me / Sorry', 'persian': 'me-baxšen / \nme-baxšed', 'script': 'می‌بخشین / \nمی‌بخشید', 'usage': 'To get attention or apologize'},
    {'english': 'Sorry', 'persian': 'bibaxšed', 'script': 'ببخشید', 'usage': 'To get attention or apologize'},
    {'english': 'Please', 'persian': 'lutfan', 'script': 'لطفا', 'usage': 'When making a request'},
    {'english': 'I understand', 'persian': 'me-fahmam', 'script': 'می‌فهمم', 'usage': 'Showing comprehension'},
    {'english': 'I don’t understand', 'persian': 'na me-fahmam', 'script': 'نمی‌فهمم', 'usage': 'When confused'},
    {'english': 'Could you repeat?', 'persian': 'me-tavâned takrâr kuned?', 'script': 'می‌توانید تکرار کنید؟', 'usage': 'Asking to repeat'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polite Phrases'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
              pronunciation: 'âre / bale',
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
              pronunciation: 'tašakkur',
              persianIran: 'تشکر / مرسی',
              persianDari: 'تشکر',
              notes: [
                'In Iran you can say "mersî" (مرسی) informally.',
                'In Tajik you can say "rahmat"'
              ],
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
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Cultural Notes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• Persians are generally very polite in conversation\n'
                    '• "me-baxšen" and "me-baxšed" are used for both "excuse me" and "sorry"\n'
                    '• Always use "lutfan" when making requests',
                    style: const TextStyle(fontSize: 14, height: 1.5),
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
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TimeGreetingsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Next: Time Greetings',
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

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
              ],
            ),

            if (notes.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.orange),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notes:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange
                      ),
                    ),
                    const SizedBox(height: 4),
                    ...notes.map((n) => Text('• $n')),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
