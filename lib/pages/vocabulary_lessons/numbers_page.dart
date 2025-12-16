import 'package:flutter/material.dart';
import 'package:flutter_application_uas/pages/vocabulary_lessons/numbers_formation_page.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  // Current active range index: 0=0-9, 1=10-19, 2=20-1000
  int _currentRangeIndex = 0;

  // All number data in a single structure
  static final List<Map<String, dynamic>> _numberRanges = [
    {
      'title': 'Numbers 0–9',
      'subtitle': 'Learn basic numerals from 0 to 9',
      'color': Colors.amber,
      'backgroundColor': Colors.amber.shade50,
      'numbers': [
        {'digit': '0', 'persian': 'sifr', 'script': 'صفر'},
        {'digit': '1', 'persian': 'yak', 'script': 'یک'},
        {'digit': '2', 'persian': 'du', 'script': 'دو'},
        {'digit': '3', 'persian': 'se', 'script': 'سه'},
        {'digit': '4', 'persian': 'cahâr', 'script': 'چهار'},
        {'digit': '5', 'persian': 'panj', 'script': 'پنج'},
        {'digit': '6', 'persian': 'šaš', 'script': 'شش'},
        {'digit': '7', 'persian': 'haft', 'script': 'هفت'},
        {'digit': '8', 'persian': 'hašt', 'script': 'هشت'},
        {'digit': '9', 'persian': 'noh', 'script': 'نه'},
      ],
      'practiceTips': 'Practice Tips:\n'
          '• Memorize these basic numbers first\n'
          '• Pay attention to pronunciation of "cahâr" (چهار)\n'
          '• Practice writing the Persian script\n'
          '• Say the numbers out loud as you learn them',
      'examples': [
        {
          'persian': 'man du kitâb dâram',
          'script': 'من دو کتاب دارم',
          'english': 'I have two books',
        },
        {
          'persian': 'o se dost dârad',
          'script': 'او سه دوست دارد',
          'english': 'He/She has three friends',
        },
        {
          'persian': 'mâ panj nafar astem',
          'script': 'ما پنج نفر هستیم',
          'english': 'We are five people',
        },
      ],
    },
    {
      'title': 'Numbers 10–19',
      'subtitle': 'Learn numbers from 10 to 19',
      'color': Colors.teal,
      'backgroundColor': Colors.teal.shade50,
      'numbers': [
        {'digit': '10', 'persian': 'dah', 'script': 'ده'},
        {'digit': '11', 'persian': 'yâzdah', 'script': 'یازده'},
        {'digit': '12', 'persian': 'duâzdah', 'script': 'دوازده'},
        {'digit': '13', 'persian': 'sezdah', 'script': 'سیزده'},
        {'digit': '14', 'persian': 'cahârdah', 'script': 'چهارده'},
        {'digit': '15', 'persian': 'pânzdah', 'script': 'پانزده'},
        {'digit': '16', 'persian': 'šânzdah', 'script': 'شانزده'},
        {'digit': '17', 'persian': 'hafdah', 'script': 'هفده'},
        {'digit': '18', 'persian': 'haždah', 'script': 'هجده'},
        {'digit': '19', 'persian': 'nozdah', 'script': 'نوزده'},
      ],
      'practiceTips': 'Practice Tips:\n'
          '• Notice the pattern: most numbers add "-dah" or "-zdah"\n'
          '• Pay attention to irregular forms (yâzdah, duâzdah)\n'
          '• Practice counting from 10 to 19 in sequence\n'
          '• Compare with the 0-9 numbers you already know',
      'examples': [
        {
          'persian': 'dah nafar dar sinemâ astand',
          'script': 'ده نفر در سینما هستند',
          'english': 'Ten people are in the cinema',
        },
        {
          'persian': 'man yâzdah sâl dâram',
          'script': 'من یازده سال دارم',
          'english': 'I am eleven years old',
        },
        {
          'persian': 'o haždah kitâb dârad',
          'script': 'او هجده کتاب دارد',
          'english': 'He/She has eighteen books',
        },
      ],
    },
    {
      'title': 'Numbers 20–1000',
      'subtitle': 'Learn tens, hundreds, and thousands',
      'color': Colors.purple,
      'backgroundColor': Colors.purple.shade50,
      'numbers': [
        {'digit': '20', 'persian': 'bîst', 'script': 'بیست'},
        {'digit': '30', 'persian': 'sî', 'script': 'سی'},
        {'digit': '40', 'persian': 'cihil', 'script': 'چهل'},
        {'digit': '50', 'persian': 'panjâh', 'script': 'پنجاه'},
        {'digit': '60', 'persian': 'šast', 'script': 'شصت'},
        {'digit': '70', 'persian': 'haftâd', 'script': 'هفتاد'},
        {'digit': '80', 'persian': 'hastâd', 'script': 'هشتاد'},
        {'digit': '90', 'persian': 'nawad', 'script': 'نود'},
        {'digit': '100', 'persian': 'sad', 'script': 'صد'},
        {'digit': '1000', 'persian': 'hazâr', 'script': 'هزار'},
      ],
      'practiceTips': 'Practice Tips:\n'
          '• Learn the tens first (20, 30, 40...)\n'
          '• Note the irregular forms: "bîst" (20), "sî" (30), "cihil" (40)\n'
          '• Practice combining tens and units (e.g., 25 = "bîst o panj")\n'
          '• Remember "sad" (100) and "hazâr" (1000) for larger numbers',
      'examples': [ // fix this immediately
        {
          'persian': 'dah nafar dar sinemâ hastand',
          'script': 'ده نفر در سینما هستند',
          'english': 'Ten people are in the cinema',
        },
        {
          'persian': 'man yâzdah sâl dâram',
          'script': 'من یازده سال دارم',
          'english': 'I am eleven years old',
        },
        {
          'persian': 'u haždah ketâb dârad',
          'script': 'او هجده کتاب دارد',
          'english': 'He/She has eighteen books',
        },
      ],
    },
  ];

  // Function to build compound numbers explanation
  Widget _buildCompoundNumbersInfo(BuildContext context) {
    final range = _numberRanges[_currentRangeIndex];
    final color = range['color'] as Color;

    // Only show for 20-1000 range
    if (_currentRangeIndex == 2) {
      return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: color, size: 20),
                const SizedBox(width: 8),
                Text(
                  'How to Form Compound Numbers',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'To form numbers like 21, 32, 47, etc., use the pattern:\n'
              '[tens] + "o" + [unit]\n\n'
              'Examples:\n'
              '• 21 = "bîst o yak" (بیست و یک)\n'
              '• 35 = "sî o panj" (سی و پنج)\n'
              '• 48 = "cihil o hašt" (چهل و هشت)\n'
              '• 99 = "nawad o noh" (نود و نه)',
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final currentRange = _numberRanges[_currentRangeIndex];
    final color = currentRange['color'] as Color;
    final numbers = currentRange['numbers'] as List<Map<String, String>>;
    final examples = currentRange['examples'] as List<Map<String, String>>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Persian Numbers'),
        backgroundColor: color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Range Selection Buttons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRangeButton(
                    context,
                    index: 0,
                    label: '0–9',
                    icon: Icons.looks_one,
                    isActive: _currentRangeIndex == 0,
                  ),
                  _buildRangeButton(
                    context,
                    index: 1,
                    label: '10–19',
                    icon: Icons.looks_two,
                    isActive: _currentRangeIndex == 1,
                  ),
                  _buildRangeButton(
                    context,
                    index: 2,
                    label: '20–1000',
                    icon: Icons.looks_3,
                    isActive: _currentRangeIndex == 2,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Title and Subtitle
            Text(
              currentRange['title'] as String,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              currentRange['subtitle'] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            // Numbers Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.8,
              ),
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                final number = numbers[index];
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Arabic/Persian digit
                        Text(
                          number['digit']!,
                          style: TextStyle(
                            fontSize: 42,
                            // fontSize: _currentRangeIndex == 2 ? 36 : 42,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 10),
                        
                        // Pronunciation
                        Text(
                          number['persian']!,
                          style: TextStyle(
                            fontSize: 20,
                            // fontSize: _currentRangeIndex == 2 ? 16 : 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),

                        // Persian script
                        SizedBox(
                          height: 56, // tune this once
                          child: Center(
                            child: Text(
                              number['script']!,
                              style: TextStyle(
                                fontSize: _currentRangeIndex == 2 ? 40 : 46,
                                fontFamily: 'NotoNastaliqUrdu',
                                color: color.withValues(alpha: 0.9),
                                height: 1.0, // IMPORTANT for Nastaliq
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Compound numbers info (only for 20-1000 range)
            _buildCompoundNumbersInfo(context),

            // Practice Tips
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: currentRange['backgroundColor'] as Color,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.tips_and_updates, color: color, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Practice Tips',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentRange['practiceTips'] as String,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            // Example Sentences
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.translate, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Example Sentences',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  Column(
                    children: List.generate(examples.length, (index) {
                      final example = examples[index];
                      final isLast = index == examples.length - 1;

                      return Padding(
                        padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                example['script']!,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'NotoNastaliqUrdu',
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                example['persian']!,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                example['english']!,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Progress Indicator
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progress',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      Text(
                        '${_currentRangeIndex + 1}/3',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: (_currentRangeIndex + 1) / 3,
                    backgroundColor: Colors.blue.shade100,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currentRangeIndex == 0
                        ? 'Start with basic numbers 0-9'
                        : _currentRangeIndex == 1
                            ? 'Continue with numbers 10-19'
                            : 'Learn tens, hundreds, and thousands',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // const SizedBox(height: 30),

            const SizedBox(height: 20),

            // NAV BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NumbersFormationPage(),
                      ),
                    );
                  },
                  child: const Text('Next: Number Formation'),
                ),
              ],
            ),

            // const SizedBox(height: 30),
          ],
        ),
      ),

      // Floating Action Button for quick navigation
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: color,
      //   onPressed: () {
      //     setState(() {
      //       _currentRangeIndex = (_currentRangeIndex + 1) % 3;
      //     });
      //   },
      //   child: const Icon(Icons.navigate_next, color: Colors.white),
      // ),
    );
  }

  // Build range selection button
  Widget _buildRangeButton(
    BuildContext context, {
    required int index,
    required String label,
    required IconData icon,
    required bool isActive,
  }) {
    final range = _numberRanges[index];
    final color = range['color'] as Color;

    return InkWell(
      onTap: () {
        setState(() {
          _currentRangeIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive ? color : Colors.grey.shade300,
            width: isActive ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : color,
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}