// Part 1 
import 'package:flutter/material.dart';
import 'greetings_page.dart';

class ConversationIntroPage extends StatefulWidget {
  const ConversationIntroPage({super.key});

  @override
  State<ConversationIntroPage> createState() => _ConversationIntroPageState();
}

class _ConversationIntroPageState extends State<ConversationIntroPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Persian Conversation - Level 1',
      'subtitle': 'Greetings & Introductions',
      'content': 'In this level, you will learn:\n\n'
          '• Basic Persian greetings\n'
          '• How to introduce yourself\n'
          '• Polite phrases and expressions\n'
          '• Time-specific greetings\n'
          '• How to say goodbye\n'
          '• Practice conversations',
      'icon': Icons.chat,
    },
    {
      'title': 'What You\'ll Learn',
      'subtitle': 'By the end of Level 1, you will be able to:',
      'content': '✓ Greet people in Persian\n'
          '✓ Introduce yourself and ask about others\n'
          '✓ Use polite phrases appropriately\n'
          '✓ Use time-specific greetings\n'
          '✓ Have basic conversations\n'
          '✓ Say goodbye properly',
      'icon': Icons.school,
    },
    {
      'title': 'Course Structure',
      'subtitle': 'Level 1 contains 7 main sections:',
      'content': '1. **Basic Greetings** - Hello, how are you?\n'
          '2. **Introductions** - My name is..., I\'m from...\n'
          '3. **Polite Phrases** - Thank you, excuse me, please\n'
          '4. **Time Greetings** - Good morning, good night\n'
          '5. **Farewells** - Goodbye, see you later\n'
          '6. **Practice Conversations** - Real-life scenarios\n'
          '7. **Final Quiz** - Test your conversation skills',
      'icon': Icons.list,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversation - Level 1'),
        backgroundColor: Colors.blue,
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
                      color: _currentPage > 0 ? Colors.blue : Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Previous',
                    style: TextStyle(
                      color: _currentPage > 0 ? Colors.blue : Colors.grey,
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
                            ? Colors.blue 
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
                          builder: (context) => const GreetingsPage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
            pageData['icon'],
            size: 80,
            color: Colors.blue,
          ),
          const SizedBox(height: 32),
          Text(
            pageData['title'],
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
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