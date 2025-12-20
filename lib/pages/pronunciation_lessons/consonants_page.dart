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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFE8EAF6),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF3949AB)),
                    ),
                    Expanded(
                      child: Text(
                        'Persian Consonants',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3949AB),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF3949AB).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.phonelink_ring_outlined,
                        color: Color(0xFF3949AB),
                        size: 24,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                Text(
                  'Complete consonant chart with IPA and dialect notes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                
                const SizedBox(height: 24),

                // Styled Table
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Table Header
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFF3949AB),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Letter',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'IPA',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Sound',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Script',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Notes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Table Body
                        Expanded(
                          child: ListView.builder(
                            itemCount: consonants.length,
                            itemBuilder: (context, index) {
                              final consonant = consonants[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: index.isOdd ? Colors.grey.shade50 : Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade200,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Letter column
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF3949AB).withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              consonant['letter']!,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF3949AB),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    
                                    // IPA column
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            consonant['ipa']!,
                                            style: const TextStyle(
                                              fontFamily: 'Courier',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    
                                    // Sound button
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: InkWell(
                                          onTap: () => _playSound(consonant['audio']!),
                                          borderRadius: BorderRadius.circular(20),
                                          child: Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF3949AB).withOpacity(0.1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.play_arrow_rounded,
                                              size: 18,
                                              color: Color(0xFF3949AB),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    
                                    // Nastaliq script
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          consonant['nastaliq']!,
                                          style: TextStyle(
                                            fontSize: 32,
                                            fontFamily: 'NotoNastaliqUrdu',
                                            color: Color(0xFF3949AB),
                                          ),
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                    
                                    // Note
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: consonant['note'] == '-'
                                            ? Center(
                                                child: Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      '-',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                decoration: BoxDecoration(
                                                  color: consonant['note']!.contains('See Notes') 
                                                      ? Color(0xFFFFF8E1)
                                                      : Color(0xFFE8F5E9).withOpacity(0.5),
                                                  borderRadius: BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: consonant['note']!.contains('See Notes')
                                                        ? Color(0xFFFFD54F)
                                                        : Color(0xFF81C784).withOpacity(0.3),
                                                  ),
                                                ),
                                                child: Text(
                                                  consonant['note']!,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: consonant['note']!.contains('See Notes')
                                                        ? Color(0xFFF57C00)
                                                        : Colors.grey.shade800,
                                                    height: 1.3,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Notes Section
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ExpansionTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    title: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF3949AB).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: Color(0xFF3949AB),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Important Notes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3949AB),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    initiallyExpanded: false,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _showNotes = expanded;
                      });
                    },
                    children: [
                      SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildNoteSection(
                                icon: Icons.volume_up_outlined,
                                title: 'Aspiration Rules:',
                                content: 'The consonants [pʰ], [tʰ], [kʰ], and [t͡ʃʰ] are aspirated in initial position.',
                              ),
                              
                              const SizedBox(height: 20),
                              
                              _buildNoteSection(
                                icon: Icons.record_voice_over_outlined,
                                title: '/h/ Pronunciation:',
                                content: 'The consonant /h/ is pronounced [ɦ] between vowels (except Hazaragi). '
                                    'In Hazaragi, it\'s silent [Ø] between vowels and glottal [ʔ] on initial.',
                              ),
                              
                              const SizedBox(height: 20),
                              
                              _buildNoteSection(
                                icon: Icons.text_fields_outlined,
                                title: '/ʔ/ Pronunciation:',
                                content: 'The consonant /ʔ/ is silent [Ø] finally in Hazaragi. '
                                    'Hamza (ء) can be written alone (سوء) or on top (مسئله).',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Navigation buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        side: BorderSide(color: Color(0xFF3949AB)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Color(0xFF3949AB)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PronunciationQuizPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3949AB),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Take Quiz',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.quiz, size: 16, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                
                // const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoteSection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Color(0xFF3949AB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Color(0xFF3949AB),
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3949AB),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}