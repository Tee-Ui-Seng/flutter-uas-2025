// Part 4
import 'package:flutter/material.dart';
import 'conjunctions_page.dart';

class NegativeCopulaPage extends StatelessWidget {
  const NegativeCopulaPage({super.key});

  final List<Map<String, String>> conjugations = const [
    {'english': 'I am not', 'pronunciation': 'man nîstam', 'persian': 'من نیستم'},
    {'english': 'You are not', 'pronunciation': 'tu nîsti', 'persian': 'تو نیستی'},
    {'english': 'He/she is not', 'pronunciation': 'o nîst', 'persian': 'او نیست'},
    {'english': 'We are not', 'pronunciation': 'mâ nîstem', 'persian': 'ما نیستیم'},
    {'english': 'You (plural) are not', 'pronunciation': 'šumâ nîsted', 'persian': 'شما نیستید'},
    {'english': 'They are not', 'pronunciation': 'ânhâ nîstand', 'persian': 'آنها نیستند'},
  ];

  final List<Map<String, String>> examples = const [
    {'english': 'I am not sick', 'pronunciation': 'man bemâr nîstam', 'persian': 'من بیمار نیستم'},
    {'english': 'You are not tall', 'pronunciation': 'tu qad buland nîstî', 'persian': 'تو قد بلند نیستی'},
    {'english': 'He is not here', 'pronunciation': 'o injâ nîst', 'persian': 'او اینجا نیست'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Negative Copula'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Negative Forms of "astan"',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn how to form negative sentences using the Persian negative copula.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'How the Negative Copula Works',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Negative forms use the base word "nist" plus personal endings.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            _buildComparisonExample('Positive: man astam', 'Negative: man nistam'),
            _buildComparisonExample('Positive: to asti', 'Negative: to nisti'),
            _buildComparisonExample('Positive: u ast', 'Negative: u nist'),

            const SizedBox(height: 24),

            // ★★★ TABLE FOR ALL CONJUGATIONS ★★★
            _buildSectionTitle('Negative Copula Table'),
            _buildTable(conjugations),

            const SizedBox(height: 24),

            // Note
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber),
              ),
              child: const Text(
                '* Some speakers say colloquially: "šomâ nistin" (شما نیستین).',
                style: TextStyle(fontSize: 14),
              ),
            ),

            const SizedBox(height: 24),

            // ★★★ TABLE FOR EXAMPLE SENTENCES ★★★
            _buildSectionTitle('Example Sentences'),
            _buildTable(examples),

            const SizedBox(height: 24),

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
                      MaterialPageRoute(builder: (context) => const ConjunctionsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Next: Conjunctions'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.red,
      ),
    );
  }

  // ★★★ REUSABLE TABLE WIDGET ★★★
  Widget _buildTable(List<Map<String, String>> rows) {
    return Table(
      border: TableBorder.all(color: Colors.red.shade200),
      columnWidths: const {
        0: FlexColumnWidth(2), // English
        1: FlexColumnWidth(2), // Pronunciation
        2: FlexColumnWidth(2), // Persian
      },
      children: [
        // Header row
        TableRow(
          decoration: BoxDecoration(color: Colors.red.shade50),
          children: const [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('English', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('Pronunciation', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('Persian', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),

        // Content rows
        ...rows.map((row) {
          return TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(row['english']!),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(row['pronunciation']!),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  row['persian']!,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontFamily: 'NotoNastaliqUrdu'),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildComparisonExample(String positive, String negative) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(positive, style: const TextStyle(color: Colors.green)),
          Text(negative, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
