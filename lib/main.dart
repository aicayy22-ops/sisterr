import 'package:flutter/material.dart';
import 'auth/login_page.dart';
import 'pages/home_page.dart';
import 'pages/akun_page.dart';
import 'pages/cbt_page.dart';
import 'pages/pembelajaran_page.dart';
import 'pages/presensi_page.dart';

void main() {
  runApp(const SisterSkansika());
}

class SisterSkansika extends StatelessWidget {
  const SisterSkansika({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SISTER SKANSIKA',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/lms': (context) => const PembelajaranPage(),
        '/presensi': (context) => const PresensiPage(),
        '/jurnal': (context) => const CbtPage(),
        '/akun': (context) => const AkunPage(),
      },
    );
  }
}