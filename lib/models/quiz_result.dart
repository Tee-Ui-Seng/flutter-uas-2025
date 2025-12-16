import 'package:cloud_firestore/cloud_firestore.dart';

class QuizResult {
  final String quizId;
  final String quizName;
  final int score;
  final int maxScore;
  final DateTime completedAt;
  final Map<String, bool> answers; // questionId: isCorrect

  QuizResult({
    required this.quizId,
    required this.quizName,
    required this.score,
    required this.maxScore,
    required this.completedAt,
    required this.answers,
  });

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      quizId: map['quizId'],
      quizName: map['quizName'],
      score: map['score'],
      maxScore: map['maxScore'],
      completedAt: (map['completedAt'] as Timestamp).toDate(),
      answers: Map<String, bool>.from(map['answers']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quizId': quizId,
      'quizName': quizName,
      'score': score,
      'maxScore': maxScore,
      'completedAt': Timestamp.fromDate(completedAt),
      'answers': answers,
    };
  }

  double get percentage => (score / maxScore) * 100;
}