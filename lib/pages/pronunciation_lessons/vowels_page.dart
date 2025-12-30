// Part 2
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'consonants_page.dart';

class VowelsPage extends StatefulWidget {
  const VowelsPage({super.key});

  @override
  State<VowelsPage> createState() => _VowelsPageState();
}

class _VowelsPageState extends State<VowelsPage> {
  bool _showNotes = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<Map<String, dynamic>> vowels = [
    {
      'vowel': 'a',
      'classical': {'example': 'پرچم', 'ipa': '/a/'},
      'dari': {'ipa': '[a]', 'audio': 'a'},
      'hazaragi': {'ipa': '[a]', 'audio': 'a'},
      'tajik': {'ipa': '[a]', 'audio': 'a'},
      'iran': {'ipa': '[æ]', 'audio': 'ae'},
      'note': '-',
    },
    {
      'vowel': 'i',
      'classical': {'example': 'برنج', 'ipa': '/i/'},
      'dari': {'ipa': '[ɪ]', 'audio': 'ei'},
      'hazaragi': {'ipa': '[i]', 'audio': 'i'},
      'tajik': {'ipa': '[i]', 'audio': 'i'},
      'iran': {'ipa': '[e]', 'audio': 'e'},
      'note': '-',
    },
    {
      'vowel': 'u',
      'classical': {'example': 'بزرگ', 'ipa': '/u/'},
      'dari': {'ipa': '[ʊ]', 'audio': 'ou'},
      'hazaragi': {'ipa': '[u]', 'audio': 'u'},
      'tajik': {'ipa': '[u]', 'audio': 'u'},
      'iran': {'ipa': '[o]', 'audio': 'o'},
      'note': '-',
    },
    {
      'vowel': 'â',
      'classical': {'example': 'آسمان', 'ipa': '/aː/'},
      'dari': {'ipa': '[ɑː]', 'audio': 'au'},
      'hazaragi': {'ipa': '[ɔː]', 'audio': 'ao'},
      'tajik': {'ipa': '[ɔ]', 'audio': 'ao'},
      'iran': {'ipa': '[ɒː]', 'audio': 'av'},
      'note': '-',
    },
    {
      'vowel': 'î',
      'classical': {'example': 'دیدنی', 'ipa': '/iː/'},
      'dari': {'ipa': '[iː]', 'audio': 'i'},
      'hazaragi': {'ipa': '[i]', 'audio': 'i'},
      'tajik': {'ipa': '[i]', 'audio': 'i'},
      'iran': {'ipa': '[iː]', 'audio': 'i'},
      'note': '-',
    },
    {
      'vowel': 'û',
      'classical': {'example': 'صورت', 'ipa': '/uː/'},
      'dari': {'ipa': '[uː]', 'audio': 'u'},
      'hazaragi': {'ipa': '[u]', 'audio': 'u'},
      'tajik': {'ipa': '[u]', 'audio': 'u'},
      'iran': {'ipa': '[uː]', 'audio': 'u'},
      'note': '-',
    },
    {
      'vowel': 'e',
      'classical': {'example': 'شیر', 'ipa': '/eː/'},
      'dari': {'ipa': '[eː]', 'audio': 'e'},
      'hazaragi': {'ipa': '[eː]', 'audio': 'e'},
      'tajik': {'ipa': '[e]', 'audio': 'e'},
      'iran': {'ipa': '[iː]', 'audio': 'i'},
      'note': '-',
    },
    {
      'vowel': 'o',
      'classical': {'example': 'کوه', 'ipa': '/oː/'},
      'dari': {'ipa': '[oː]', 'audio': 'o'},
      'hazaragi': {'ipa': '[ʊː]', 'audio': 'ou'},
      'tajik': {'ipa': '[ɵ]', 'audio': 'ov'},
      'iran': {'ipa': '[uː]', 'audio': 'u'},
      'note': 'See [1]',
    },
    {
      'vowel': 'ô',
      'classical': {'example': 'نه', 'ipa': '/oː/'},
      'dari': {'ipa': '[oː]', 'audio': 'o'},
      'hazaragi': {'ipa': '[u]', 'audio': 'u'},
      'tajik': {'ipa': '[ɵ]', 'audio': 'ov'},
      'iran': {'ipa': '[uː]', 'audio': 'u'},
      'note': 'See [2]',
    },
    {
      'vowel': 'ai',
      'classical': {'example': 'حیوان', 'ipa': '/aj/'},
      'dari': {'ipa': '[aj]', 'audio': 'aj'},
      'hazaragi': {'ipa': '[aj]', 'audio': 'aj'},
      'tajik': {'ipa': '[aj]', 'audio': 'aj'},
      'iran': {'ipa': '[ej]', 'audio': 'ej'},
      'note': '-',
    },
    {
      'vowel': 'aw',
      'classical': {'example': 'نوروز', 'ipa': '/aw/'},
      'dari': {'ipa': '[aw]', 'audio': 'aw'},
      'hazaragi': {'ipa': '[aw]', 'audio': 'aw'},
      'tajik': {'ipa': '[aw]', 'audio': 'aw'},
      'iran': {'ipa': '[ow]', 'audio': 'ow'},
      'note': '-',
    },
    {
      'vowel': '-a',
      'classical': {'example': 'میوه', 'ipa': '/a/'},
      'dari': {'ipa': '[a]', 'audio': 'a'},
      'hazaragi': {'ipa': '[a]', 'audio': 'a'},
      'tajik': {'ipa': '[a]', 'audio': 'a'},
      'iran': {'ipa': '[e]', 'audio': 'e'},
      'note': 'See [3]',
    },
  ];

