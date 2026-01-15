// Part 2
// lib/pages/verb_lessons/verb_basics_page.dart
import 'package:flutter/material.dart';
import 'verb_conjugation_page.dart';

class VerbBasicsPage extends StatelessWidget {
  const VerbBasicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Present Tense Basics'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Center(
              child: Text(
                'Present Tense Conjugation',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Introduction
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'In Persian, different pronouns require different endings on the verb.\n\n',
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 10), 

            // Example Section
            const Text(
              'Example Verb:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green[300]!),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Eat = ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Text(
                        'xordan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const Text(
                        ' = ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'خوردن',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                          fontFamily: 'NotoNastaliqUrdu',
                        ),
                      ),
                    ],
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Drink = ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Text(
                        'nošîdan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const Text(
                        ' = ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'نوشیدن',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                          fontFamily: 'NotoNastaliqUrdu',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'This is the "infinitive" form (dictionary form) ending in "-dan".',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Steps Section
            const Text(
              'To form the present tense, follow these 3 steps:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),

            // Step 1: Remove "-dan" suffix
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[100]!,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Step header
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Remove "-dan" suffix',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Step description
                  const Text(
                    'Remove the infinitive ending before adding pronoun endings. After that, if it ends in a vowel, remove the vowel.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  
                  // Examples in 2 white boxes (VERTICAL STACK)
                  Column(
                    children: [
                      // First example box - xurdan
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'xordan',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                const Text(
                                  'xor',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'خوردن',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Text(
                                  'خور',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'to eat → eat (stem)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Second example box - nošîdan
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'nošîdan',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                const Text(
                                  'noš',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'نوشیدن',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Text(
                                  'نوش',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'to drink → drink (stem)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  // Additional note
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.orange[200]!),
                    ),
                    child: Text(
                      'Note: This rule doesn’t apply to irregular verbs. Example: "kardan" becomes "kun" not "*kar".',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange[800],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Step 2: Add "me-" prefix
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lime[200]!,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.lime[500]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Step header
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Add "me-" prefix',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Step description
                  const Text(
                    'Indicates that the action is ongoing or will start shortly (imperfect aspect).',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  
                  // Examples in 2 white boxes (VERTICAL STACK)
                  Column(
                    children: [
                      // First example box - xurdan
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'xor',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                const Text(
                                  'me-xor',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'خور',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Text(
                                  'می‌خور',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'eat (stem) → (I/we/they) eat',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Second example box - nošîdan
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'noš',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                const Text(
                                  'me-noš',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'نوش',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Text(
                                  'می‌نوش',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'drink (stem) → (I/we/they) drink',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Step 3: Add pronoun suffix
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lime[300]!,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.lime[700]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Step header
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '3',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Add pronoun suffix',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Step description
                  const Text(
                    'Add the appropriate suffix depending on the pronoun.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  
                  // Examples in 2 white boxes (VERTICAL STACK)
                  Column(
                    children: [
                      // First example box - "I eat"
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'I eat',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'me-xor + am',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                const Text(
                                  'me-xoram',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'می‌خور + م',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Text(
                                  'می‌خورم',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'I eat (present tense)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Second example box - "I drink"
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'I drink',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'me-noš + am',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                const Text(
                                  'me-nošam',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'می‌نوش + م',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Text(
                                  'می‌نوشم',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[700],
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'I drink (present tense)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber[50]!,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.amber, width: 2),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.lightbulb_rounded,
                            size: 20,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Persian Verb Syntax',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.amber[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Note content
                  // Text(
                  //   '1. Remove "-dan" from infinitive (if whatever remains ends in a vowel, remove it also) to get the stem.\n'
                  //   '2. Add "me-" prefix to indicate present tense.\n'
                  //   '3. Add appropriate pronoun suffix (-am, -î, -ad, -em, -ed, -and).\n'
                  //   '4. Some common verbs have irregular stems that must be memorized.',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  
                  // Note content
                  Text(
                    'Unlike English, which is a Subject + Verb + Object (SVO) language, Persian is a Subject + Object + Verb (SOV) language.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Syntax demo
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // labeledText(text: 'subject (fâil)', fontFamily: 'Courier', fontSize: 16, color: Colors.black,),
                            labeledText(text: 'subject (fâil)', spacing: 0,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // const SizedBox(width: 8),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'time (zamân)', color: Colors.blue,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'object (maf’ûl)', color: Colors.green, spacing: 0,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // const SizedBox(width: 8),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'location (makân)', color: Colors.orange,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'verb (fe’l)', color: Colors.red, spacing: 0,),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            labeledText(text: 'زمان', color: Colors.blue, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 6,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 6),
                            labeledText(text: 'فاعل', color: Colors.black, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            labeledText(text: 'فعل', color: Colors.red, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 6,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 6),
                            labeledText(text: 'مکان', color: Colors.orange, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 6,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 6),
                            labeledText(text: 'مفعول', color: Colors.green, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            // const SizedBox(width: 6),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Personal pronoun is optional. '
                          'The time adverb can be located before or after the entire sentence although less common.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                      
                  // Syntax example 1
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            labeledText(text: 'today', color: Colors.blue,),
                            labeledText(text: 'mother', color: Colors.black,),
                            labeledText(text: 'has', color: Colors.red,),
                            labeledText(text: 'apples', color: Colors.green,),
                            labeledText(text: 'at home', color: Colors.orange, spacing: 0,),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            labeledText(text: 'mâdar', color: Colors.black,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'imroz', color: Colors.blue,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'seb-hâ', color: Colors.green, spacing: 0,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // const SizedBox(width: 8),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'dar xâna', color: Colors.orange,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'dârad', color: Colors.red, spacing: 0,),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            labeledText(text: 'دارد', color: Colors.red, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                            labeledText(text: 'در خانه', color: Colors.orange, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                            labeledText(text: 'سیب‌ها', color: Colors.green, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                            labeledText(text: 'امروز', color: Colors.blue, fontSize: 20, fontFamily: 'NotoNastaliqUrdu',),
                            labeledText(text: 'مادر', color: Colors.black, fontSize: 20, fontFamily: 'NotoNastaliqUrdu', spacing: 0,),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Mother + today + apples + at home + has.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                      
                  // Syntax example 2
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            labeledText(text: 'my dad', color: Colors.black,),
                            labeledText(text: 'is', color: Colors.red,),
                            labeledText(text: 'now', color: Colors.blue,),
                            labeledText(text: 'at Herat', color: Colors.orange,),
                            labeledText(text: 'with brother', color: Colors.black, spacing: 0,),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            labeledText(text: 'padar-am', color: Colors.black,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'bâ barâdar-am', color: Colors.black, spacing: 0,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // const SizedBox(width: 8),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'aknûn', color: Colors.blue,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'dar Harât', color: Colors.orange,),
                            const Icon(Icons.add, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            labeledText(text: 'astand', color: Colors.red, spacing: 0,),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            labeledText(text: 'استند', color: Colors.red, fontSize: 18, fontFamily: 'NotoNastaliqUrdu',),
                            labeledText(text: 'در هرات', color: Colors.orange, fontSize: 18, fontFamily: 'NotoNastaliqUrdu',),
                            labeledText(text: 'اکنون', color: Colors.blue, fontSize: 18, fontFamily: 'NotoNastaliqUrdu',),
                            labeledText(text: 'با برادرم', color: Colors.black, fontSize: 18, fontFamily: 'NotoNastaliqUrdu',),
                            labeledText(text: 'پدرم', color: Colors.black, fontSize: 18, fontFamily: 'NotoNastaliqUrdu', spacing: 0,),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'My dad + with my brother + now + at Herat + are.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: BorderSide(color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const VerbConjugationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Next: Conjugation Table',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget labeledText({
    required String text,
    String fontFamily = 'Courier',
    double fontSize = 16,
    Color color = Colors.black,
    double spacing = 8,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(width: spacing),
      ],
    );
  }
}