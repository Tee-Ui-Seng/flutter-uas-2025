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
    {'english': 'You (pl) are', 'pronunciation': 'šumâ asted*', 'persian': 'شما استید'},
    {'english': 'They are', 'pronunciation': 'ânhâ astand', 'persian': 'آنها استند'},
  ];

  final List<Map<String, String>> examples = const [
    {'english': 'I am a teacher', 'pronunciation': 'man muallim astam', 'persian': 'من معلم استم'},
    {'english': 'You are kind', 'pronunciation': 'tu mehrabân astî', 'persian': 'تو مهربان استی'},
    {'english': 'He is at home', 'pronunciation': 'o dar xâna ast', 'persian': 'او در خانه است'},
  ];

  final List<Map<String, String>> shortForms = const [
    {'english': 'I am\nsmart', 'full': 'hošyâr astam', 'short': 'hošyâr-am', 'persian': 'من هوشیارم'},
    {'english': 'You are\nsmart', 'full': 'hošyâr astî', 'short': 'hošyâr-î', 'persian': 'تو هوشیاری'},
    {'english': 'He is\nsmart', 'full': 'hošyâr ast', 'short': 'hošyâr ast', 'persian': 'او هوشیار است'},
    {'english': 'We are\nsmart', 'full': 'hošyâr astem', 'short': 'hošyâr-em', 'persian': 'ما هوشیاریم'},
    {'english': 'You (pl) are\nsmart', 'full': 'hošyâr asted', 'short': 'hošyâr-ed', 'persian': 'شما هوشیارید'},
    {'english': 'They are\nsmart', 'full': 'hošyâr astand', 'short': 'hošyâr-and', 'persian': 'آنها هوشیارند'},
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Positive Copula'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE8F5E9),
              Color(0xFFF1F8E9),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2E7D32)),
                    ),
                    Expanded(
                      child: Text(
                        'Positive Copula',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2E7D32).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.check_circle_outline_rounded,
                        color: Color(0xFF2E7D32),
                        size: 24,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                Text(
                  'Learn how to form positive sentences in Persian',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                
                const SizedBox(height: 32),

                // Concept Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2E7D32).withValues(alpha: 0.1),
                        Color(0xFF388E3C).withValues(alpha: 0.05),
                    ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFF2E7D32).withValues(alpha: 0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Color(0xFF2E7D32).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.lightbulb_outline_rounded,
                              color: Color(0xFF2E7D32),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Understanding "astan"',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E7D32),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'The verb "astan" (to be) is the most common copula in Persian. It attaches pronoun suffixes to form positive statements.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Conjugations Table
                _buildSectionHeader('Positive Copula Conjugations'),
                const SizedBox(height: 16),
                
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: _buildTable(conjugations),
                  ),
                ),

                const SizedBox(height: 32),

                // Note Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF8E1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFFFD54F)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: Color(0xFFF57C00),
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pronunciation Note',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF57C00),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Colloquially (in Hazaragi), people may say "šumâ asten" (شما استین).',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade800,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Examples Section
                _buildSectionHeader('Example Sentences'),
                const SizedBox(height: 16),
                
                ...examples.map((example) => _buildExampleCard(example)).toList(),

                const SizedBox(height: 32),

                // Short Forms Table
                _buildSectionHeader('Short Forms of Copula'),
                const SizedBox(height: 8),
                
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.shortcut_outlined,
                            color: Colors.blue.shade800,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Contraction Rule',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'The copula (astan) can be (informally) contracted and attached to adjectives:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                          height: 1.4,
                        ),
                      ),
                      // const SizedBox(height: 4),
                      // Text(
                      //   'Example: "man hošyâr astam" → "man hošyâr-am"',
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.blue.shade700,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [   
                            _buildDialogLine(
                              '1',
                              'ânhâ qad baland astand.',
                              'آنها قد بلند استند.',
                              'They are tall. (long form)',
                            ),
                            _buildDialogLine(
                              '2',
                              'ânha qad baland-and.',
                              'آنها قد بلندند.',
                              'They are tall. (short form)',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'The short forms can also be attached to nouns although this usage is less common:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [   
                            _buildDialogLine(
                              '1',
                              'mâ muallim astem.',
                              'ما معلم استیم.',
                              'We are teachers. (long form)',
                            ),
                            _buildDialogLine(
                              '2',
                              'mâ muallim-em.',
                              'ما معلمیم.',
                              'We are teachers. (short form)',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'The word "ast" (است) has no short form except after â:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [   
                            _buildDialogLine(
                              'â:',
                              'în aždahâ-st.',
                              'این اژدهاست.',
                              'It’s a dragon.',
                            ),
                            _buildDialogLine(
                              'a:',
                              'în paranda ast.',
                              'این پرنده است.',
                              'It’s a bird.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Short Forms Table
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: _buildShortFormsTable(shortForms),
                  ),
                ),

                const SizedBox(height: 16),

                // Note Box
                // Container(
                //   padding: const EdgeInsets.all(16),
                //   decoration: BoxDecoration(
                //     color: Color(0xFFFFF8E1),
                //     borderRadius: BorderRadius.circular(12),
                //     border: Border.all(color: Color(0xFFFFD54F)),
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.info_outline_rounded,
                //         color: Color(0xFFF57C00),
                //         size: 24,
                //       ),
                //       const SizedBox(width: 12),
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'About: Short forms after vowels',
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 color: Color(0xFFF57C00),
                //                 fontSize: 15,
                //               ),
                //             ),
                //             const SizedBox(height: 4),
                //             Text(
                //               'The use of short forms are generally avoided after words ending in vowels.',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.grey.shade800,
                //                 fontStyle: FontStyle.italic,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                // const SizedBox(height: 16),

                // Note about short forms
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF8E1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFFFD54F)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.translate_rounded,
                            color: Color(0xFFF57C00),
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About: Short forms after vowels',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF57C00),
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'The short form is written with "y" (ی) after "â" (ا) and written separately in Nastaliq after other vowels:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xFFFFD54F)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [   
                            _buildDialogLine(
                              'â:',
                              'man aždahâ-yam.',
                              'من اژدها‌یم.',
                              'I am a dragon.',
                            ),
                            _buildDialogLine(
                              'â:',
                              'mâ înjâ-yem.',
                              'ما اینجاییم.',
                              'We are here.',
                            ),
                            _buildDialogLine(
                              'î:',
                              'tu afğânistânî-î.',
                              'تو افغانستانی‌ای',
                              'You are an Afghan.',
                            ),
                            _buildDialogLine(
                              'a:',
                              'ânhâ murda-and.',
                              'آنها مرده‌اند',
                              'They’re dead.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Note about short forms
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade300),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.lightbulb_rounded,
                            color: Colors.blue.shade800,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Important Note about Short Forms',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade800,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'The short form can NOT be used in:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                          Expanded(
                                            child: Text(
                                              'Negative sentences',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade800,
                                                height: 1.4,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                          Expanded(
                                            child: Text(
                                              'With proper nouns (names of people, places, etc.) except for adjective forms suffixed with -î (e.g., îrânî).',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade800,
                                                height: 1.4,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [   
                            _buildDialogLine(
                              '1',
                              'man nîlûfar astam.',
                              'من نیلوفر هستم.',
                              'I am Nilufar.',
                            ),
                            _buildDialogLine(
                              '2',
                              'mâ xušhâl nestem.',
                              'ما خوشحال نیستیم.',
                              'We are not happy.',
                            ),
                            _buildDialogLine(
                              '3',
                              'ânhâ îrânî-and.',
                              'آنها ایرانی‌اند',
                              'They’re Iranians.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Navigation Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        side: BorderSide(color: Color(0xFF2E7D32)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Color(0xFF2E7D32)),
                      ),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2E7D32),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Next: Negative Forms',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                
                // const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2E7D32),
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _buildTable(List<Map<String, String>> rows) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF2E7D32),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    'English',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Pronunciation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Persian',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Rows
          ...rows.map((row) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
                color: rows.indexOf(row).isOdd ? Colors.grey.shade50 : Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      row['english']!,
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      row['pronunciation']!,
                      style: TextStyle(
                        color: Color(0xFF2E7D32),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      row['persian']!,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'NotoNastaliqUrdu',
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildShortFormsTable(List<Map<String, String>> rows) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'English',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Copula',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Persian',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Rows
          ...rows.map((row) {
            return Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
                color: rows.indexOf(row).isOdd ? Colors.grey.shade50 : Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      row['english']!,
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFF2E7D32).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xFF2E7D32).withValues(alpha: 0.3)),
                        ),
                        child: Column(
                          children: [
                            // SHORT FORM (top, bigger)
                            _highlightAdjective(
                              row['short']!,
                              isShort: true,
                            ),
                            const SizedBox(height: 6),
                            // FULL FORM (below, smaller)
                            _highlightAdjective(
                              row['full']!,
                              isShort: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      row['persian']!,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'NotoNastaliqUrdu',
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //     decoration: BoxDecoration(
                  //       color: Colors.blue.shade50,
                  //       borderRadius: BorderRadius.circular(6),
                  //       border: Border.all(color: Colors.blue.shade100),
                  //     ),
                  //     child: Text(
                  //       row['full']!,
                  //       style: TextStyle(
                  //         color: Colors.blue.shade800,
                  //         fontStyle: FontStyle.italic,
                  //         fontSize: 13,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFF2E7D32).withValues(alpha: 0.1),
                  //       borderRadius: BorderRadius.circular(6),
                  //       border: Border.all(color: Color(0xFF2E7D32).withValues(alpha: 0.3)),
                  //     ),
                  //     child: Text(
                  //       row['short']!,
                  //       style: TextStyle(
                  //         color: Color(0xFF2E7D32),
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 14,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _highlightAdjective(String text, {required bool isShort}) {
    final parts = text.split(' ');

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: parts.map((word) {
          const target = 'hošyâr';

          if (!word.contains(target)) {
            // Normal word
            return TextSpan(
              text: '$word ',
              style: TextStyle(
                fontSize: isShort ? 16 : 13,
                fontWeight: isShort ? FontWeight.bold : FontWeight.w500,
                color: const Color(0xFF2E7D32),
                fontStyle: isShort ? FontStyle.normal : FontStyle.italic,
              ),
            );
          }

          final start = word.indexOf(target);
          final before = word.substring(0, start);
          final after = word.substring(start + target.length);

          return TextSpan(
            children: [
              if (before.isNotEmpty)
                TextSpan(
                  text: before,
                  style: TextStyle(
                    fontSize: isShort ? 16 : 13,
                    fontWeight: isShort ? FontWeight.bold : FontWeight.w500,
                    color: const Color(0xFF2E7D32),
                    fontStyle: isShort ? FontStyle.normal : FontStyle.italic,
                  ),
                ),

              // 🔴 highlighted "hošyâr"
              TextSpan(
                text: target,
                style: TextStyle(
                  fontSize: isShort ? 16 : 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
              ),

              if (after.isNotEmpty)
                TextSpan(
                  text: after,
                  style: TextStyle(
                    fontSize: isShort ? 16 : 13,
                    fontWeight: isShort ? FontWeight.bold : FontWeight.w500,
                    color: const Color(0xFF2E7D32),
                    fontStyle: isShort ? FontStyle.normal : FontStyle.italic,
                  ),
                ),

              const TextSpan(text: ' '),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExampleCard(Map<String, String> example) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Color(0xFF2E7D32).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${examples.indexOf(example) + 1}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  example['english']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF2E7D32).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  example['pronunciation']!,
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                example['persian']!,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'NotoNastaliqUrdu',
                  color: Color(0xFF2E7D32),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // DIALOG LINES
  Widget _buildDialogLine(
    String speaker,
    String persian,
    String script,
    String english,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: Text(
              speaker,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nastaliq
                Text(
                  script,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'NotoNastaliqUrdu',
                  ),
                  textDirection: TextDirection.rtl,
                ),

                // Romanization
                Text(
                  persian,
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    height: 1.3,
                  ),
                ),

                // English
                Text(
                  english,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}