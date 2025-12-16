// Part 9
import 'package:flutter/material.dart';
import 'vocabulary_quiz_page.dart';

class MoreVocabularyPage extends StatelessWidget {
  const MoreVocabularyPage({super.key});

  final List<Map<String, dynamic>> vocabulary = const [
    {
      'category': 'Colors',
      'words': [
        {'english': 'red', 'persian': 'sorx', 'script': 'سرخ'},
        {'english': 'blue', 'persian': 'âbî', 'script': 'آبی'},
        {'english': 'green', 'persian': 'sabz', 'script': 'سبز'},
        {'english': 'yellow', 'persian': 'zard', 'script': 'زرد'},
        {'english': 'black', 'persian': 'siyâh', 'script': 'سیاه'},
        {'english': 'white', 'persian': 'sefîd', 'script': 'سفید'},
      ]
    },
    {
      'category': 'Family',
      'words': [
        {'english': 'father', 'persian': 'pedar', 'script': 'پدر'},
        {'english': 'mother', 'persian': 'mâdar', 'script': 'مادر'},
        {'english': 'brother', 'persian': 'barâdar', 'script': 'برادر'},
        {'english': 'sister', 'persian': 'xâhar', 'script': 'خواهر'},
        {'english': 'son', 'persian': 'pesar', 'script': 'پسر'},
        {'english': 'daughter', 'persian': 'doxtar', 'script': 'دختر'},
      ]
    },
    {
      'category': 'Food',
      'words': [
        {'english': 'bread', 'persian': 'nân', 'script': 'نان'},
        {'english': 'water', 'persian': 'âb', 'script': 'آب'},
        {'english': 'rice', 'persian': 'berenj', 'script': 'برنج'},
        {'english': 'meat', 'persian': 'gušt', 'script': 'گوشت'},
        {'english': 'fruit', 'persian': 'mêva', 'script': 'میوه'},
        {'english': 'vegetable', 'persian': 'sabzî', 'script': 'سبزی'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Essential Vocabulary'),
        backgroundColor: Colors.amber,
      ),

      // EVERYTHING scrolls together
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'More Essential Vocabulary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Learn additional useful words for everyday conversation',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // VOCAB CATEGORIES (all inside the scroll)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: vocabulary.length,
              itemBuilder: (context, categoryIndex) {
                final category = vocabulary[categoryIndex];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category['category']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 12),

                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 2.5,
                          ),
                          itemCount: (category['words'] as List).length,
                          itemBuilder: (context, wordIndex) {
                            final word =
                                (category['words'] as List)[wordIndex];

                            return Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.amber.shade50,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.amber.shade200,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    word['english']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 4),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(word['persian']!),
                                      Text(
                                        word['script']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NotoNastaliqUrdu',
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // PRACTICE AREA
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Practice Sentences:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),

                  _buildSentence(
                      'My father likes red apples', 'pedaram sib-e sorx râ dûst dârad'),
                  _buildSentence(
                      'We eat rice with vegetables', 'mâ berenj bâ sabzî mixorîm'),
                  _buildSentence(
                      'Her brother drinks water', 'barâdaraš âb minûšad'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // NAV BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VocabularyQuizPage(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: const Text('Take Quiz'),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildSentence(String english, String persian) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(english),
          Text(persian, style: const TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
