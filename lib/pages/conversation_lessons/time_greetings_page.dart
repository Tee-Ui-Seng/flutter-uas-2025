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
      'time': 'Afternoon',
      'english': 'Good afternoon!',
      'persian': 'bad az zohr baxair!',
      'script': 'بعد از ظهر بخیر!',
      'responseEnglish': 'Good afternoon!',
      'response': 'bad az zohr baxair!',
      'responseScript': 'بعد از ظهر بخیر!'
    },
    {
      'time': 'Evening',
      'english': 'Good evening!',
      'persian': 'šab baxair!',
      'script': 'شب بخیر!',
      'responseEnglish': 'Good evening!',
      'response': 'šab baxair!',
      'responseScript': 'شب بخیر!'
    },
    {
      'time': 'Night',
      'english': 'Good night!',
      'persian': 'šab baxair!',
      'script': 'شب بخیر!',
      'responseEnglish': 'Good night!',
      'response': 'šab baxair!',
      'responseScript': 'شب بخیر!'
    },
    {
      'time': 'Any time',
      'english': 'Have a good day!',
      'persian': 'rûz-e xubî dâšte bâšîn!',
      'script': 'روز خوبی داشته باشید!',
      'responseEnglish': 'Thanks, you too!',
      'response': 'mersî, šumâ ham!',
      'responseScript': 'ممنون، شما هم!'
    },
    {
      'time': 'Weekend',
      'english': 'Have a good weekend!',
      'persian': 'taṭîlât-e xubî dâšte bâšîn!',
      'script': 'تعطیلات خوبی داشته باشید!',
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
                  return Card(
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

                          // English + Persian + Nastaliq
                          Text(
                            greeting['english']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),

                          Text(
                            greeting['persian']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            greeting['script']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'NotoNastaliqUrdu',
                            ),
                            textDirection: TextDirection.rtl,
                          ),

                          const SizedBox(height: 12),

                          // Response block
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
                      '• "ba\'d az zohr baxair" — noon to sunset\n'
                      '• "šab baxair" — evening + night\n'
                      '• "rûz-e xubî" — any time of day\n'
                      '• Using time-specific greetings shows cultural awareness',
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
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
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
                          builder: (context) => const FarewellsPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Next: Farewells'),
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