  Future<void> _playSound(String letter) async {
    final path = 'audio/pronunciation/$letter.mp3';

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
              Color(0xFFEDE7F6),
              Color(0xFFF3E5F5),
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
                      icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF5E35B1)),
                    ),
                    Expanded(
                      child: Text(
                        'Persian Vowel Sounds',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E35B1),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF5E35B1).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.graphic_eq_outlined,
                        color: Color(0xFF5E35B1),
                        size: 24,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                Text(
                  'Comparison across Persian dialects with IPA notation',
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(
                                color: Colors.grey.shade200,
                                width: 1,
                              ),
                              verticalInside: BorderSide(
                                color: Colors.grey.shade200,
                                width: 1,
                              ),
                              left: BorderSide.none,
                              right: BorderSide.none,
                              top: BorderSide.none,
                              bottom: BorderSide.none,
                            ),
                            columnWidths: const {
                              0: FixedColumnWidth(70),
                              1: FixedColumnWidth(100),
                              2: FixedColumnWidth(100),
                              3: FixedColumnWidth(100),
                              4: FixedColumnWidth(100),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(80),
                            },
                            children: [
                              // Header Row
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xFF5E35B1),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                children: [
                                  _buildHeaderCell('Vowel'),
                                  _buildHeaderCell('Classical\nPersian'),
                                  _buildHeaderCell('Dari'),
                                  _buildHeaderCell('Hazaragi'),
                                  _buildHeaderCell('Tajik'),
                                  _buildHeaderCell('Iranian'),
                                  _buildHeaderCell('Note'),
                                ],
                              ),
                              
                              // Data Rows
                              ...vowels.map((vowel) {
                                final index = vowels.indexOf(vowel);
                                return TableRow(
                                  decoration: BoxDecoration(
                                    color: index.isOdd ? Colors.grey.shade50 : Colors.white,
                                  ),
                                  children: [
                                    _buildVowelCell(vowel['vowel']),
                                    _buildClassicalCell(vowel['classical']),
                                    _buildDialectCell(vowel['dari']),
                                    _buildDialectCell(vowel['hazaragi']),
                                    _buildDialectCell(vowel['tajik']),
                                    _buildDialectCell(vowel['iran']),
                                    _buildNoteCell(vowel['note']),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
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
                        color: Colors.grey.withValues(alpha: 0.1),
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
                            color: Color(0xFF5E35B1).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: Color(0xFF5E35B1),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Pronunciation Notes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5E35B1),
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
                              _buildNoteItem(
                                number: '[1]',
                                title: 'Pronounced [u] in Hazaragi if:',
                                items: [
                                  'The next vowel is [i]',
                                  '"o" as in the word او',
                                ],
                              ),
                              
                              const SizedBox(height: 24),
                              
                              _buildNoteItem(
                                number: '[2]',
                                title: 'ô is only used if all the followings are true:',
                                items: [
                                  'Pronounced [u] in Hazaragi',
                                  'Cognate with Dari [o] / Tajik [ɵ]',
                                  'The next vowel is not [i]',
                                  'The word is not او',
                                ],
                              ),
                              
                              const SizedBox(height: 24),
                              
                              _buildNoteItem(
                                number: '[3]',
                                title: 'In Persian, if a word ends with /a/, then it would be written with "he dôcašma" (ه). In Iranian Persian, this /a/ sound is often pronounced as [e].',
                                items: [],
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
                        side: BorderSide(color: Color(0xFF5E35B1)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Color(0xFF5E35B1)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConsonantsPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5E35B1),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Next: Consonants',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
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

  Widget _buildHeaderCell(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildVowelCell(String vowel) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Color(0xFF5E35B1).withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              vowel,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5E35B1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClassicalCell(Map<String, String> data) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data['example']!,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'NotoNastaliqUrdu',
              height: 1.2,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              data['ipa']!,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Courier',
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialectCell(Map<String, String> data) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFF5E35B1).withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFF5E35B1).withValues(alpha: 0.1)),
            ),
            child: Text(
              data['ipa']!,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Courier',
                color: Color(0xFF5E35B1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _playSound(data['audio']!),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xFF5E35B1).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                size: 16,
                color: Color(0xFF5E35B1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteCell(String note) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: note == '-'
            ? Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Color(0xFFFFD54F)),
                ),
                child: Text(
                  note,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFF57C00),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildNoteItem({
    required String number,
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Color(0xFF5E35B1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  number,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5E35B1),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        if (items.isNotEmpty) ...[
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Color(0xFF5E35B1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '• $item',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}