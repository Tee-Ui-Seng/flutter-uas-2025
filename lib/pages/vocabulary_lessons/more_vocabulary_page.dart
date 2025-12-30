// Part 9
import 'package:flutter/material.dart';
import 'vocabulary_quiz_page.dart';

class MoreVocabularyPage extends StatelessWidget {
  const MoreVocabularyPage({super.key});

  final List<Map<String, dynamic>> vocabulary = const [
    {
      'category': 'Colors',
      'words': [
        {'english': 'red', 'persian': 'surx', 'script': 'سرخ'},
        {'english': 'blue', 'persian': 'âbî', 'script': 'آبی'},
        {'english': 'green', 'persian': 'sabz', 'script': 'سبز'},
        {'english': 'yellow', 'persian': 'zard', 'script': 'زرد'},
        {'english': 'black', 'persian': 'siyâh', 'script': 'سیاه'},
        {'english': 'white', 'persian': 'safed', 'script': 'سفید'},
      ]
    },
    {
      'category': 'Family',
      'words': [
        {'english': 'father', 'persian': 'padar', 'script': 'پدر'},
        {'english': 'mother', 'persian': 'mâdar', 'script': 'مادر'},
        {'english': 'brother', 'persian': 'barâdar', 'script': 'برادر'},
        {'english': 'sister', 'persian': 'xâhar', 'script': 'خواهر'},
        {'english': 'son', 'persian': 'pisar', 'script': 'پسر'},
        {'english': 'daughter', 'persian': 'duxtar', 'script': 'دختر'},
      ]
    },
    {
      'category': 'Food',
      'words': [
        {'english': 'bread', 'persian': 'nân', 'script': 'نان'},
        {'english': 'water', 'persian': 'âb', 'script': 'آب'},
        {'english': 'rice', 'persian': 'birinj', 'script': 'برنج'},
        {'english': 'meat', 'persian': 'gošt', 'script': 'گوشت'},
        {'english': 'fruit', 'persian': 'meva', 'script': 'میوه'},
        {'english': 'vegetable', 'persian': 'sabzî', 'script': 'سبزی'},
      ]
    },
  ];

  final List<Map<String, String>> examples = const [
    {
      'english': 'My father likes red apples',
      'persian': 'padar-am seb-i surx râ dost dârad',
      'script': 'پدرم سیب سرخ را دوست دارد',
    },
    {
      'english': 'We eat rice with vegetables',
      'persian': 'mâ birinj bâ sabzî me-xorem',
      'script': 'ما برنج با سبزی می‌خوریم',
    },
    {
      'english': 'Her brother drinks water',
      'persian': 'barâdar-aš âb me-nošad',
      'script': 'برادرش آب می‌نوشد',
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
                            childAspectRatio: 2,
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

            // Tips
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.tips_and_updates, color: Colors.amber, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Important Tips',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• The noun meva and sabzî takes the special plural suffix -jât. The plural -hâ is still accepted.\n'
                    '• Fruit = meva (میوه), fruits = mevâjât (میوجات)\n'
                    '• Vegetable = sabzî (سبزی), vegetables = sabzîjât (سبزیجات)\n'
                    '• In Afghanistan, the word "nân" can be used to refer to food colloquially.\n',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            // PRACTICE SENTENCES AREA
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child:
                _buildExampleTable(),
            ),

            const SizedBox(height: 24),

            // NAVIGATION BUTTONS
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
                      MaterialPageRoute(builder: (_) => const VocabularyQuizPage()),
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
                        'Next: Take Quiz',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.quiz, size: 16, color: Colors.white),
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

  Widget _buildExampleTable() {
    return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.translate, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Text(
            'Practice Sentences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade700,
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),

      Column(
        children: List.generate(examples.length, (index) {
          final example = examples[index];
          final isLast = index == examples.length - 1;

          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    example['script']!,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'NotoNastaliqUrdu',
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    example['persian']!,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    example['english']!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    ],
    );
  }
}
