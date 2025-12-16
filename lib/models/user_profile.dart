import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_uas/models/quiz_result.dart';

class UserProfile {
  final String uid;
  final String email;
  final String displayName;
  final DateTime createdAt;
  final Map<String, dynamic> achievements;
  final int totalScore;
  final List<QuizResult> quizResults;

  UserProfile({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.createdAt,
    this.achievements = const {},
    this.totalScore = 0,
    this.quizResults = const [],
  });

  factory UserProfile.fromFirestore(Map<String, dynamic> data, String uid) {
    return UserProfile(
      uid: uid,
      email: data['email'] ?? '',
      displayName: data['displayName'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      achievements: Map<String, dynamic>.from(data['achievements'] ?? {}),
      totalScore: data['totalScore'] ?? 0,
      quizResults: (data['quizResults'] as List? ?? [])
          .map((e) => QuizResult.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'createdAt': Timestamp.fromDate(createdAt),
      'achievements': achievements,
      'totalScore': totalScore,
      'quizResults': quizResults.map((e) => e.toMap()).toList(),
    };
  }
}