import 'package:flutter/material.dart';
import 'pembelajaran_page.dart';
import 'cbt_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color yellow = Color(0xFFFFF18A);
  static const Color pink = Color(0xFFAA829F);
  static const Color grey = Color(0xFFE5E5E5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: yellow,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person_outline,
                            size: 38,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hi', style: TextStyle(fontSize: 12)),
                              Text(
                                'NURUL AINI',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '9239 | XI RPL 1 | SMK N 1 Bukateja',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _Info(
                            icon: Icons.calendar_month,
                            value: '06/11',
                            label: 'Tanggal',
                          ),
                          _Info(
                            icon: Icons.access_time,
                            value: '06:00',
                            label: 'Masuk',
                          ),
                          _Info(
                            icon: Icons.access_time,
                            value: '14:00',
                            label: 'Pulang',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              _sectionTitle('Presensi', 'Lihat Semua'),
              _whiteCard(
                child: Column(
                  children: const [
                    _Attendance(
                      title: 'Presensi Masuk',
                      time: '06:00 | 06/11/2026',
                      status: 'Tepat Waktu',
                      statusColor: Color(0xFFB8E8C0),
                    ),
                    Divider(),
                    _Attendance(
                      title: 'Presensi Pulang',
                      time: '-',
                      status: 'Belum Presensi',
                      statusColor: Color(0xFFF4CACA),
                    ),
                  ],
                ),
              ),

              _sectionTitle('Jurnal PKL', 'Lihat Semua'),
              _whiteCard(
                child: const Column(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Color(0xFFE9C52E),
                      size: 35,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Periode PKL belum dimulai',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Jurnal PKL kamu belum bisa di isi.Fitur ini aktif otomatis saat periode pkl dimulai.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),

              _sectionTitle('Jadwal Pelajaran', ''),
              _whiteCard(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'KONSENTRASI KEAHLIAN REKAYASA PERANGKAT LUNAK',
                      style: TextStyle(fontSize: 11),
                    ),
                    SizedBox(height: 12),
                    Text('08.00 -', style: TextStyle(fontSize: 11)),
                    Text(
                      'PARAS TAUFANI, S.KOM.',
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),

              _sectionTitle('Perizinan', 'Lihat Semua'),
              _whiteCard(
                child: const Column(
                  children: [
                    Icon(Icons.menu_book, color: Color(0xFFE9C52E), size: 30),
                    SizedBox(height: 5),
                    Text(
                      'Ajukan Izin',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Ajukan izin jika kamu berhalangan hadir',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: pink,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PembelajaranPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CbtPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'lms'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Presensi'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'cbt'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, String action) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(action, style: const TextStyle(color: Colors.red, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _whiteCard({required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: child,
    );
  }
}

class _Info extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _Info({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFFE9C52E), size: 22),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: const TextStyle(fontSize: 12)),
            Text(label, style: const TextStyle(fontSize: 9)),
          ],
        ),
      ],
    );
  }
}

class _Attendance extends StatelessWidget {
  final String title;
  final String time;
  final String status;
  final Color statusColor;

  const _Attendance({
    required this.title,
    required this.time,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFFEAEAEA),
          child: Icon(Icons.person_outline, color: Colors.grey),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 11)),
              Text(time, style: const TextStyle(fontSize: 9)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(status, style: const TextStyle(fontSize: 9)),
        ),
      ],
    );
  }
}
