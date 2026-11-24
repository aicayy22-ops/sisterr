import 'package:flutter/material.dart';

class DataDiriPage extends StatelessWidget {
  const DataDiriPage({super.key});

  static const Color yellow = Color(0xFFFFFF8A);
  static const Color cream = Color(0xFFFFFBEA);

  Widget dataField(String label, {String value = '-'}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 14)),
          const Divider(height: 12),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: yellow,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Data Diri',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('Data Personal'),

            dataField('Nama'),
            dataField('Tempat Lahir'),
            dataField('Tanggal Lahir'),
            dataField('Jenis Kelamin'),
            dataField('Telepon'),
            dataField('NIS'),
            dataField('NISN'),
            dataField('NIK'),
            dataField('Agama'),
            dataField('Alamat'),
            dataField('Anak Ke'),
            dataField('Asal Sekolah'),
            dataField('Nomor Surat Tanda Lulus'),
            dataField('Tanggal Surat Tanda Lulus'),

            sectionTitle('Data Orang Tua'),

            dataField('Nama Ayah'),
            dataField('Pekerjaan Ayah'),
            dataField('Nama Ibu'),
            dataField('Pekerjaan Ibu'),
            dataField('Nomor Telepon Orang Tua'),
            dataField('Alamat Orang Tua'),
          ],
        ),
      ),
    );
  }
}
