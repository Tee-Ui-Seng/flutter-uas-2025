// Part 3
import 'package:flutter/material.dart';
import 'negative_copula_page.dart';

class PositiveCopulaPage extends StatelessWidget {
  const PositiveCopulaPage({super.key});

  final List<Map<String, String>> conjugations = const [
    {'english': 'I am', 'pronunciation': 'man astam', 'persian': 'من استم'},
    {'english': 'You are', 'pronunciation': 'tu astî', 'persian': 'تو استی'},
    {'english': 'He/she is', 'pronunciation': 'o ast', 'persian': 'او است'},
    {'english': 'We are', 'pronunciation': 'mâ astem', 'persian': 'ما استیم'},
    {'english': 'You (plural) are', 'pronunciation': 'šumâ asted*', 'persian': 'شما استید'},
    {'english': 'They are', 'pronunciation': 'âmhâ astand', 'persian': 'آنها استند'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Positive Copula'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Positive Forms of "astan"',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn how to form positive sentences with the Persian copula.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Conjugation table
            Expanded(
              child: ListView(
                children: [
                  _buildConjugationTable(),

                  const SizedBox(height: 20),

                  // Important note
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.amber),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Note:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '*Colloquially (as slang), people may say "šumâ asten" (شما استین).',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Example sentences table
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Example Sentences:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 8),

                        _buildExampleRow(
                          'I am a teacher',
                          'man moalem astam',
                          'من معلم استم',
                        ),

                        _divider(),

                        _buildExampleRow(
                          'You are kind',
                          'tu mehrabân astî',
                          'تو مهربان استی',
                        ),

                        _divider(),

                        _buildExampleRow(
                          'He is at home',
                          'o dar xâna ast',
                          'او در خانه است',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

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
                        builder: (context) => const NegativeCopulaPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Next: Negative Forms'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // -----------------------------
  //           TABLES
  // -----------------------------

  Widget _buildConjugationTable() {
    return Table(
      border: TableBorder.all(color: Colors.red),
      columnWidths: const {
        0: FlexColumnWidth(1),  // English
        1: FlexColumnWidth(1),  // Pronunciation
        2: FlexColumnWidth(1),      // Persian
      },
      children: [
        _tableHeader(['English', 'Pronunciation', 'Persian']),
        for (var row in conjugations)
          _tableRow(
            row['english']!,
            row['pronunciation']!,
            row['persian']!,
          ),
      ],
    );
  }

  TableRow _tableHeader(List<String> titles) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.red.shade100),
      children: titles
          .map(
            (t) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                t,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  TableRow _tableRow(String english, String pronunciation, String persian) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            english,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(pronunciation),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            persian,
            style: const TextStyle(
              fontFamily: 'NotoNastaliqUrdu',
              fontSize: 18,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
    );
  }

  // -----------------------------
  //      EXAMPLE TABLE ROWS
  // -----------------------------

  Widget _buildExampleRow(String english, String pronunciation, String persian) {
    return Table(
      border: const TableBorder(
        bottom: BorderSide(color: Colors.grey),
      ),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                english,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(pronunciation),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                persian,
                style: const TextStyle(
                  fontFamily: 'NotoNastaliqUrdu',
                  fontSize: 18,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _divider() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Divider(),
      );
}
