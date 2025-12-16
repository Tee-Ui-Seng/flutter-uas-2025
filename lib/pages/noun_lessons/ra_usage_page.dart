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
                      content: '"Râ" (را) is a postposition that marks the direct object '
                          'in a Persian sentence. It comes after the direct object.',
                      examples: [
                        'I saw the book → man ketâb râ didam',
                        'من کتاب را دیدم',
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
                        'I read the book (specific book) → man ketâb râ xândam',
                        'She knows the teacher → u ostâd râ mišenâsad',
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
                        'I want a book (any book) → man ketâb mixâham',
                        'She bought some apples → u sib xarid',
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    _buildRuleCard(
                      title: 'Position in sentence',
                      content: '"Râ" always comes immediately after the direct object, '
                          'before the verb.',
                      examples: [
                        'Subject + Object + râ + Verb',
                        'man (I) + ketâb (book) + râ + didam (saw)',
                        'من کتاب را دیدم',
                      ],
                    ),
                    
                    // Practice examples
                    Card(
                      color: Colors.teal.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Practice Examples:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            const SizedBox(height: 8),
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RaQuizPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text('Take Quiz'),
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
    required List<String> examples,
  }) {
    return Card(
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
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: examples.map((example) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    example,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: example.contains('→') 
                          ? null 
                          : 'NotoNastaliqUrdu',
                      fontStyle: example.contains('→') 
                          ? FontStyle.italic 
                          : null,
                    ),
                    textDirection: example.contains('→') 
                        ? TextDirection.ltr 
                        : TextDirection.rtl,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExample(String label, String example, {bool isCorrect = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isCorrect ? Colors.teal : Colors.red,
          ),
        ),
        Text(example),
      ],
    );
  }
}