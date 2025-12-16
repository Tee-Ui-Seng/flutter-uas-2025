import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_uas/pages/verb_lessons/verb_conjugation_page.dart';
import 'package:flutter_application_uas/pages/verb_lessons/verb_intro_page.dart';
import 'package:flutter_application_uas/pages/verb_lessons/verb_practice_page.dart';
import 'package:flutter_application_uas/pages/verb_lessons/verb_quiz_page.dart';
import 'package:flutter_application_uas/pages/pronunciation_lessons/pronunciation_intro_page.dart'; // Add this
import 'package:flutter_application_uas/pages/vocabulary_lessons/vocabulary_intro_page.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';
import 'pages/home_page.dart';
import 'pages/login_register_page.dart';
import 'pages/profile_page.dart';
import 'pages/quiz_page.dart';
import 'pages/leaderboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App with Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // In the routes section of MyApp widget
      routes: {
        '/': (context) => const AuthWrapper(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/leaderboard': (context) => const LeaderboardPage(),
        '/quiz': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return QuizPage(
            quizId: args['quizId'],
            quizName: args['quizName'],
          );
        },
        '/verb-intro': (context) => const VerbIntroPage(),
        '/verb-conjugation': (context) => const VerbConjugationPage(),
        '/verb-practice': (context) => const ConjugationPracticePage(),
        '/verb-quiz': (context) => const VerbPracticePage(),
        '/pronunciation-intro': (context) => const PronunciationIntroPage(), // Add this
        '/vocabulary-intro': (context) => const VocabularyIntroPage(),
      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _authService.userStream,
      builder: (context, snapshot) {
        // Show loading screen while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }
        
        // If user is logged in, show HomePage
        if (snapshot.hasData) {
          return const HomePage();
        }
        
        // If user is not logged in, show LoginRegisterPage
        return const LoginRegisterPage();
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              'Quiz App',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Loading...',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}