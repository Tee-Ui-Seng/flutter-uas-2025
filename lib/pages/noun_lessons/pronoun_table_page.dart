import 'package:flutter/material.dart';
import 'pluralization_page.dart';

class PronounTablePage extends StatelessWidget {
  const PronounTablePage({super.key});

  final List<Map<String, String>> basicPronouns = const [
    {'english': 'I', 'persian': 'man', 'script': 'من'},
    {'english': 'You', 'persian': 'tu', 'script': 'تو'},
    {'english': 'He/She', 'persian': 'o', 'script': 'او'},
    {'english': 'We', 'persian': 'mâ', 'script': 'ما'},
    {'english': 'You (plural)', 'persian': 'šumâ', 'script': 'شما'},
    {'english': 'They', 'persian': 'ânhâ', 'script': 'آنها'},
  ];

  final List<Map<String, String>> specialPronouns = const [
    {'english': 'He (man)', 'persian': 'o mard', 'script': 'او مرد'},
    {'english': 'She (woman)', 'persian': 'o zan', 'script': 'او زن'},
    {'english': 'This (proximal)', 'persian': 'în', 'script': 'این'},
    {'english': 'That (distal)', 'persian': 'ân', 'script': 'آن'}, 
    {'english': 'You', 'persian': 'šumâ', 'script': 'شما', 'formal': '1'},
    {'english': 'He/She', 'persian': 'vay', 'script': 'وی', 'formal': '1'},
    {'english': 'He/She/They', 'persian': 'ešân', 'script': 'ایشان', 'formal': '1'},
  ];

  final List<Map<String, String>> examples = const [
    {
      'english': 'I am a student',
      'persian': 'man dânešjû astam',
      'script': 'من دانشجو استم'
    },
    {
      'english': 'You are kind',
      'persian': 'tu mehrabân astî',
      'script': 'تو مهربان استی'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persian Pronouns'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
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
                  'Persian Pronouns',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Learn basic and special pronouns in Persian',
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
                    // ---------- BASIC PRONOUNS SECTION ----------
                    _buildSectionHeader('Basic Pronouns'),
                    const SizedBox(height: 12),
                    
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.teal.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Header
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'English',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Pronunciation',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Script',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Rows
                          ..._buildPronounRows(basicPronouns),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ---------- SPECIAL PRONOUNS SECTION ----------
                    _buildSectionHeader('Special Pronouns'),
                    const SizedBox(height: 8),
                    
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF8E1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFFFD54F)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline_rounded, color: Color(0xFFF57C00)),
                              const SizedBox(width: 8),
                              Text(
                                'Formal & Other Pronouns',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF57C00),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade200),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                // Header
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF57C00),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Type',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Pronunciation',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Script',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                // Rows
                                ..._buildSpecialPronounRows(specialPronouns),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ---------- EXAMPLE SENTENCES SECTION ----------
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.teal),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.translate, color: Colors.teal, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Example Sentences',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal.shade700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          ...examples.map((example) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.teal.shade100),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Persian Script
                                  Text(
                                    example['script']!,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'NotoNastaliqUrdu',
                                      color: Colors.teal.shade800,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  
                                  // Pronunciation
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.teal.shade100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      example['persian']!,
                                      style: TextStyle(
                                        color: Colors.teal.shade700,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  
                                  // English
                                  Text(
                                    example['english']!,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ---------- NAVIGATION BUTTONS ----------
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: BorderSide(color: Colors.teal),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PluralizationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Next: Pluralization',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          height: 2,
          width: 40,
          color: Colors.teal,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade800,
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            margin: const EdgeInsets.only(left: 12),
            color: Colors.teal.shade100,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPronounRows(List<Map<String, String>> pronouns) {
    return List.generate(pronouns.length, (index) {
      final pronoun = pronouns[index];
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: index == pronouns.length - 1 
                  ? Colors.transparent 
                  : Colors.grey.shade200,
            ),
          ),
          color: index.isOdd ? Colors.grey.shade50 : Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                pronoun['english']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.teal.shade100),
                  ),
                  child: Text(
                    pronoun['persian']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.teal.shade700,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  pronoun['script']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'NotoNastaliqUrdu',
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  List<Widget> _buildSpecialPronounRows(List<Map<String, String>> pronouns) {
    return List.generate(pronouns.length, (index) {
      final pronoun = pronouns[index];
      final isFormal = pronoun['formal'] == '1';

      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: index == pronouns.length - 1 
                  ? Colors.transparent 
                  : Colors.grey.shade200,
            ),
          ),
          color: index.isOdd ? Colors.grey.shade50 : Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    pronoun['english']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isFormal ? Color(0xFFF57C00) : Colors.black87,
                    ),
                  ),
                  if (isFormal) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Color(0xFFFFB74D)),
                      ),
                      child: const Text(
                        'FORMAL',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF57C00),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: isFormal ? Color(0xFFFFF3E0) : Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isFormal ? Color(0xFFFFB74D) : Color(0xFF81C784),
                    ),
                  ),
                  child: Text(
                    pronoun['persian']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: isFormal ? Color(0xFFF57C00) : Color(0xFF2E7D32),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isFormal ? Color(0xFFFFB74D) : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  pronoun['script']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'NotoNastaliqUrdu',
                    color: isFormal ? Color(0xFFF57C00) : Colors.black87,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

// final isFormal = pronoun['english']!.contains('formal');