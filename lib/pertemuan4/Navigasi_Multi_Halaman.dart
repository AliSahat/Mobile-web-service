import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const NavigasiMultiHalamanApp(),
    ),
  );
}

class NavigasiMultiHalamanApp extends StatelessWidget {
  const NavigasiMultiHalamanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Anggota Tim',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const NavigasiMultiHalamanPage(),
    );
  }
}

class NavigasiMultiHalamanPage extends StatelessWidget {
  const NavigasiMultiHalamanPage({super.key});

  static const String _nama = 'sitinurbaya';
  static const String _peran = 'artis';
  static const String _foto = 'assets/women3.jpeg';
  static const String _status =
      'Status: Aktif dan berkontribusi penuh dalam pengembangan film';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('Daftar Anggota Tim'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepOrange.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.deepOrange.shade200),
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  _foto,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  semanticLabel: 'Foto profil $_nama',
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 50,
                      color: Colors.deepOrange.shade100,
                      child: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.deepOrange,
                        semanticLabel: 'Foto belum tersedia',
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _nama,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      _peran,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const DetailAnggotaPage(
                        nama: _nama,
                        peran: _peran,
                        foto: _foto,
                        status: _status,
                      ),
                    ),
                  );
                },
                child: const Text('Detail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailAnggotaPage extends StatelessWidget {
  const DetailAnggotaPage({
    super.key,
    required this.nama,
    required this.peran,
    required this.foto,
    required this.status,
  });

  final String nama;
  final String peran;
  final String foto;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: Text('Detail $nama'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  foto,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  semanticLabel: 'Foto profil $nama',
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.deepOrange.shade100,
                      child: const Icon(
                        Icons.person,
                        size: 56,
                        color: Colors.deepOrange,
                        semanticLabel: 'Foto belum tersedia',
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                nama,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                peran,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                status,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
