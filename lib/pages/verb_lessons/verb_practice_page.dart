import 'package:flutter/material.dart';
import 'negative_verb_page.dart'; // New import
import 'verb_conjugation_page.dart';
import 'package:flutter_application_uas/services/database_service.dart';

class ConjugationPracticePage extends StatefulWidget {
  const ConjugationPracticePage({super.key});

  @override
  State<ConjugationPracticePage> createState() =>
      _ConjugationPracticePageState();
}

class _ConjugationPracticePageState extends State<ConjugationPracticePage> {
  final DatabaseService _database = DatabaseService();
  int _currentVerb = 0;
  int _score = 0;
  bool _practiceCompleted = false;

  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  final List<Map<String, dynamic>> _verbs = [
    {
      'infinitive': 'نوشیدن',
      'pronunciation': 'nošîdan',
      'english': 'to drink',
      'presentStem': 'نوش',
      'stemPronunciation': 'noš',
      'isIrregular': false,
      'latinAnswers': [
        'me-nošam',
        'me-nošî',
        'me-nošad',
        'me-nošem',
        'me-nošed',
        'me-nošand',
      ],
      'scriptAnswers': [
        'می‌نوشم',
        'می‌نوشی',
        'می‌نوشد',
        'می‌نوشیم',
        'می‌نوشید',
        'می‌نوشند',
      ],
    },
    {
      'infinitive': 'خوابیدن',
      'pronunciation': 'xâbîdan',
      'english': 'to sleep',
      'presentStem': 'خواب',
      'stemPronunciation': 'xâb',
      'isIrregular': false,
      'latinAnswers': [
        'me-xâbam',
        'me-xâbî',
        'me-xâbad',
        'me-xâbem',
        'me-xâbed',
        'me-xâband',
      ],
      'scriptAnswers': [
        'می‌خوابم',
        'می‌خوابی',
        'می‌خوابد',
        'می‌خوابیم',
        'می‌خوابید',
        'می‌خوابند',
      ],
    },
    {
      'infinitive': 'کار کردن',
      'pronunciation': 'kâr kardan',
      'english': 'to work',
      'presentStem': 'کن',
      'stemPronunciation': 'kun',
      'isIrregular': true,
      'explanation':
          'This verb contains the object "kâr" (work) and the main verb "kardan" (to do). Conjugate ONLY the main verb.',
      'latinAnswers': [
        'me-kunam',
        'me-kunî',
        'me-kunad',
        'me-kunem',
        'me-kuned',
        'me-kunand',
      ],
      'scriptAnswers': [
        'می‌کنم',
        'می‌کنی',
        'می‌کند',
        'می‌کنیم',
        'می‌کنید',
        'می‌کنند',
      ],
    },
    {
      'infinitive': 'بیدار شدن',
      'pronunciation': 'bedâr šudan',
      'english': 'to wake up',
      'presentStem': 'شو',
      'stemPronunciation': 'šaw',
      'isIrregular': true,
      'explanation':
          'This verb uses "šaw-" as the present stem. Conjugate ONLY the main verb.',
      'latinAnswers': [
        'me-šawam',
        'me-šawî',
        'me-šawad',
        'me-šawem',
        'me-šawed',
        'me-šawand',
      ],
      'scriptAnswers': [
        'می‌شوم',
        'می‌شوی',
        'می‌شود',
        'می‌شویم',
        'می‌شوید',
        'می‌شوند',
      ],
    },
  ];

