import 'package:flutter/material.dart';
import 'data_diri_page.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  static const Color pink = Color(0xFFAA829F);
  static const Color cream = Color(0xFFFFFBEA);

  void showInfo(BuildContext context, String menu) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Halaman $menu akan dibuat selanjutnya')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 15),

              // FOTO PROFIL
              const CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 55, color: Colors.grey),
              ),

              const SizedBox(height: 10),

              const Text(
                'NURUL AINI',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),

              const Text(
                'XI RPL 1 | SMK Negeri 1 Bukateja',
                style: TextStyle(fontSize: 12),
              ),

              const SizedBox(height: 15),

              // RINGKASAN KEHADIRAN
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _AttendanceItem(title: 'Hadir', value: '0'),
                      _AttendanceItem(title: 'Sakit', value: '0'),
                      _AttendanceItem(title: 'Izin', value: '0'),
                      _AttendanceItem(title: 'Alpha', value: '0'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // POIN PELANGGARAN
              Card(
                color: Colors.white,
                child: ListTile(
                  title: const Text(
                    'Poin pelanggaran',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Tahun Ajaran 2026/2027'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => showInfo(context, 'Poin Pelanggaran'),
                ),
              ),

              const SizedBox(height: 15),

              // MENU PROFIL
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profil',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 5),

              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    _MenuItem(
                      icon: Icons.person_outline,
                      title: 'Data Diri',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DataDiriPage(),
                          ),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.face,
                      title: 'Registrasi Wajah',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            content: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 80,
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Wajah Sudah Terdaftar!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Data wajah kamu sudah berhasil terdaftar.',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.refresh,
                      title: 'Reset Wajah',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Reset Wajah'),
                            content: const Text(
                              'Apakah kamu yakin ingin mereset data wajah?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Batal'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                            size: 85,
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            'Reset Wajah Berhasil!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Data wajah berhasil direset.',
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Ya, Reset'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // LOGOUT
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.grey),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) => AlertDialog(
                        title: const Text('Konfirmasi Logout'),
                        content: const Text(
                          'Apakah kamu yakin ingin keluar dari akun?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                            child: const Text('Batal'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              Navigator.of(
                                context,
                              ).pushNamedAndRemoveUntil('/', (route) => false);
                            },
                            child: const Text('Ya, Keluar'),
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

      // NAVIGASI BAWAH
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 4,
        selectedItemColor: pink,
        unselectedItemColor: Colors.grey,
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
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/lms');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/presensi');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/jurnal');
          }
        },
      ),
    );
  }
}

class _AttendanceItem extends StatelessWidget {
  final String title;
  final String value;

  const _AttendanceItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(title, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 20, color: Colors.grey),
      title: Text(title, style: const TextStyle(fontSize: 13)),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}
