import 'package:flutter/material.dart';
import 'ra_quiz_page.dart';

class RaUsagePage extends StatelessWidget {
  const RaUsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Using "râ" (را)'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'The Direct Object Marker: "râ" (را)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Learn when and how to use the Persian direct object marker.',
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
                    _buildRuleCard(
                      title: 'What is "râ"?',
                      content:
                          '"Râ" (را) is a postposition that marks the direct object '
                          'in a Persian sentence. It comes after the direct object.',
                      examples: [
                        _exampleRa(
                          persian: 'man kitâb râ dîdam',
                          script: 'من کتاب را دیدم',
                          english: 'I saw the book',
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    _buildRuleCard(
                      title: 'When to use "râ"',
                      content: 'Use "râ" when:\n'
                          '1. The direct object is definite (specific)\n'
                          '2. The direct object is known to both speaker and listener\n'
                          '3. Referring to a particular thing or person',
                      examples: [
                        _exampleRa(
                          persian: 'man kitâb râ xândam',
                          script: 'من کتاب را خواندم',
                          english: 'I read the book (specific book)',
                        ),
                        _exampleRa(
                          persian: 'ânhâ în televizyun râ me-xarand',
                          script: 'آنها این تلویزیون را می‌خرند',
                          english: 'They buy this TV',
                        ),
                        _exampleRa(
                          persian: 'o ân ustâd râ me-šinâsad',
                          script: 'او آن استاد را می‌شناسد',
                          english: 'She knows that teacher',
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    _buildRuleCard(
                      title: 'When NOT to use "râ"',
                      content: 'Do NOT use "râ" when:\n'
                          '1. The direct object is indefinite (not specific)\n'
                          '2. Referring to a general category\n'
                          '3. With indefinite articles like "a" or "some"',
                      examples: [
                        _exampleRa(
                          persian: 'man kitâb me-xâham',
                          script: 'من کتاب می‌خواهم',
                          english: 'I want a book (any book)',
                        ),
                        _exampleRa(
                          persian: 'o seb xarîd',
                          script: 'او سیب خرید',
                          english: 'She bought some apples',
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    _buildRuleCard(
                      title: 'Position in sentence',
                      content: '"Râ" always comes immediately after the direct object, '
                          'before the verb.',
                      examples: [
                        _exampleRa(
                          persian: 'man (I) + kitâb (book)\n+ râ + dîdam (saw)', 
                          script: 'من کتاب را دیدم', 
                          english: 'Subject + Object + râ + Verb'
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Practice examples
                    Card(
                      color: Colors.teal.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Row(
                              children: [
                                Icon(Icons.translate, color: Colors.teal, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'Practice Examples',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal.shade700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _buildExample(
                              'Correct (definite):',
                              'I ate the apple → man sib râ xordam',
                            ),
                            const SizedBox(height: 8),
                            _buildExample(
                              'Correct (indefinite):',
                              'I ate an apple → man sib xordam',
                            ),
                            const SizedBox(height: 8),
                            _buildExample(
                              'Incorrect (unnecessary):',
                              'I want water → man âb râ mixâham ❌',
                              isCorrect: false,
                            ),
                          ],
                        ),
                      ),
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
                      MaterialPageRoute(builder: (context) => const RaQuizPage()),
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

  Widget _buildRuleCard({
    required String title,
    required String content,
    List<Widget> examples = const [],
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),

            if (examples.isNotEmpty) ...[
              const SizedBox(height: 12),
              ...examples,
            ],
          ],
        ),
      ),
    );
  }

  Widget _exampleRa({
    required String persian,
    required String script,
    required String english,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
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
              _highlightMultiple(
                persian,
                highlights: {
                  ' râ ': Colors.red,
                  ' în ': Colors.red.shade900,
                  ' ân ': Colors.red.shade900,
                },
                baseStyle: const TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _highlightMultiple(
                script,
                highlights: {
                  ' را ': Colors.red,
                  ' این ': Colors.red.shade900,
                  ' آن ': Colors.red.shade900,
                },
                baseStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                  fontFamily: 'NotoNastaliqUrdu',
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          _highlightMultiple(
            english,
            highlights: {
              ' the ': Colors.blue,
              ' this ': Colors.blue,
              ' that ': Colors.blue,
              ' râ ': Colors.red,
            },
            baseStyle: TextStyle(
              fontFamily: 'Courier',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _highlightMultiple(
    String text, {
    required Map<String, Color> highlights,
    TextStyle? baseStyle,
  }) {
    baseStyle ??= const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    final spans = <TextSpan>[];
    int start = 0;

    final regex = RegExp(
      highlights.keys.map(RegExp.escape).join('|'),
    );

    for (final match in regex.allMatches(text)) {
      if (match.start > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, match.start),
            style: baseStyle,
          ),
        );
      }

      final word = match.group(0)!;
      spans.add(
        TextSpan(
          text: word,
          style: baseStyle.copyWith(
            color: highlights[word],
          ),
        ),
      );

      start = match.end;
    }

    if (start < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(start),
          style: baseStyle,
        ),
      );
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: spans),
    );
  }

  Widget _buildExample(String label, String example, {bool isCorrect = true}) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isCorrect ? Colors.teal : Colors.red,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          // Format the example with highlighted words
          if (example.contains('→'))
            Column(
              children: [
                _highlightText(
                  example.split('→')[0].trim(),
                  highlightWord: isCorrect ? 'the' : 'râ',
                  highlightColor: isCorrect ? Colors.blue : Colors.red,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_downward, size: 16, color: Colors.grey[600]),
                  ],
                ),
                const SizedBox(height: 4),
                _highlightText(
                  example.split('→')[1].trim(),
                  highlightWord: isCorrect ? 'râ' : 'râ',
                  highlightColor: isCorrect ? Colors.red : Colors.red,
                ),
              ],
            )
          else
            Text(
              example,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
        ],
      ),
    );
  }

  Widget _highlightText(String text, {required String highlightWord, required Color highlightColor}) {
    final textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.grey[800],
    );
    
    final highlightStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: highlightColor,
    );
    
    // Split text by highlight word
    final parts = text.split(highlightWord);
    
    return RichText(
      text: TextSpan(
        children: [
          for (int i = 0; i < parts.length; i++) ...[
            if (parts[i].isNotEmpty)
              TextSpan(
                text: parts[i],
                style: textStyle,
              ),
            if (i < parts.length - 1)
              TextSpan(
                text: highlightWord,
                style: highlightStyle,
              ),
          ]
        ],
      ),
    );
  }
}