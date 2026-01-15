// Part 5
import 'package:flutter/material.dart';
import 'prepositions_page.dart';

class ConjunctionsPage extends StatelessWidget {
  const ConjunctionsPage({super.key});

  final List<Map<String, dynamic>> conjunctions = const [
    {
      'persian': 'و',
      'pronunciation': 'va',
      'english': 'and',
      'example': 'man va tu',
      'script': 'من و تو',
      'meaning': 'I and you',
    },
    {
      'persian': 'یا',
      'pronunciation': 'yâ',
      'english': 'or',
      'example': 'seb yâ mâlta',
      'script': 'سیب یا مالته',
      'meaning': 'apple or orange',
    },
    {
      'persian': 'اما',
      'pronunciation': 'amâ',
      'english': 'but',
      'example': 'man me-xâham, amâ na me-tavânam',
      'script': 'من می‌خواهم، اما نمی‌توانم',
      'meaning': 'I want, but I cannot',
    },
    {
      'persian': 'چونکه / زیرا',
      'pronunciation': 'zerâ / cûnki',
      'english': 'because',
      'example': 'na me-ravam cûnki bemâram',
      'script': 'نمی‌روم چونکه بیمارم',
      'meaning': 'I am not going because I am sick',
    },
    {
      'persian': 'اگر',
      'pronunciation': 'agar',
      'english': 'if',
      'example': 'agar me-xâhî, biraw!',
      'script': '!اگر می‌خواهی برو',
      'meaning': 'If you want, go!',
    },
    {
      'persian': 'پس',
      'pronunciation': 'pas',
      'english': 'so / then',
      'example': 'bârân me-bârad, pas mâ dar xâna me-mânem',
      'script': 'باران می‌بارد، پس ما در خانه می‌مانیم',
      'meaning': 'It is raining, so we stay at home',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Conjunctions'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Persian Conjunctions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn how to connect ideas and sentences in Persian.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('Common Conjunctions'),

            // LIST OF CONJUNCTIONS
            ...conjunctions.map((cj) => _buildConjunctionCard(cj)),

            const SizedBox(height: 24),

            // USAGE TIPS
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
                        'Usage Tips',
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
                    '• Conjunctions usually come between the words or clauses they connect.\n'
                    '• "و" (va) can connect nouns, verbs, or entire sentences.\n'
                    '• "اگر" (agar) is often used at the beginning of conditional sentences.\n'
                    '• "چونکه" and "زیرا" are interchangeable for "because".',
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // EXAMPLE CONVERSATION
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.message, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Example Conversation',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildDialogLine(
                    'A:',
                    'me-xâhî biravî sînemâ?',
                    'می‌خواهی بروی سینما؟',
                    'Do you want to go to cinema?',
                  ),
                  _buildDialogLine(
                    'B:',
                    'me-xâham, amâ na me-tavânam',
                    'می‌خواهم، اما نمی‌توانم',
                    'I want, but I cannot',
                  ),
                  _buildDialogLine(
                    'A:',
                    'carâ?',
                    'چرا؟',
                    'Why?',
                  ),
                  _buildDialogLine(
                    'B:',
                    'cûnki kâr dâram',
                    'چونکه کار دارم',
                    'Because I have work',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('The Conjunction "ki" (که)'),
            const SizedBox(height: 8),
            Text(
              'In Persian, "ki" is used to connect relative clauses to the main clause or a noun. '
              'In this specific instance, it can be translated as "that" in English.',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
            ),

            const SizedBox(height: 24),

            // Ki example 1
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      labeledText(text: 'main clause', color: Colors.orange,),
                      const Icon(Icons.add, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      labeledText(text: 'ki', color: Colors.red,),
                      const Icon(Icons.add, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      labeledText(text: 'relative clause', color: Colors.black, spacing: 0,),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Example:',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      labeledText(text: 'I know', color: Colors.orange,),
                      labeledText(text: 'that', color: Colors.red,),
                      labeledText(text: 'you like bread', color: Colors.black, spacing: 0,),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      labeledText(text: 'man me-dânam,', color: Colors.orange,),
                      const Icon(Icons.add, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      labeledText(text: 'ki', color: Colors.red,),
                      const Icon(Icons.add, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      labeledText(text: 'tu nân xuš dârî', color: Colors.black, spacing: 0,),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      labeledText(text: 'تو نان خوش داری', color: Colors.black, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 6,),
                      labeledText(text: 'که', color: Colors.red, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 6,),
                      labeledText(text: 'من می‌دانم', color: Colors.orange, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0,),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'The word "ki" may be dropped colloquially.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            _buildSectionTitle('The Conjunction "ki" (که) for nouns'),
            const SizedBox(height: 8),
            Text(
              'There are several rules when using the conjunction "ki" for a noun’s relative clause.',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
            ),

            const SizedBox(height: 24),

            // Restrictive clause vs non-restrictive clause
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lime[200]!,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.lime[500]!),
              ),
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
                          'Restrictive clause vs non-restrictive clause',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Step description
                  const Text(
                    'Restrictive clause is a clause that provides a necessary information to identify the noun.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  
                  // Examples in 2 white boxes (VERTICAL STACK)
                  Column(
                    children: [
                      // Restrictive clause
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'noun', color: Colors.green,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: '-e', color: Colors.green,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'ki', color: Colors.red,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'relative clause', color: Colors.black, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Example 1:',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'the book', color: Colors.green,),
                                labeledText(text: 'that', color: Colors.red,),
                                labeledText(text: 'I gave to you', color: Colors.black, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'kitâb-e', color: Colors.green,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'ki', color: Colors.red,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'man ba tu dâdam', color: Colors.black, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'من به تو دادم', color: Colors.black, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                                labeledText(text: 'که', color: Colors.red, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                                labeledText(text: 'کتابی', color: Colors.green, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0,),
                              ],
                            ),
                            // const SizedBox(height: 8),
                            const SizedBox(height: 8),
                            Text(
                              'The noun "book" is only known to the speaker, hence why the relative clause is necessary to clarify what "book" the speaker is referring to.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Non-restrictive clause
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'noun', color: Colors.green,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'ki', color: Colors.red,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'relative clause', color: Colors.black, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Example 2:',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'this very book', color: Colors.green,),
                                labeledText(text: 'that', color: Colors.red,),
                                labeledText(text: 'I gave to you', color: Colors.black, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'în kitâb', color: Colors.green,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'ki', color: Colors.red,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'man ba tu dâdam', color: Colors.black, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'من به تو دادم', color: Colors.black, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                                labeledText(text: 'که', color: Colors.red, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                                labeledText(text: 'این کتاب', color: Colors.green, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0,),
                              ],
                            ),
                            // const SizedBox(height: 8),
                            const SizedBox(height: 8),
                            Text(
                              'The noun "book" is already known to both the speaker and the listener, hence why the relative clause is not necessary to clarify what "book" the speaker is referring to.\n\n'
                              'The relative clause simply adds more information about the noun. This kind of sentence can be said in scenarios where the speaker is physically pointing the book.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                  
                      // Additional note
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange[50],
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.orange[200]!),
                        ),
                        child: Text(
                          'Note: In Nastaliq, "-e" is simply written as ـی connected with the noun. '
                          'It is written as ـیی if the noun ends in ـو or ـا or ـه.\n\n'
                          'Specifically for Iran, it is written as ای if the noun ends in ـه.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange[800],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Restrictive clause with accusative noun
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lime[200]!,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.lime[500]!),
              ),
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
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '2',
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
                          'Accusative noun with relative clause',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Step description
                  const Text(
                    'All nouns with a relative clause is definite by default. '
                    '(Indefinite nouns can be marked by specifying the amount such as "one" or "some"). '
                    'Therefore, in this context, "râ" is used to mark if the noun is the accusative noun of the main sentence.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  
                  // Examples in 2 white boxes (VERTICAL STACK)
                  Column(
                    children: [  
                      // Noun with relative clause is the accusative noun
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Example 1:',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'Does father eat', color: Colors.orange,),
                                labeledText(text: 'the rice', color: Colors.green, spacing: 0,),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'that', color: Colors.red,),
                                labeledText(text: 'mom buys?', color: Colors.black, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'âyâ padar-am', color: Colors.orange,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'palaw-e râ', color: Colors.green,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'ki', color: Colors.red),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                // const SizedBox(width: 8),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'mâdar-am me-xarad,', color: Colors.black,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'me-xorad?', color: Colors.orange, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'که', color: Colors.red, fontSize: 20, fontFamily: 'NotoNastaliqUrdu'),
                                labeledText(text: 'پلویی را', color: Colors.green, fontSize: 20, fontFamily: 'NotoNastaliqUrdu'),
                                labeledText(text: 'ایا پدرم', color: Colors.orange, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'میخورد؟', color: Colors.orange, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                                labeledText(text: '،مادرم میخرد', color: Colors.black, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'The noun compound formed with "ki" and relative clause acts as a single noun. '
                              'Therefore, the entire noun phrase remains together in the main clause syntax of Subject + Object + Verb.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Noun with relative clause is NOT the accusative noun
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Example 2:',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'The man', color: Colors.green,),
                                labeledText(text: 'that', color: Colors.red,),
                                labeledText(text: 'met you', color: Colors.black, spacing: 0,),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'yesterday,', color: Colors.black,),
                                labeledText(text: 'who was he?', color: Colors.orange, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'mard-e', color: Colors.green,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'ki', color: Colors.red,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'dîroz bâ tu', color: Colors.black, spacing: 0),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // const Icon(Icons.add, size: 16, color: Colors.grey),
                                // const SizedBox(width: 8),
                                labeledText(text: 'mulâqât kard,', color: Colors.black,),
                                const Icon(Icons.add, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                labeledText(text: 'kî bûd?', color: Colors.orange, spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'دیروز با تو', color: Colors.black, fontSize: 20, fontFamily: 'NotoNastaliqUrdu'),
                                labeledText(text: 'که', color: Colors.red, fontSize: 20, fontFamily: 'NotoNastaliqUrdu'),
                                labeledText(text: 'مردی', color: Colors.green, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                labeledText(text: 'کی بود؟', color: Colors.orange, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                                labeledText(text: '،ملاقات کرد', color: Colors.black, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0,),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'In this sentence above, the noun "the man" is the subject of the sentence, not the accusative according to Persian’s SOV syntax. '
                              'Therefore, the word "râ" should not be used.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // NAV BUTTONS
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
                      MaterialPageRoute(builder: (context) => const PrepositionsPage()),
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
                        'Next: Prepositions',
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

  // SECTION TITLE
  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.red,
        ),
      ),
    );
  }

  // CONJUNCTION CARD
  Widget _buildConjunctionCard(Map<String, dynamic> cj) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  cj['persian'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'NotoNastaliqUrdu',
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // default for English word
                      ),
                      children: [
                        // const TextSpan(text: '  '),

                        // pronunciation in red
                        TextSpan(
                          text: '(${cj['pronunciation']})',
                          style: const TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
                        ),

                        const TextSpan(text: '  '),
                        TextSpan(text: cj['english']),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cj['script'],
                    style: const TextStyle(
                      fontFamily: 'NotoNastaliqUrdu',
                      fontSize: 18,
                    ),
                    textDirection: TextDirection.rtl,
                  ),

                  Text(
                    '(${cj['example']})',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.red,
                    ),
                  ),
                  
                  const SizedBox(height: 4),

                  Text('Meaning: ${cj['meaning']}'),
                ],
              ),
            ),
          ],
        ),
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
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: Text(
              speaker,
              style: const TextStyle(fontWeight: FontWeight.bold),
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
                    color: Colors.grey.shade700,
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

  Widget labeledText({
    required String text,
    String fontFamily = 'Courier',
    double fontSize = 16,
    Color color = Colors.black,
    double spacing = 8,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(width: spacing),
      ],
    );
  }
}
