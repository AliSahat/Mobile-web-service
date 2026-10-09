import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const TugasKelompokApp(),
    ),
  );
}

class TugasKelompokApp extends StatelessWidget {
  const TugasKelompokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anggota Kelompok',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const TugasKelompokPage(),
    );
  }
}

class TugasKelompokPage extends StatelessWidget {
  const TugasKelompokPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FC),
      appBar: AppBar(
        title: const Text('Anggota Kelompok'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Text(
                  'TIM KITA • 3 ANGGOTA',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Color(0xFF656B85),
                  ),
                ),
              ),
              SizedBox(height: 12),
              _KartuAnggota(
                peran: 'Anggota 1',
                npm: '5220411321',
                nama: 'Ali Sahat Pardomuan',
                foto: 'assets/women.jpg',
                warna: Color(0xFF484CB0),
                ikon: Icons.palette_outlined,
              ),
              SizedBox(height: 12),
              _KartuAnggota(
                peran: 'Anggota 2',
                npm: '-',
                nama: '',
                foto: 'assets/women1.jpeg',
                warna: Color(0xFF167267),
                ikon: Icons.code_rounded,
              ),
              SizedBox(height: 12),
              _KartuAnggota(
                peran: 'Anggota 3',
                npm: '-',
                nama: '',
                foto: 'assets/women3.jpeg',
                warna: Color(0xFF9C5424),
                ikon: Icons.assignment_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KartuAnggota extends StatelessWidget {
  const _KartuAnggota({
    required this.nama,
    required this.npm,
    required this.peran,
    required this.foto,
    required this.warna,
    required this.ikon,
  });

  final String nama;
  final String npm;
  final String peran;
  final String foto;
  final Color warna;
  final IconData ikon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE6E8F3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A3F51B5),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: warna.withValues(alpha: 0.08),
              border: Border.all(color: warna.withValues(alpha: 0.18)),
            ),
            child: ClipOval(
              child: Image.asset(
                foto,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                semanticLabel: 'Foto profil $nama',
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252840),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'NPM: $npm',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF51566F),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: warna.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(ikon, size: 14, color: warna),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          peran,
                          style: TextStyle(fontSize: 12, color: warna),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
