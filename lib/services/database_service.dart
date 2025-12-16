import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_profile.dart';
import '../models/quiz_result.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get currentUserId {
    final user = _auth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: "no-user",
        message: "No user is currently logged in.",
      );
    }
    return user.uid;
  }

  // Reference to users collection
  CollectionReference get usersCollection => _firestore.collection('users');

  // Reference to achievements collection
  CollectionReference get achievementsCollection => 
      _firestore.collection('achievements');

  // Reference to quiz results subcollection for a user
  CollectionReference get userQuizResultsCollection {
    final userId = _auth.currentUser!.uid;
    return usersCollection.doc(userId).collection('quizResults');
  }

  // Create or update user profile when they register/login
  Future<void> createUserProfile(User user) async {
    final userProfile = UserProfile(
      uid: user.uid,
      email: user.email!,
      displayName: user.displayName ?? 'User',
      createdAt: DateTime.now(),
      achievements: {},
      totalScore: 0,
      quizResults: [],
    );

    try {
      await usersCollection.doc(user.uid).set(userProfile.toFirestore());
    } on FirebaseException catch (e) {
      print("🔥 Firestore error: ${e.code} - ${e.message}");
      rethrow;
    } catch (e) {
      print("❌ Unknown error: $e");
      rethrow;
    }
  }

  // Save quiz result for current user
  Future<void> saveQuizResult({
    required String quizId,
    required String quizName,
    required int score,
    required int maxScore,
    required Map<String, bool> answers,
  }) async {
    final userId = _auth.currentUser!.uid;
    final quizResult = QuizResult(
      quizId: quizId,
      quizName: quizName,
      score: score,
      maxScore: maxScore,
      completedAt: DateTime.now(),
      answers: answers,
    );

    // Save to user's quiz results subcollection
    await userQuizResultsCollection.add(quizResult.toMap());

    // Update user's total score
    await usersCollection.doc(userId).update({
      'totalScore': FieldValue.increment(score),
    });

    // Check for achievements
    await _checkAchievements(userId, quizResult);
  }

  // Check and award achievements based on quiz performance
  Future<void> _checkAchievements(String userId, QuizResult quizResult) async {
    final userDoc = await usersCollection.doc(userId).get();
    final userData = userDoc.data() as Map<String, dynamic>;
    final currentAchievements = Map<String, dynamic>.from(
        userData['achievements'] ?? {});

    // Achievement: First Quiz Completed
    if (quizResult.percentage >= 60 && 
        !currentAchievements.containsKey('first_quiz')) {
      await _awardAchievement(
        userId: userId,
        achievementId: 'first_quiz',
        achievementName: 'First Quiz Master',
        description: 'Completed your first quiz with 60% or higher',
        points: 50,
      );
    }

    // Achievement: Perfect Score
    if (quizResult.percentage == 100) {
      await _awardAchievement(
        userId: userId,
        achievementId: 'perfect_score',
        achievementName: 'Perfect Score!',
        description: 'Got 100% on a quiz',
        points: 100,
      );
    }

    // Achievement: Quick Learner (complete 5 quizzes with 80%+)
    final quizResultsSnapshot = await userQuizResultsCollection.get();
    final highScoreQuizzes = quizResultsSnapshot.docs.where((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final score = data['score'] as int;
      final maxScore = data['maxScore'] as int;
      return (score / maxScore) >= 0.8;
    }).length;

    if (highScoreQuizzes >= 5 && 
        !currentAchievements.containsKey('quick_learner')) {
      await _awardAchievement(
        userId: userId,
        achievementId: 'quick_learner',
        achievementName: 'Quick Learner',
        description: 'Completed 5 quizzes with 80% or higher',
        points: 200,
      );
    }
  }

  // Award an achievement to a user
  Future<void> _awardAchievement({
    required String userId,
    required String achievementId,
    required String achievementName,
    required String description,
    required int points,
  }) async {
    final achievementData = {
      'achievementId': achievementId,
      'name': achievementName,
      'description': description,
      'points': points,
      'awardedAt': Timestamp.now(),
    };

    // Add to user's achievements
    await usersCollection.doc(userId).update({
      'achievements.$achievementId': achievementData,
      'totalScore': FieldValue.increment(points),
    });

    // Add to global achievements collection
    await achievementsCollection.doc(achievementId).set({
      'name': achievementName,
      'description': description,
      'points': points,
      'totalAwarded': FieldValue.increment(1),
    }, SetOptions(merge: true));
  }

  // Get user profile stream
  Stream<UserProfile> getUserProfileStream(String userId) {
    return usersCollection.doc(userId)
        .snapshots()
        .map((doc) => UserProfile.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id));
  }

  // Get all quiz results for a user
  Stream<List<QuizResult>> getUserQuizResultsStream(String userId) {
    return usersCollection.doc(userId)
        .collection('quizResults')
        .orderBy('completedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => QuizResult.fromMap(
                doc.data() as Map<String, dynamic>))
            .toList());
  }

  // Get leaderboard
  Stream<List<UserProfile>> getLeaderboard() {
    return usersCollection
        .orderBy('totalScore', descending: true)
        .limit(10)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserProfile.fromFirestore(
                doc.data() as Map<String, dynamic>, doc.id))
            .toList());
  }
}