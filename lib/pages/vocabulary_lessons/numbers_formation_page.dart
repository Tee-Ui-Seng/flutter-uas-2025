// Part 5
import 'package:flutter/material.dart';
import 'drag_drop_game_page.dart';

class NumbersFormationPage extends StatelessWidget {
  const NumbersFormationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forming Complex Numbers'),
        backgroundColor: Colors.amber,
      ),

      body: SingleChildScrollView(        // ← makes entire page scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'How to Form Complex Numbers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Learn to combine numbers to form any numeral in Persian',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // Rule Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Step header
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.amber, width: 2),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.lightbulb_rounded,
                              size: 20,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'The Key Rule',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.amber[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // const Text(
                    //   'The Key Rule:',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.amber,
                    //   ),
                    // ),
                    // const SizedBox(height: 8),

                    const Text(
                      'All the tables contain basic numerals to remember before forming any numbers in Persian. '
                      'The word "u" (و) is put between separate words in forming the numeral.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),

                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '"u" (و) means "and" and connects number components',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Example 1 Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Example 1: 5294',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green[800],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // const Text(
                    //   'Example 1: 5294',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.green,
                    //   ),
                    // ),
                    const SizedBox(height: 8),

                    _buildNumberBreakdown(
                      number: '5294',
                      breakdown: '5,000 + 200 + 90 + 4',
                      persian: 'panj hazâr u du sad u nawad u cahâr',
                      script: 'پنج هزار و دو صد و نود چهار',
                    ),

                    const SizedBox(height: 8),
                    const Text('Step by step:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),

                    _buildStep('5000', 'panj hazâr'),
                    _buildStep('+ 200', 'u du sad'),
                    _buildStep('+ 90', 'u nawad'),
                    _buildStep('+ 4', 'u cahâr'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Example 2 Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              '2',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Example 2: 8031',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue[800],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // const Text(
                    //   'Example 2: 8031',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.blue,
                    //   ),
                    // ),
                    const SizedBox(height: 8),

                    _buildNumberBreakdown(
                      number: '8031',
                      breakdown: '8,000 + 30 + 1',
                      persian: 'hašt hazâr u sî u yak',
                      script: 'هشت هزار و سی و یک',
                    ),

                    const SizedBox(height: 8),
                    const Text('Step by step:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),

                    _buildStep('8000', 'hašt hazâr'),
                    _buildStep('+ 30', 'u sî'),
                    _buildStep('+ 1', 'u yak'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Practice Card
            Card(
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      children: [
                        Icon(Icons.translate, color: Colors.green, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Example Sentences',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Try it Yourself:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),

                    _buildPracticeProblem('123', '100 + 20 + 3'),
                    _buildPracticeProblem('4567', '4000 + 500 + 60 + 7'),
                    _buildPracticeProblem('89', '80 + 9'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Navigation Buttons
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
                      MaterialPageRoute(builder: (_) => const DragDropGamePage()),
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
                        'Next: Practice Game',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.quiz, size: 16, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),

            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberBreakdown({
    required String number,
    required String breakdown,
    required String persian,
    required String script,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text('$number = ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(breakdown, style: TextStyle(fontSize: 20)),
        ]),
        const SizedBox(height: 4),
        Text('Persian: $persian', style: TextStyle(fontStyle: FontStyle.italic)),
        Text(
          script,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'NotoNastaliqUrdu',
          ),
        ),
      ],
    );
  }

  Widget _buildStep(String math, String persian) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(math, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text(persian),
        ],
      ),
    );
  }

  Widget _buildPracticeProblem(String number, String breakdown) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$number = $breakdown', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Text('Try to say it in Persian!'),
        ],
      ),
    );
  }
}
