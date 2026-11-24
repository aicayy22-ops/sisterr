import 'package:flutter/material.dart';

class CbtPage extends StatelessWidget {
  const CbtPage({super.key});

  static const Color yellow = Color(0xFFFFF18A);
  static const Color pink = Color(0xFFAA829F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F7),

      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              height: 190,
              color: yellow,
              alignment: Alignment.center,
              child: const Text(
                'CBT',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF292929),
                ),
              ),
            ),

            // CONTENT
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ILUSTRASI
                      SizedBox(
                        height: 230,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 180,
                              height: 135,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0E5EE),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: pink, width: 3),
                              ),
                              child: const Icon(
                                Icons.assignment,
                                size: 75,
                                color: pink,
                              ),
                            ),

                            const Positioned(
                              top: 15,
                              right: 25,
                              child: Icon(
                                Icons.access_time,
                                size: 75,
                                color: pink,
                              ),
                            ),

                            const Positioned(
                              bottom: 15,
                              left: 20,
                              child: Icon(
                                Icons.calendar_month,
                                size: 55,
                                color: pink,
                              ),
                            ),

                            const Positioned(
                              bottom: 20,
                              right: 15,
                              child: Icon(
                                Icons.check_circle,
                                size: 48,
                                color: pink,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'CBT Segera Hadir!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          color: Color(0xFF777777),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'Fitur CBT sedang kami siapkan, '
                        'Tunggu sebentar ya!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        selectedItemColor: pink,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/lms');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/presensi');
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, '/akun');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'LMS'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Presensi'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Jurnal',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}
