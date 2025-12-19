import 'package:flutter/material.dart';
import 'pronoun_table_page.dart';

class NounIntroPage extends StatefulWidget {
  const NounIntroPage({super.key});

  @override
  State<NounIntroPage> createState() => _NounIntroPageState();
}

class _NounIntroPageState extends State<NounIntroPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Persian Nouns - Level 1',
      'description': 'Learn basic Persian nouns, pronouns, and grammar rules.',
      'content': 'In this level, you will learn:\n\n'
          '• Persian pronouns\n'
          '• How to pluralize nouns\n'
          '• Using "râ" (را) in sentences\n'
          '• Practice with quizzes',
    },
    {
      'title': 'What You\'ll Learn',
      'description': 'By the end of Level 1, you will be able to:',
      'content': '✓ Use all Persian pronouns correctly\n'
          '✓ Pluralize any Persian noun\n'
          '✓ Know when to use "râ"\n'
          '✓ Form basic sentences with nouns\n'
          '✓ Pass the final quiz',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouns - Level 1'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildPage(_pages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous button
                OutlinedButton(
                  onPressed: _currentPage > 0
                      ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null, // disables button when inactive
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: BorderSide(
                      color: _currentPage > 0 ? Colors.teal : Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Previous',
                    style: TextStyle(
                      color: _currentPage > 0 ? Colors.teal : Colors.grey,
                    ),
                  ),
                ),
                
                // Page indicator
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index 
                            ? Colors.teal 
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                
                // Next/Start button
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PronounTablePage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _currentPage < _pages.length - 1 ? 'Next' : 'Start Lessons',
                        style: const TextStyle(color: Colors.white),
                      ),
                      if (_currentPage < _pages.length - 1) const SizedBox(width: 8),
                      if (_currentPage < _pages.length - 1)
                        const Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
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

  Widget _buildPage(Map<String, dynamic> pageData) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.text_fields,
            size: 80,
            color: Colors.teal,
          ),
          const SizedBox(height: 32),
          Text(
            pageData['title'],
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            pageData['description'],
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                pageData['content'],
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}