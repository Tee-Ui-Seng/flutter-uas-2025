// Part 1
import 'package:flutter/material.dart';
import 'vowels_page.dart';

class PronunciationIntroPage extends StatefulWidget {
  const PronunciationIntroPage({super.key});

  @override
  State<PronunciationIntroPage> createState() => _PronunciationIntroPageState();
}

class _PronunciationIntroPageState extends State<PronunciationIntroPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Persian Pronunciation - Level 1',
      'description': 'Master Persian vowel and consonant sounds',
      'content': 'In this level, you will learn:\n\n'
          '• All Persian vowel sounds with IPA\n'
          '• Consonant pronunciation across dialects\n'
          '• Differences between Classical, Dari, Hazaragi, Tajik, and Iranian Persian\n'
          '• Practice with audio examples',
    },
    {
      'title': 'What You\'ll Learn',
      'description': 'By the end of Level 1, you will be able to:',
      'content': '✓ Pronounce all Persian vowels correctly\n'
          '✓ Distinguish between short and long vowels\n'
          '✓ Pronounce consonants with proper articulation\n'
          '✓ Recognize dialect variations\n'
          '✓ Use IPA notation for Persian sounds',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronunciation - Level 1'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
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
                      color: _currentPage > 0 ? Colors.deepPurple : Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Previous',
                    style: TextStyle(
                      color: _currentPage > 0 ? Colors.deepPurple : Colors.grey,
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
                            ? Colors.deepPurple 
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
                          builder: (context) => const VowelsPage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
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
            Icons.record_voice_over,
            size: 80,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 32),
          Text(
            pageData['title'],
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
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