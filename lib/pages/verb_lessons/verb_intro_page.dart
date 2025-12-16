// Part 1
// lib/pages/verb_lessons/verb_level1_intro_page.dart
import 'package:flutter/material.dart';
import 'verb_basics_page.dart';
// This is the existing page (should rename to verb_basics_page)

class VerbIntroPage extends StatefulWidget {
  const VerbIntroPage({super.key});

  @override
  State<VerbIntroPage> createState() => _VerbIntroPageState();
}

class _VerbIntroPageState extends State<VerbIntroPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Persian Verbs - Level 1',
      'subtitle': 'Present Tense Fundamentals',
      'content': 'Welcome to Level 1 of Persian verb conjugation!\n\n'
          'In this level, you will master the basics of Persian present tense. '
          'This foundation is crucial for building more complex verb forms.',
      'icon': Icons.dynamic_form,
    },
    {
      'title': 'What You\'ll Learn',
      'subtitle': 'By the end of Level 1, you will be able to:',
      'content': '✓ Conjugate regular verbs in present tense\n'
          '✓ Use correct pronoun endings\n'
          '✓ Apply the "me-" prefix correctly\n'
          '✓ Handle vowel collisions\n'
          '✓ Form basic sentences with verbs',
      'icon': Icons.school,
    },
    {
      'title': 'Course Structure',
      'subtitle': 'Level 1 contains 3 main sections:',
      'content': '1. **Present Tense Basics** - Learn the 3-step conjugation process\n'
          '2. **Conjugation Tables** - Practice with different verb patterns\n'
          '3. **Practice Exercises** - Apply what you\'ve learned\n\n'
          'Each section includes examples and interactive exercises.',
      'icon': Icons.list,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verbs - Level 1'),
        backgroundColor: Colors.green,
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
                ElevatedButton(
                  onPressed: _currentPage > 0
                      ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Previous'),
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
                            ? Colors.green 
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
                          builder: (context) => const VerbBasicsPage(), // Goes to existing page
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    _currentPage < _pages.length - 1 ? 'Next' : 'Start Lessons',
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
            pageData['icon'],
            size: 80,
            color: Colors.green,
          ),
          const SizedBox(height: 32),
          Text(
            pageData['title'],
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            pageData['subtitle'],
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