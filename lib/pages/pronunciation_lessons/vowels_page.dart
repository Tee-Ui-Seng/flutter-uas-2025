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
      'vowel': 'aeh',
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
      appBar: AppBar(
        title: const Text('Persian Vowels'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Persian Vowel Sounds',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Comparison across Persian dialects with IPA notation',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            
            // Horizontal Scrollable Table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    headingRowHeight: 80,
                    columnSpacing: 12,
                    dataRowMinHeight: 60,
                    dataRowMaxHeight: 80,
                    columns: const [
                      DataColumn(
                        label: Text('Vowel', style: TextStyle(fontWeight: FontWeight.bold)),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Column(
                          children: [
                            Text('Classical', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Persian', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      DataColumn(
                        label: Column(
                          children: [
                            Text('Dari', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      DataColumn(
                        label: Column(
                          children: [
                            Text('Hazaragi', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      DataColumn(
                        label: Column(
                          children: [
                            Text('Tajik', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      DataColumn(
                        label: Column(
                          children: [
                            Text('Iran', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      DataColumn(
                        label: Text('Note', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                    rows: vowels.map((vowel) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Center(
                              child: Text(
                                vowel['vowel'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(vowel['classical']['example']!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'NotoNastaliqUrdu',
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                Text(vowel['classical']['ipa']!),
                              ],
                            ),
                          ),
                          DataCell(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(vowel['dari']['ipa']!),
                                IconButton(
                                  icon: const Icon(Icons.play_arrow, size: 16),
                                  onPressed: () => _playSound(vowel['dari']['audio']!),
                                ),
                              ],
                            ),
                          ),
                          DataCell(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(vowel['hazaragi']['ipa']!),
                                IconButton(
                                  icon: const Icon(Icons.play_arrow, size: 16),
                                  onPressed: () => _playSound(vowel['hazaragi']['audio']!),
                                ),
                              ],
                            ),
                          ),
                          DataCell(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(vowel['tajik']['ipa']!),
                                IconButton(
                                  icon: const Icon(Icons.play_arrow, size: 16),
                                  onPressed: () => _playSound(vowel['tajik']['audio']!),
                                ),
                              ],
                            ),
                          ),
                          DataCell(
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(vowel['iran']['ipa']!),
                                IconButton(
                                  icon: const Icon(Icons.play_arrow, size: 16),
                                  onPressed: () => _playSound(vowel['iran']['audio']!),
                                ),
                              ],
                            ),
                          ),
                          DataCell(
                            Center(child: Text(vowel['note'])),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            
            // Notes Section
            const SizedBox(height: 16),
            Card(
              child: ExpansionTile(
                title: const Text(
                  'Notes',
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
                          '[1] Pronounced [u] in Hazaragi if:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• The next vowel is [i]'),
                              Text('• "o" as in the word او'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '[2] ô is only used if all the followings are true:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• Pronounced [u] in Hazaragi'),
                              Text('• Cognate with Dari [o] / Tajik [ɵ]'),
                              Text('• The next vowel is not [i]'),
                              Text('• The word is not او'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '[3] If the word ends in a silent he dôcašmaeh (ه)',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.deepPurple),
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
                    backgroundColor: Colors.deepPurple,
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
          ],
        ),
      ),
    );
  }
}