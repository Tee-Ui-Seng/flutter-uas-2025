import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_uas/pages/verb_lessons/verb_intro_page.dart';
import 'package:flutter_application_uas/pages/noun_lessons/noun_intro_page.dart';
import 'package:flutter_application_uas/pages/grammar_lessons/grammar_intro_page.dart';
import 'package:flutter_application_uas/pages/pronunciation_lessons/pronunciation_intro_page.dart';
import 'package:flutter_application_uas/pages/vocabulary_lessons/vocabulary_intro_page.dart';
import 'package:flutter_application_uas/pages/conversation_lessons/conversation_intro_page.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../models/user_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Unified module configuration array
  static final List<Map<String, dynamic>> _modules = [
    {
      'id': 'verbs',
      'title': 'Verbs',
      'description': 'Learn conjugations of Persian Verbs',
      'icon': Icons.dynamic_form_rounded,
      'color': Colors.green,
      'dialogTitle': 'Verb Conjugation Practice',
      'dialogDescription': 'Learn conjugations and verb compounds of Persian Language',
      'levels': [
        {
          'level': 1,
          'title': 'Level 1: Present Tense',
          'subtitle': 'Learn basic present tense conjugation',
          'color': Colors.green,
          'introPage': const VerbIntroPage(),
        },
        {
          'level': 2,
          'title': 'Level 2: Past Tense',
          'subtitle': 'Master past tense conjugations',
          'color': Colors.orange,
        },
        {
          'level': 3,
          'title': 'Level 3: Advanced Tenses',
          'subtitle': 'Future, subjunctive, and conditional',
          'color': Colors.brown,
        },
      ],
    },
    {
      'id': 'nouns',
      'title': 'Nouns',
      'description': 'Learn nouns and formation rules',
      'icon': Icons.text_fields_rounded,
      'color': Colors.teal,
      'dialogTitle': 'Noun & Grammar Practice',
      'dialogDescription': 'Learn nouns and formation rules of Persian language',
      'levels': [
        {
          'level': 1,
          'title': 'Level 1: Basic Nouns',
          'subtitle': 'Pronouns, pluralization, and râ',
          'color': Colors.teal,
          'introPage': const NounIntroPage(),
        },
        {
          'level': 2,
          'title': 'Level 2: Advanced Nouns',
          'subtitle': 'Compound nouns, ezafe construction',
          'color': Colors.deepPurple,
        },
        {
          'level': 3,
          'title': 'Level 3: Noun Cases',
          'subtitle': 'Definite/indefinite, possession',
          'color': Colors.indigo,
        },
      ],
    },
    {
      'id': 'grammar',
      'title': 'Grammar',
      'description': 'Master grammar structures and rules of Persian language',
      'icon': Icons.menu_book_rounded,
      'color': Colors.red,
      'dialogTitle': 'Grammar Practice',
      'dialogDescription': 'Master grammar structures and rules of Persian language',
      'levels': [
        {
          'level': 1,
          'title': 'Level 1: Copula & Basics',
          'subtitle': 'Learn "astan/hastan" and basic structures',
          'color': Colors.red,
          'introPage': const GrammarIntroPage(),
        },
        {
          'level': 2,
          'title': 'Level 2: Sentence Structure',
          'subtitle': 'Word order, conjunctions, and prepositions',
          'color': Colors.pinkAccent,
        },
        {
          'level': 3,
          'title': 'Level 3: Complex Grammar',
          'subtitle': 'Relative clauses, conditionals, and moods',
          'color': Colors.deepPurpleAccent,
        },
      ],
    },
    {
      'id': 'vocabulary',
      'title': 'Vocabulary',
      'description': 'Build your vocabulary with essential Persian words',
      'icon': Icons.translate_rounded,
      'color': Colors.amber,
      'dialogTitle': 'Vocabulary Practice',
      'dialogDescription': 'Build your vocabulary with essential Persian words',
      'levels': [
        {
          'level': 1,
          'title': 'Level 1: Basic Vocabulary',
          'subtitle': 'Numbers, adverbs, and essential words',
          'color': Colors.amber,
          'introPage': const VocabularyIntroPage(),
        },
        {
          'level': 2,
          'title': 'Level 2: Daily Vocabulary',
          'subtitle': 'Food, family, travel, and common phrases',
          'color': Colors.orange,
        },
        {
          'level': 3,
          'title': 'Level 3: Advanced Vocabulary',
          'subtitle': 'Business, technology, and specialized terms',
          'color': Colors.deepOrange,
        },
      ],
    },
    {
      'id': 'conversation',
      'title': 'Conversation',
      'description': 'Practice daily conversations and dialogues',
      'icon': Icons.chat_bubble_outline_rounded,
      'color': Colors.blue,
      'dialogTitle': 'Conversation Practice',
      'dialogDescription': 'Practice daily conversations and dialogues',
      'levels': [
        {
          'level': 1,
          'title': 'Level 1: Greetings & Introductions',
          'subtitle': 'Basic greetings, introductions, and polite phrases',
          'color': Colors.blue,
          'introPage': const ConversationIntroPage(),
        },
        {
          'level': 2,
          'title': 'Level 2: Daily Life',
          'subtitle': 'Shopping, directions, restaurants, and services',
          'color': Colors.purple,
        },
        {
          'level': 3,
          'title': 'Level 3: Advanced Topics',
          'subtitle': 'Work, travel, culture, and in-depth discussions',
          'color': Colors.deepOrange,
        },
      ],
    },
    {
      'id': 'pronunciation',
      'title': 'Pronunciation',
      'description': 'Practice Persian sounds and accent',
      'icon': Icons.record_voice_over_rounded,
      'color': Colors.deepPurple,
      'dialogTitle': 'Pronunciation Practice',
      'dialogDescription': 'Practice Persian sounds and accent',
      'levels': [
        {
          'level': 1,
          'title': 'Level 1: Vowels & Consonants',
          'subtitle': 'Learn Persian vowel and consonant sounds',
          'color': Colors.deepPurple,
          'introPage': const PronunciationIntroPage(),
        },
        {
          'level': 2,
          'title': 'Level 2: Stress & Intonation',
          'subtitle': 'Word stress and sentence intonation patterns',
          'color': Colors.purple,
        },
        {
          'level': 3,
          'title': 'Level 3: Dialect Variations',
          'subtitle': 'Regional pronunciations and differences',
          'color': Colors.indigo,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final database = DatabaseService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Persian Learning App'),
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.leaderboard_outlined),
            onPressed: () => Navigator.pushNamed(context, '/leaderboard'),
            tooltip: 'Leaderboard',
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            tooltip: 'Profile',
          ),
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () async {
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Confirm Logout"),
                  content: const Text("Are you sure you want to log out?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );

              if (shouldLogout == true) {
                await AuthService().signOut();
              }
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: StreamBuilder<UserProfile>(
        stream: database.getUserProfileStream(auth.currentUser!.uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }

          final userProfile = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -------------------------------
                // WELCOME SECTION - Beautified
                // -------------------------------
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue.shade400, Colors.blue.shade600],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              userProfile.displayName[0].toUpperCase(),
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Salâm, ${userProfile.displayName}!',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.emoji_events_outlined,
                                    size: 18,
                                    color: Colors.amber.shade700,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '${userProfile.totalScore} points',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blueGrey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                              if (userProfile.achievements.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    '${userProfile.achievements.length} achievements unlocked',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.w500,
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

                const SizedBox(height: 32),

                // -------------------------------
                // LEARNING MODULES SECTION
                // -------------------------------
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu_book_rounded,
                        color: Colors.blue.shade700,
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Learning Modules',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                // -------------------------------
                // DYNAMIC GRID MODULES
                // -------------------------------
                LayoutBuilder(
                  builder: (context, constraints) {
                    final double cardSpacing = 16;
                    final double availableWidth = constraints.maxWidth;
                    final int crossAxisCount = availableWidth > 600 ? 3 : 2;
                    final double cardWidth =
                        (availableWidth - (cardSpacing * (crossAxisCount - 1))) /
                            crossAxisCount;

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: cardSpacing,
                        mainAxisSpacing: cardSpacing,
                        childAspectRatio: cardWidth / _calculateCardHeight(cardWidth),
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _modules.length,
                      itemBuilder: (context, index) {
                        final module = _modules[index];
                        return _buildModuleCard(
                          context,
                          title: module['title'] as String,
                          description: module['description'] as String,
                          icon: module['icon'] as IconData,
                          color: module['color'] as Color,
                          onTap: () => _showModuleLevelsDialog(
                            context,
                            module: module['id'] as String,
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 32),

                // -------------------------------
                // ACHIEVEMENTS SECTION
                // -------------------------------
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_events_rounded,
                        color: Colors.amber.shade700,
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Your Achievements',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                if (userProfile.achievements.isEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      children: [
                        Icon(
                          Icons.emoji_events_outlined,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'No achievements yet',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Complete lessons to earn achievements!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  SizedBox(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: userProfile.achievements.values
                          .take(6)
                          .map((achievement) {
                        final data = achievement as Map<String, dynamic>;
                        return Container(
                          width: 130,
                          margin: const EdgeInsets.only(right: 12),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.amber.shade300,
                                          Colors.amber.shade600,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.emoji_events,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    data['name'],
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  if (data.containsKey('points'))
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        '+${data['points']} pts',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green.shade700,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Calculate dynamic card height based on content
  double _calculateCardHeight(double cardWidth) {
    // Base height for icon and title
    double baseHeight = 180;
    return baseHeight;
  }

  // BEAUTIFIED MODULE CARD - Dynamic sizing
  Widget _buildModuleCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback? onTap,
  }) {
    // Get screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        splashColor: color.withValues(alpha: 0.1),
        highlightColor: color.withValues(alpha: 0.05),
        child: Container(
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon with gradient background (responsive sizing)
              Container(
                width: isSmallScreen ? 50 : 60,
                height: isSmallScreen ? 50 : 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withValues(alpha: 0.9),
                      color.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: isSmallScreen ? 24 : 30,
                  ),
                ),
              ),
              
              SizedBox(height: isSmallScreen ? 8 : 12),
              
              // Title with proper sizing and max lines
              Text(
                title,
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  fontWeight: FontWeight.w800,
                  color: color,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 8),
              
              // Description with Expanded instead of Flexible
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 11 : 13,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // "Learn More" indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Learn More',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 10 : 12,
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: isSmallScreen ? 12 : 14,
                    color: color,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // UNIFIED FUNCTION - Shows levels dialog for any module
  void _showModuleLevelsDialog(BuildContext context, {required String module}) {
    final moduleData = _modules.firstWhere(
      (m) => m['id'] == module,
      orElse: () => throw Exception('Module not found: $module'),
    );

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                moduleData['dialogTitle'] as String,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 8),
              
              // Description
              Text(
                moduleData['dialogDescription'] as String,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 24),
              
              // Level buttons
              SizedBox(
                height: 360,
                child: SingleChildScrollView(
                  child: Column(
                    children: (moduleData['levels'] as List<Map<String, dynamic>>)
                        .map((level) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildLevelButton(
                          context,
                          level: level['level'] as int,
                          title: level['title'] as String,
                          subtitle: level['subtitle'] as String,
                          color: level['color'] as Color,
                          moduleId: module,
                          levelData: level,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Cancel button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLevelButton(
    BuildContext context, {
    required int level,
    required String title,
    required String subtitle,
    required Color color,
    required String moduleId,
    required Map<String, dynamic> levelData,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.pop(context); // Close the dialog
          _navigateToModule(context, moduleId, level, levelData);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Level number circle
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$level',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: color,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.9),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Arrow icon
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToModule(
    BuildContext context,
    String moduleId,
    int level,
    Map<String, dynamic> levelData,
  ) {
    // Check if this level has an intro page defined
    if (levelData.containsKey('introPage')) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => levelData['introPage'] as Widget,
        ),
      );
    } else {
      _showComingSoon(context, level);
    }
  }

  void _showComingSoon(BuildContext context, int level) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.hourglass_top_rounded,
                size: 48,
                color: Colors.amber.shade700,
              ),
              const SizedBox(height: 16),
              Text(
                'Coming Soon!',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Level $level content is under development.',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.blue.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}