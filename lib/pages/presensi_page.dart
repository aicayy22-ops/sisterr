import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});
  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  static const Color pink = Color(0xFFAA829F);
  static const Color yellow = Color(0xFFFFFF8A);
  Position? _position;
  bool _isLocationLoading = false;
  String? _locationError;

  // Simulasi wajah terdeteksi
  void _showDetectedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Text('Wajah Terdeteksi!', textAlign: TextAlign.center),
        content: const Icon(
          Icons.face_retouching_natural,
          size: 90,
          color: pink,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ambil Ulang'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: yellow,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
              _showLocationDialog();
            },
            child: const Text('Gunakan Foto'),
          ),
        ],
      ),
    );
  }

  // Konfirmasi lokasi
  void _showLocationDialog() {
    _isLocationLoading = true;
    _locationError = null;
    _position = null;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Text('Konfirmasi Lokasi'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.location_on, color: pink, size: 45),
            const SizedBox(height: 10),
            if (_isLocationLoading) ...[
              const CircularProgressIndicator(color: pink),
              const SizedBox(height: 10),
              const Text(
                'Mendapatkan lokasi Anda...',
                textAlign: TextAlign.center,
              ),
            ] else if (_locationError != null) ...[
              Text(_locationError!, textAlign: TextAlign.center),
              if (_locationError!.contains('izin'))
                TextButton(
                  onPressed: () => Geolocator.openAppSettings(),
                  child: const Text('Buka Pengaturan'),
                ),
            ] else ...[
              Text(
                'Lokasi: ${_position!.latitude.toStringAsFixed(6)}, '
                '${_position!.longitude.toStringAsFixed(6)}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                'Akurasi: ${_position!.accuracy.toStringAsFixed(1)} meter',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Apakah Anda yakin ingin melakukan presensi '
                'dengan lokasi ini?',
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tidak'),
          ),
          if (_locationError != null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: yellow,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
                _showLocationDialog();
              },
              child: const Text('Coba Lagi'),
            ),
          if (!_isLocationLoading && _locationError == null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: yellow,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
                _showResultDialog(true);
              },
              child: const Text('Ya'),
            ),
        ],
      ),
    );

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (!mounted) return;
        setState(() {
          _isLocationLoading = false;
          _locationError = 'Layanan lokasi belum aktif. Silakan aktifkan GPS.';
        });
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (!mounted) return;
        setState(() {
          _isLocationLoading = false;
          _locationError =
              'Akses lokasi tidak diberikan. Perlu izin lokasi untuk presensi.';
        });
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      if (!mounted) return;
      setState(() {
        _position = position;
        _isLocationLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLocationLoading = false;
        _locationError =
            'Lokasi gagal diperoleh. Pastikan GPS aktif dan coba lagi.';
      });
    }
  }

  // Hasil presensi berhasil atau gagal
  void _showResultDialog(bool success) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              success ? Icons.check_circle : Icons.cancel,
              size: 75,
              color: success ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 15),
            Text(
              success ? 'Presensi berhasil' : 'Presensi gagal',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              success
                  ? 'Presensi Anda berhasil dilakukan.'
                  : 'Wajah atau lokasi tidak dapat diverifikasi. '
                        'Silakan coba kembali.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: yellow,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(success ? 'Tutup' : 'Coba Lagi'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              height: 45,
              width: double.infinity,
              color: const Color(0xFF788B35),
              child: const Center(
                child: Text(
                  'Presensi Wajah',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),

            // AREA KAMERA
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFB3C95A), Color(0xFF687C32)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.face_retouching_natural,
                      size: 190,
                      color: Colors.white,
                    ),

                    const SizedBox(height: 25),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Pastikan wajah terlihat jelas dan '
                        'tidak menggunakan masker/topeng',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // TOMBOL KAMERA
                    IconButton(
                      onPressed: _showDetectedDialog,
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 35,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: pink,
                        padding: const EdgeInsets.all(18),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // TOMBOL SIMULASI GAGAL
                    TextButton(
                      onPressed: () => _showResultDialog(false),
                      child: const Text(
                        'Simulasikan presensi gagal',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // NAVIGASI BAWAH
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedItemColor: pink,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/lms');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/jurnal');
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
