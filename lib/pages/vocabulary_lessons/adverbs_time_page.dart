// Part 8
import 'package:flutter/material.dart';
import 'more_vocabulary_page.dart';

class AdverbsTimePage extends StatefulWidget {
  const AdverbsTimePage({super.key});

  @override
  State<AdverbsTimePage> createState() => _AdverbsTimePageState();
}

class _AdverbsTimePageState extends State<AdverbsTimePage> {
  bool showExpressions = false;

  final List<Map<String, String>> adverbs = const [
    {'english': 'now', 'persian': 'aknûn', 'script': 'اکنون'},
    {'english': 'then', 'persian': 'pas', 'script': 'پس'},
    {'english': 'today', 'persian': 'emrûz', 'script': 'امروز'},
    {'english': 'tomorrow', 'persian': 'fardâ', 'script': 'فردا'},
    {'english': 'yesterday', 'persian': 'dîrûz', 'script': 'دیروز'},
    {'english': 'always', 'persian': 'hameša', 'script': 'همیشه'},
    {'english': 'never', 'persian': 'hargez', 'script': 'هرگز'},
    {'english': 'often', 'persian': 'aksar(an)', 'script': 'اکثر(ا)'},
    {'english': 'sometimes', 'persian': 'gâhî', 'script': 'گاهی'},
    {'english': 'soon', 'persian': 'bezûdî', 'script': 'بزودی'},
    {'english': 'late', 'persian': 'dir', 'script': 'دیر'},
    {'english': 'early', 'persian': 'zûd', 'script': 'زود'},
    {'english': 'already', 'persian': 'qablan', 'script': 'قبلاً'},
    {'english': 'yet/still', 'persian': 'hanûz', 'script': 'هنوز'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adverbs of Time'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const Text(
              'Adverbs of Time in Persian',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn words that describe when something happens',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Adverb Cards — larger like Adverbs of Place
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: adverbs.length,
              itemBuilder: (context, index) {
                final adverb = adverbs[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
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
                              const SizedBox(height: 4),
                              Text(
                                adverb['persian']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          adverb['script']!,
                          style: const TextStyle(
                            fontSize: 28,
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

            // Toggle Expression Section
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => setState(() => showExpressions = !showExpressions),
              child: Row(
                children: [
                  Icon(
                    showExpressions
                        ? Icons.arrow_drop_down
                        : Icons.arrow_right,
                    color: Colors.blue,
                    size: 28,
                  ),
                  const Text(
                    "Show Time Expressions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            // Collapsible expressions — same style as Adverbs of Place examples
            if (showExpressions) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildExpression('right now', 'hamîn aknûn', 'همین اکنون'),
                    _buildExpression('every day', 'har rûz', 'هر روز'),
                    _buildExpression('next week', 'hafta-ye āyanda', 'هفتهٔ آینده'),
                    _buildExpression('last year', 'sâl-e gozašta', 'سال گذشته'),
                    _buildExpression('in the morning', 'sob', 'صبح'),
                    _buildExpression('in the evening', 'šab', 'شب'),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 30),

            // Navigation
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
                        builder: (context) => const MoreVocabularyPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: const Text('Next: More Vocabulary'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpression(String english, String persian, String script) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(english, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(persian, style: const TextStyle(fontStyle: FontStyle.italic)),
          Text(
            script,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'NotoNastaliqUrdu',
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
