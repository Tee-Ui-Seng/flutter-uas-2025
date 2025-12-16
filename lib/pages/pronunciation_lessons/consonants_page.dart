// Part 3
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'pronunciation_quiz_page.dart';

class ConsonantsPage extends StatefulWidget {
  const ConsonantsPage({super.key});

  @override
  State<ConsonantsPage> createState() => _ConsonantsPageState();
}

class _ConsonantsPageState extends State<ConsonantsPage> {
  bool _showNotes = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<Map<String, dynamic>> consonants = [
    {'letter': 'p', 'ipa': '[p]', 'nastaliq': 'پ', 'audio': 'p', 'note': '-'},
    {'letter': 'b', 'ipa': '[b]', 'nastaliq': 'ب', 'audio': 'b', 'note': '-'},
    {'letter': 'f', 'ipa': '[f]', 'nastaliq': 'ف', 'audio': 'f', 'note': '-'},
    {'letter': 'v', 'ipa': '[w]', 'nastaliq': 'و', 'audio': 'w', 'note': 'Pronounced [v] in Iran and Tajik.'},
    
    {'letter': 't', 'ipa': '[t]', 'nastaliq': 'ت', 'audio': 't', 'note': 'Also ط'},
    {'letter': 'd', 'ipa': '[d]', 'nastaliq': 'د', 'audio': 'd', 'note': '-'},
    {'letter': 's', 'ipa': '[s]', 'nastaliq': 'س', 'audio': 's', 'note': 'Also ث and ص'},
    {'letter': 'z', 'ipa': '[z]', 'nastaliq': 'ز', 'audio': 'z', 'note': 'Also ذ, ض, ظ'},
    
    {'letter': 'c', 'ipa': '[t͡ʃ]', 'nastaliq': 'چ', 'audio': 'c', 'note': '-'},
    {'letter': 'j', 'ipa': '[d͡ʒ]', 'nastaliq': 'ج', 'audio': 'j', 'note': '-'},
    {'letter': 'š', 'ipa': '[ʃ]', 'nastaliq': 'ش', 'audio': 'sh', 'note': '-'},
    {'letter': 'ž', 'ipa': '[ʒ]', 'nastaliq': 'ژ', 'audio': 'zh', 'note': '-'},
    
    {'letter': 'k', 'ipa': '[k]', 'nastaliq': 'ک', 'audio': 'k', 'note': '-'},
    {'letter': 'g', 'ipa': '[g]', 'nastaliq': 'گ', 'audio': 'g', 'note': '-'},
    {'letter': 'x', 'ipa': '[x]', 'nastaliq': 'خ', 'audio': 'x', 'note': 'Pronounced [χ] in Tajik.'},
    {'letter': 'ğ', 'ipa': '[ɣ]', 'nastaliq': 'غ', 'audio': 'gh', 'note': 'Pronounced [ɢ] in Iran.'},
    
    {'letter': 'm', 'ipa': '[m]', 'nastaliq': 'م', 'audio': 'm', 'note': '-'},
    {'letter': 'q', 'ipa': '[q]', 'nastaliq': 'ق', 'audio': 'q', 'note': '-'},
    {'letter': '‘', 'ipa': '[ʔ]', 'nastaliq': 'ع', 'audio': 'vv', 'note': 'See Notes. Also Hamza (ء)'},
    {'letter': 'h', 'ipa': '[h]', 'nastaliq': 'ه', 'audio': 'h', 'note': 'See Notes. Also ح'},
    
    {'letter': 'n', 'ipa': '[n]', 'nastaliq': 'ن', 'audio': 'n', 'note': '-'},
    {'letter': 'l', 'ipa': '[l]', 'nastaliq': 'ل', 'audio': 'l', 'note': '-'},
    {'letter': 'r', 'ipa': '[ɾ]', 'nastaliq': 'ر', 'audio': 'r', 'note': 'Pronounced [ɹ] in Iran.'},
    {'letter': 'y', 'ipa': '[j]', 'nastaliq': 'ی', 'audio': 'y', 'note': '-'},
  ];

  Future<void> _playSound(String audio) async {
    final path = 'audio/pronunciation/$audio.mp3';

    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(path));
    } catch (e) {
      debugPrint('Error playing $path: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persian Consonants'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Persian Consonant Sounds',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Complete consonant chart with IPA and dialect notes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            
            // Consonants Table
            Expanded(
              child: ListView.builder(
                itemCount: consonants.length,
                itemBuilder: (context, index) {
                  final consonant = consonants[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          // Letter column
                          Container(
                            width: 60,
                            alignment: Alignment.center,
                            child: Text(
                              consonant['letter']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                          // IPA column
                          Container(
                            width: 60,
                            alignment: Alignment.center,
                            child: Text(
                              consonant['ipa']!,
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 14,
                              ),
                            ),
                          ),
                          
                          // Sound button
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () => _playSound(consonant['audio']!),
                            ),
                          ),
                          
                          // Nastaliq script
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                consonant['nastaliq']!,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'NotoNastaliqUrdu',
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                          
                          // Note
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                consonant['note']!,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Notes Section
            const SizedBox(height: 16),
            Card(
              child: ExpansionTile(
                title: const Text(
                  'Important Notes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                initiallyExpanded: false,
                onExpansionChanged: (expanded) {
                  setState(() {
                    _showNotes = expanded;
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Aspiration Rules:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'The consonants [pʰ], [tʰ], [kʰ], and [t͡ʃʰ] are aspirated in initial position.',
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '/h/ Pronunciation:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'The consonant /h/ is pronounced [ɦ] between vowels (except Hazaragi). '
                          'In Hazaragi, it\'s silent [Ø] between vowels and glottal [ʔ] on initial.',
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '/ʔ/ Pronunciation:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'The consonant /ʔ/ is silent [Ø] finally in Hazaragi. '
                          'Hamza (ء) can be written alone (سوء) or on top (مسئله).',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Navigation buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PronunciationQuizPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text('Take Quiz'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}