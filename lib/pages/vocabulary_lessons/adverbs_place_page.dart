// Part 7
import 'package:flutter/material.dart';
import 'adverbs_time_page.dart';

class AdverbsPlacePage extends StatelessWidget {
  const AdverbsPlacePage({super.key});

  final List<Map<String, String>> adverbs = const [
    {'english': 'here', 'persian': 'înjâ', 'script': 'اینجا'},
    {'english': 'there', 'persian': 'ânjâ', 'script': 'آنجا'},
    {'english': 'everywhere', 'persian': 'harjâ', 'script': 'هرجا'},
    {'english': 'somewhere', 'persian': 'jâyî', 'script': 'جایی'},
    {'english': 'nowhere', 'persian': 'hecjâ', 'script': 'هیچ‌جا'},
    {'english': 'elsewhere', 'persian': 'jây dîgar', 'script': 'جای دیگر'},
    {'english': 'up/above', 'persian': 'bâlâ', 'script': 'بالا'},
    {'english': 'down/below', 'persian': 'pâyîn', 'script': 'پایین'},
    {'english': 'inside', 'persian': 'darûn', 'script': 'درون'},
    {'english': 'outside', 'persian': 'dâxil', 'script': 'داخل'},
    {'english': 'near', 'persian': 'nazdîk', 'script': 'نزدیک'},
    {'english': 'far', 'persian': 'dûr', 'script': 'دور'},
    {'english': 'left', 'persian': 'cap', 'script': 'چپ'},
    {'english': 'right', 'persian': 'râst', 'script': 'راست'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adverbs of Place'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(     // <-- Entire page is scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adverbs of Place in Persian',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn words that describe location and position',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // Grid (inside scroll)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemCount: adverbs.length,
              itemBuilder: (context, index) {
                final adverb = adverbs[index];
                return Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          adverb['english']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          adverb['persian']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          adverb['script']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'NotoNastaliqUrdu',
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Usage examples inside the same scroll
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
                    'Usage Examples:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildExample('I am here', 'man înjâ astam', 'من اینجا استم'),
                  _buildExample('It is there', 'ânjâ ast', 'آنجا است'),
                  _buildExample('Go outside', 'berûn buro', 'بیرون برو'),
                  _buildExample('Come near', 'nazdîk bîyâ', 'نزدیک بیا'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Navigation buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: BorderSide(color: Colors.amber),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AdverbsTimePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Next: Adverbs of Time',
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

  Widget _buildExample(String english, String persian, String script) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(english, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(persian, style: const TextStyle(fontStyle: FontStyle.italic)),
          Text(
            script,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'NotoNastaliqUrdu',
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
