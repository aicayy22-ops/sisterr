import 'package:flutter/material.dart';

class PembelajaranPage extends StatefulWidget {
  const PembelajaranPage({super.key});

  @override
  State<PembelajaranPage> createState() => _PembelajaranPageState();
}

class _PembelajaranPageState extends State<PembelajaranPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'BAHASA INDONESIA',
      'teacher': 'NUR YULIANDRIANTYAS, S.Pd.',
      'code': 'BINDO',
      'color': Color(0xFF279B35),
    },
    {
      'name': 'MAPEL KONSENTRASI REKAYASA PERANGKAT LUNAK',
      'teacher': 'PARAS TAUFANI, S.Kom.',
      'code': 'MK-RPL',
      'color': Color(0xFF477BAA),
    },
    {
      'name': 'B.JEPANG',
      'teacher': 'IMAM MAULANA, S.Pd.',
      'code': 'B.JEPANG',
      'color': Color(0xFF96552D),
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredSubjects = subjects.where((subject) {
      return subject['name'].toString().toLowerCase().contains(
        searchController.text.toLowerCase(),
      );
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              color: const Color(0xFFFFF18A),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.school, size: 32, color: Colors.black),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'lms',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'SMK N 1 Bukateja  XI RPL 1 Gasal 2026/2027',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // SEARCH
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 5),
              child: TextField(
                controller: searchController,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Cari mata pelajaran...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // STATISTIK
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 4),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _Statistic(
                    number: '14',
                    label: 'Mata Pelajaran',
                    color: Colors.red,
                  ),
                  _Statistic(number: '0', label: 'Materi', color: Colors.teal),
                  _Statistic(
                    number: '0',
                    label: 'Tugas Aktif',
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            // DAFTAR PELAJARAN
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  const Text(
                    'Mata Pelajaran',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  ...filteredSubjects.map((subject) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      height: 82,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            margin: const EdgeInsets.all(8),
                            color: subject['color'],
                            alignment: Alignment.center,
                            child: Text(
                              subject['code'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 3,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    subject['name'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    subject['teacher'],
                                    style: const TextStyle(fontSize: 9),
                                  ),
                                  const SizedBox(height: 5),
                                  const Row(
                                    children: [
                                      Icon(Icons.menu_book, size: 12),
                                      Text(
                                        ' 0 Materi',
                                        style: TextStyle(fontSize: 9),
                                      ),
                                      SizedBox(width: 12),
                                      Icon(Icons.assignment_outlined, size: 12),
                                      Text(
                                        ' 0 Tugas',
                                        style: TextStyle(fontSize: 9),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  if (filteredSubjects.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Text('Mata pelajaran tidak ditemukan'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),

      // NAVIGASI BAWAH
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedItemColor: const Color(0xFFAA829F),
        unselectedItemColor: Colors.grey,
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
}

class _Statistic extends StatelessWidget {
  final String number;
  final String label;
  final Color color;

  const _Statistic({
    required this.number,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number, style: TextStyle(fontSize: 18, color: color)),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