  final List<Map<String, String>> _pronouns = [
    {'persian': 'من', 'latin': 'man', 'english': 'I', 'suffix': 'م'},
    {'persian': 'تو', 'latin': 'tu', 'english': 'You', 'suffix': 'ی'},
    {'persian': 'او', 'latin': 'o', 'english': 'He/She', 'suffix': 'د'},
    {'persian': 'ما', 'latin': 'mâ', 'english': 'We', 'suffix': 'یم'},
    {'persian': 'شما', 'latin': 'šumâ', 'english': 'You (plural)', 'suffix': 'ید'},
    {'persian': 'آنها', 'latin': 'ânhâ', 'english': 'They', 'suffix': 'ند'},
  ];

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verb = _verbs[_currentVerb];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conjugation Practice'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: _showInstructions,
            tooltip: 'Instructions',
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Verb Navigation Buttons
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _currentVerb > 0 ? _previousVerb : null,
                        icon: const Icon(Icons.arrow_back, size: 18),
                        label: const Text('Previous'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.deepPurple.shade200),
                        ),
                        child: Text(
                          'Verb ${_currentVerb + 1}/${_verbs.length}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed:
                            _currentVerb < _verbs.length - 1 ? _nextVerb : null,
                        icon: const Icon(Icons.arrow_forward, size: 18),
                        label: const Text('Next'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Verb Information Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            verb['english']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          if (verb['isIrregular'] == true)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.orange),
                              ),
                              child: const Text(
                                'Irregular',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Verb Details
                      _buildVerbDetail(
                        label: 'Infinitive',
                        persian: verb['infinitive']!,
                        latin: verb['pronunciation']!,
                      ),
                      const SizedBox(height: 8),
                      _buildVerbDetail(
                        label: 'Present Stem',
                        persian: verb['presentStem']!,
                        latin: verb['stemPronunciation']!,
                      ),
                      const SizedBox(height: 8),
                      _buildVerbDetail(
                        label: 'Meaning',
                        latin: verb['english']!,
                      ),

                      // Irregular verb explanation
                      if (verb['isIrregular'] == true)
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 12),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.orange.shade200),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.info,
                                  color: Colors.orange, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  verb['explanation']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.orange.shade800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Instructions
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.deepPurple.shade200),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lightbulb_outline,
                        color: Colors.deepPurple, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Conjugate this verb for all pronouns using the pattern: me- + stem + suffix',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Conjugation Table
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(color: Colors.grey.shade200),
                      verticalInside: BorderSide(color: Colors.grey.shade200),
                      top: const BorderSide(color: Colors.deepPurple, width: 2),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                    columnWidths: const {
                      0: FixedColumnWidth(80),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(),
                    },
                    children: [
                      // Table Header
                      TableRow(
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        children: [
                          _buildTableHeader('Pronoun'),
                          _buildTableHeader('Your Answer'),
                          _buildTableHeader('Correct Answer'),
                        ],
                      ),
                      // Table Rows
                      ...List.generate(6, (i) {
                        final pronoun = _pronouns[i];
                        final correctLatin = verb['latinAnswers'][i];
                        final correctScript = verb['scriptAnswers'][i];

                        final ans = _controllers[i].text.trim();
                        final isCorrect = ans.replaceAll(" ", "").toLowerCase() ==
                            correctLatin.replaceAll(" ", "").toLowerCase();
                        final hasAnswer = ans.isNotEmpty;
                        final showLatinAnswer = hasAnswer && isCorrect;

                        return TableRow(
                          decoration: BoxDecoration(
                            color: hasAnswer
                                ? (isCorrect
                                    ? Colors.green.shade50
                                    : Colors.red.shade50)
                                : Colors.white,
                          ),
                          children: [
                            // Pronoun Column (with Latin above Nastaliq)
                            Container(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pronoun['latin']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    pronoun['persian']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoNaskhArabic',
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Text(
                                    pronoun['english']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // User Answer Column
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextField(
                                controller: _controllers[i],
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  filled: hasAnswer,
                                  fillColor: hasAnswer
                                      ? (isCorrect
                                          ? Colors.green.shade50
                                          : Colors.red.shade50)
                                      : null,
                                  hintText: 'Type here...',
                                  suffixIcon: hasAnswer
                                      ? Icon(
                                          isCorrect
                                              ? Icons.check_circle
                                              : Icons.error,
                                          color: isCorrect
                                              ? Colors.green
                                              : Colors.red,
                                        )
                                      : null,
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                            // Correct Answer Column
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Latin answer - only shows when correct
                                  Text(
                                    correctLatin,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: showLatinAnswer
                                          ? Colors.deepPurple
                                          : Colors.deepPurple.withAlpha(0), // Transparent
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Script answer - always visible
                                  Text(
                                    correctScript,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'NotoNastaliqUrdu',
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Check Answers Button
              ElevatedButton.icon(
                onPressed: _checkAnswers,
                icon: const Icon(Icons.check_circle),
                label: const Text(
                  'Check Answers',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                ),
              ),

              const SizedBox(height: 30),

              // Navigation Section
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                'Continue Learning',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const VerbConjugationPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.menu_book, size: 18),
                    label: const Text('Conjugation Guide'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NegativeVerbPage(), // Changed to NegativeVerbPage
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward, size: 18),
                    label: const Text('Negative Verbs'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ],
              ),

              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerbDetail({
    required String label,
    String? persian,
    required String latin,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            if (persian != null)
              Text(
                persian,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'NotoNaskhArabic',
                ),
                textDirection: TextDirection.rtl,
              ),
            if (persian != null) const SizedBox(width: 12),
            Text(
              latin,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTableHeader(String title) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  void _nextVerb() {
    setState(() {
      _currentVerb++;
      for (var c in _controllers) c.clear();
    });
  }

  void _previousVerb() {
    setState(() {
      _currentVerb--;
      for (var c in _controllers) c.clear();
    });
  }

  void _checkAnswers() async {
    int correct = 0;
    final verb = _verbs[_currentVerb];

    for (int i = 0; i < 6; i++) {
      final ans = _controllers[i].text.trim().toLowerCase();
      final good = verb['latinAnswers'][i].toLowerCase();
      if (ans.replaceAll(" ", "") == good.replaceAll(" ", "")) {
        correct++;
      }
    }

    _score += correct;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Results'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You got $correct/6 correct!',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            if (correct == 6)
              const Text(
                'Perfect! 🎉',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )
            else if (correct >= 4)
              const Text(
                'Good job! 👍',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            else
              const Text(
                'Keep practicing! 💪',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showInstructions() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('How to Conjugate'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Follow these steps:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('1. Start with the present stem'),
              Text('2. Add "me-" prefix for present tense'),
              Text('3. Add the appropriate personal suffix:'),
              SizedBox(height: 4),
              Text('   • I (man) → add "-am"'),
              Text('   • You (tu) → add "-i"'),
              Text('   • He/She (o) → add "-ad"'),
              Text('   • We (mâ) → add "-em"'),
              Text('   • You plural (šumâ) → add "-ed"'),
              Text('   • They (ânhâ) → add "-and"'),
              SizedBox(height: 12),
              Text(
                'Example for "nošîdan" (to drink):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Stem: noš'),
              Text('Prefix: me-noš'),
              Text('I drink: me-noš-am'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}