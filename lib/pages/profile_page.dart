import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_uas/models/quiz_result.dart';
import 'package:flutter_application_uas/pages/login_register_page.dart';
import '../services/database_service.dart';
import '../services/auth_service.dart';
import '../models/user_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final database = DatabaseService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.logout_outlined),
        //     onPressed: () async {
        //       final shouldLogout = await showDialog<bool>(
        //         context: context,
        //         builder: (context) => AlertDialog(
        //           icon: const Icon(Icons.logout, color: Colors.red, size: 48,),
        //           title: const Text(
        //             "Confirm Logout",
        //             style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold,),
        //           ),
        //           content: const Column(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Text(
        //                 "Are you sure you want to log out?",
        //                 textAlign: TextAlign.center,
        //               ),
        //             ],
        //           ),
        //           actions: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 TextButton(
        //                   style: TextButton.styleFrom(
        //                     backgroundColor: Colors.blueGrey[50],
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(10),
        //                     ),
        //                   ),
        //                   onPressed: () => Navigator.pop(context, false),
        //                   child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
        //                 ),
        //                 ElevatedButton(
        //                   style: ElevatedButton.styleFrom(
        //                     backgroundColor: Colors.red,
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(10),
        //                     ),
        //                   ),
        //                   onPressed: () => Navigator.pop(context, true),
        //                   child: const Text('Logout', style: TextStyle(color: Colors.white)),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       );

        //       if (shouldLogout == true) {
        //         await AuthService().signOut();

        //         if (!context.mounted) return;

        //         Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => const LoginRegisterPage(),
        //           ),
        //           (route) => false, // removes all previous routes
        //         );
        //       }
        //     },
        //     tooltip: 'Logout',
        //   ),
        // ],
      ),
      body: StreamBuilder<UserProfile>(
        stream: database.getUserProfileStream(userId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final userProfile = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // User Info
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 40,
                        child: Text(
                          userProfile.displayName[0].toUpperCase(),
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        userProfile.displayName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(userProfile.email),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text('Total Score'),
                              Text(
                                '${userProfile.totalScore}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Achievements'),
                              Text(
                                '${userProfile.achievements.length}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Achievements
              const SizedBox(height: 24),
              const Text(
                'Achievements',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (userProfile.achievements.isEmpty)
                const Text('No achievements yet. Complete quizzes to earn them!')
              else
                ...userProfile.achievements.values.map((achievement) {
                  final data = achievement as Map<String, dynamic>;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const Icon(Icons.emoji_events, color: Colors.amber),
                      title: Text(data['name']),
                      subtitle: Text(data['description']),
                      trailing: Chip(
                        label: Text('+${data['points']} pts'),
                      ),
                    ),
                  );
                }),

              // Recent Quiz Results
              const SizedBox(height: 24),
              const Text(
                'Recent Quizzes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              StreamBuilder<List<QuizResult>>(
                stream: database.getUserQuizResultsStream(userId),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  final quizResults = snapshot.data!;
                  
                  if (quizResults.isEmpty) {
                    return const Text('No quiz results yet.');
                  }

                  return Column(
                    children: quizResults.take(5).map((result) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        title: Text(result.quizName),
                        subtitle: Text(result.completedAt.toString()),
                        trailing: Chip(
                          label: Text('${result.score}/${result.maxScore}'),
                        ),
                      ),
                    )).toList(),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}