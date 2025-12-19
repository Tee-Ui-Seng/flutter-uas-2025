// Part 2
import 'package:flutter/material.dart';
import 'positive_copula_page.dart';

class CopulaExplanationPage extends StatelessWidget {
  const CopulaExplanationPage({super.key});

  final List<Map<String, String>> examples = const [
    {
      'english': 'These houses are big',
      'persian': 'in xâna-hâ buzurg astand',
      'script': 'این خانه ها بزرگ استند',
    },
    {
      'english': 'This is a book',
      'persian': 'in yak kitâb ast',
      'script': 'این یک کتاب است',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Copula'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is a Copula?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Understanding the Persian "to be" verb',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Definition',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'A copula is a word which connects the subject with the words which describe the subject. Think of it as the English word "to be", as in: I am sick, you are a man, she is not old, etc.',
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Persian Copula',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'In Persian, the main copula is "astan/hastan".',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 12),
                            _buildComparisonRow(
                              'Iran',
                              'Only the form "hastan" (هستن) is used',
                              'هستن',
                            ),
                            const SizedBox(height: 8),
                            _buildComparisonRow(
                              'Afghanistan',
                              'Both are accepted, although "astan" (استن) is more common',
                              'استن',
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'As such, this guide will use the form "astan".',
                              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Writing Difference',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'In Nastaliq script, the difference is between:',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 12),
                            _buildWritingExample(
                              'he docašma "ه"',
                              'Used for "hastan"',
                              'ه',
                            ),
                            const SizedBox(height: 8),
                            _buildWritingExample(
                              'alif "ا"',
                              'Used for "astan"',
                              'ا',
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Example sentences 
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red),
                      ),
                      child:
                        _buildExampleTable(),
                    ),
                  ],
                ),
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
                    side: BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PositiveCopulaPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Next: Positive Forms',
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

  Widget _buildComparisonRow(String region, String usage, String script) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            region,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(usage),
              const SizedBox(height: 4),
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
        ),
      ],
    );
  }

  Widget _buildWritingExample(String name, String usage, String character) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(usage),
              Text(
                character,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'NotoNastaliqUrdu',
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExampleTable() {
    return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.translate, color: Colors.red, size: 20),
          const SizedBox(width: 8),
          Text(
            'Example Sentences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
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

  // Widget _buildExample(String english, String pronunciation, String persian) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text('English: $english'),
  //       Text('Pronunciation: $pronunciation'),
  //       Text(
  //         'Persian: $persian',
  //         style: const TextStyle(
  //           fontSize: 18,
  //           fontFamily: 'NotoNastaliqUrdu',
  //         ),
  //         textDirection: TextDirection.rtl,
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildExampleTable(List<Map<String, String>> examples) {
  //   return Table(
  //     border: TableBorder.all(color: Colors.red),
  //     columnWidths: const {
  //       0: FlexColumnWidth(1.2),
  //       1: FlexColumnWidth(1.2),
  //       2: FlexColumnWidth(1),
  //     },
  //     children: [
  //       // Header row
  //       const TableRow(
  //         decoration: BoxDecoration(color: Color(0xFFE0E6EA)),
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: Text(
  //               'English',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.red,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: Text(
  //               'Pronunciation',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.red,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: Text(
  //               'Persian',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.red,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),

  //       // Dynamic rows
  //       for (final ex in examples)
  //         TableRow(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(ex['english']!),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(
  //                 ex['pronunciation']!,
  //                 style: const TextStyle(fontStyle: FontStyle.italic),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(
  //                 ex['persian']!,
  //                 textDirection: TextDirection.rtl,
  //                 style: const TextStyle(
  //                   fontSize: 18,
  //                   fontFamily: 'NotoNastaliqUrdu',
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //     ],
  //   );
  // }
}