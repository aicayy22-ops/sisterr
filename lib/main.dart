import 'package:flutter/material.dart';
import 'auth/login_page.dart';

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
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const LoginPage(),
    );
  }
}
