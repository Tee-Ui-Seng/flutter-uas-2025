// Part 5
import 'package:flutter/material.dart';
import 'farewells_page.dart';

class TimeGreetingsPage extends StatelessWidget {
  const TimeGreetingsPage({super.key});

  final List<Map<String, String>> greetings = const [
    {
      'time': 'Morning',
      'english': 'Good morning!',
      'persian': 'subh baxair!',
      'script': 'صبح بخیر!',
      'responseEnglish': 'Good morning!',
      'response': 'subh baxair!',
      'responseScript': 'صبح بخیر!'
    },
    {
      'time': 'Noon',
      'english': 'Good noon!',
      'persian': 'câšt baxair!',
      'script': 'چاشت بخیر!',
      'responseEnglish': 'Good noon',
      'response': 'câšt baxair!',
      'responseScript': 'چاشت بخیر!'
    },
    {
      'time': 'Afternoon',
      'english': 'Good afternoon!',
      'persian': 'ba’d az zohr baxair!',
      'script': 'بعد از ظهر بخیر!',
      'responseEnglish': 'Good afternoon!',
      'response': 'ba’d az zohr baxair!',
      'responseScript': 'بعد از ظهر بخیر!'
    },
    {
      'time': 'Evening / Nighttime',
      'english': 'Good evening / night!',
      'persian': 'šab baxair!',
      'script': 'شب بخیر!',
      'responseEnglish': 'Good evening!/Good night!',
      'response': 'šab baxair!',
      'responseScript': 'شب بخیر!'
    },
    {
      'time': 'Daytime',
      'english': 'Good day!',
      'persian': 'roz baxair!',
      'script': 'روز بخیر!',
      'responseEnglish': 'Good day!',
      'response': 'roz baxair!',
      'responseScript': 'روز بخیر!'
    },
    {
      'time': 'Any time',
      'english': 'Have a good day!',
      'persian': 'roz-i xubî dâšta bâšed!',
      'script': 'روز خوبی داشته باشید!',
      'responseEnglish': 'Thanks, you too!',
      'response': 'mersî, šumâ ham!',
      'responseScript': 'ممنون، شما هم!'
    },
    {
      'time': 'Weekend',
      'english': 'Have a good weekend!',
      'persian': 'âxir-i hafta xubî dâšta bâšed!',
      'script': 'آخر هفته خوبی داشته باشید!',
      'responseEnglish': 'You too!',
      'response': 'šumâ ham!',
      'responseScript': 'شما هم!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time-Specific Greetings'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // EVERYTHING SCROLLS NOW
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Greetings for Different Times',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                'Learn greetings appropriate for different times of day',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // GREETING CARDS
              Column(
                children: greetings.map((greeting) {
                  final bool isDuplicateResponse =
                      greeting['persian'] == greeting['response'] &&
                      greeting['script'] == greeting['responseScript'];

                  return SizedBox(
                    width: double.infinity, // ✅ FULL WIDTH
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // Time label
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                greeting['time']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // English
                            Text(
                              greeting['english']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 6),

                            // Persian (Latin)
                            Text(
                              greeting['persian']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),

                            // Nastaliq
                            Text(
                              greeting['script']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'NotoNastaliqUrdu',
                              ),
                              textDirection: TextDirection.rtl,
                            ),

                            // ✅ ONLY show response if NOT duplicate
                            if (!isDuplicateResponse) ...[
                              const SizedBox(height: 12),

                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      greeting['responseEnglish']!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      greeting['response']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      greeting['responseScript']!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'NotoNastaliqUrdu',
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // USAGE TIPS (NOW INSIDE SCROLLABLE CONTAINER)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.purple),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Usage Tips:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '• "subh baxair" — sunrise to noon\n'
                      '• "câšt baxair" — close to noon\n'
                      '• "ba’d az zohr baxair" — noon to sunset\n'
                      '• "šab baxair" — evening + night\n'
                      '• "roz-i xubî" — any time of day',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // NAV BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FarewellsPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Next: Farewells',
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
      ),
    );
  }
}
