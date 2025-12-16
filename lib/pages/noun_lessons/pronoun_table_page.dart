import 'package:flutter/material.dart';
import 'pluralization_page.dart';

class PronounTablePage extends StatelessWidget {
  const PronounTablePage({super.key});

  final List<Map<String, String>> pronouns = const [
    {'english': 'I', 'persian': 'man', 'script': 'من'},
    {'english': 'You', 'persian': 'tu', 'script': 'تو'},
    {'english': 'He/She', 'persian': 'o', 'script': 'او'},
    {'english': 'He (man)', 'persian': 'o mard', 'script': 'او مرد'},
    {'english': 'She (woman)', 'persian': 'o zan', 'script': 'او زن'},
    {'english': 'We', 'persian': 'mâ', 'script': 'ما'},
    {'english': 'You (plural)', 'persian': 'šumâ', 'script': 'شما'},
    {'english': 'They', 'persian': 'ânha', 'script': 'آنها'},
  ];

  final List<Map<String, String>> examples = const [
    {
      'english': 'I am a student',
      'pronunciation': 'man dânešju hastam',
      'script': 'من دانشجو هستم'
    },
    {
      'english': 'You are kind',
      'pronunciation': 'tu mehrabân hasti',
      'script': 'تو مهربان هستی'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persian Pronouns'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // ---------- TITLE ----------
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Persian Pronouns Table',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Learn the basic pronouns in Persian:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // ============= MAIN SCROLL AREA =============
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // ---------- PRONOUN TABLE ----------
                    _buildPronounHeader(),
                    _buildPronounRows(),

                    const SizedBox(height: 24),

                    // ---------- EXAMPLE SENTENCES TABLE ----------
                    Card(
                      elevation: 0,
                      color: Colors.teal.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Example Sentences:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildExampleTable(),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

          // ---------- NAVIGATION BUTTONS ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PluralizationPage(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text('Next: Pluralization'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // PRONOUN TABLE HEADER
  // ------------------------------------------------------------
  Widget _buildPronounHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'English',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Pronunciation',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Script',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // PRONOUN TABLE ROWS
  // ------------------------------------------------------------
  Widget _buildPronounRows() {
    return Column(
      children: pronouns.map((p) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    p['english']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    p['persian']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    p['script']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'NotoNastaliqUrdu',
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ------------------------------------------------------------
  // EXAMPLE SENTENCE TABLE
  // ------------------------------------------------------------
  Widget _buildExampleTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      columnWidths: const {
        0: FlexColumnWidth(1.2),
        1: FlexColumnWidth(1.3),
        2: FlexColumnWidth(1.2),
      },
      children: [
        // Header Row
        const TableRow(
          decoration: BoxDecoration(color: Color(0xFFE0F2F1)),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'English',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Pronunciation',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Script',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        // Content Rows
        ...examples.map((ex) {
          return TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(ex['english']!),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(ex['pronunciation']!),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ex['script']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'NotoNastaliqUrdu',
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
