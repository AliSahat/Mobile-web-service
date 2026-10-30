import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const ListViewBuilderApp(),
    ),
  );
}

class ListViewBuilderApp extends StatelessWidget {
  const ListViewBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView.builder',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const ListViewBuilderPage(),
    );
  }
}

class ListViewBuilderPage extends StatelessWidget {
  const ListViewBuilderPage({super.key});

  static const List<String> _daftarNama = [
    'Andi Pratama',
    'Budi Santoso',
    'Citra Lestari',
    'Dewi Anggraini',
    'Eko Saputra',
    'Fajar Nugroho',
    'Gita Permata',
    'Hendra Wijaya',
    'Indah Sari',
    'Joko Susilo',
  ];

  void _onNamaTap(BuildContext context, String nama, int nomor) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Memilih #$nomor: $nama'),
          backgroundColor: Colors.teal,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('ListView.builder'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: _daftarNama.length,
        itemBuilder: (context, index) {
          final nama = _daftarNama[index];
          final nomor = index + 1;
          final inisial = nama.isNotEmpty ? nama[0].toUpperCase() : '?';

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              elevation: 1,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.teal.withValues(alpha: 0.25)),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.teal.withValues(alpha: 0.15),
                  foregroundColor: Colors.teal.shade800,
                  child: Text(
                    inisial,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  'Urutan ke-$nomor',
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Colors.black54,
                  ),
                ),
                trailing: const Icon(
                  Icons.person_outline_rounded,
                  color: Colors.teal,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () => _onNamaTap(context, nama, nomor),
              ),
            ),
          );
        },
      ),
    );
  }
}
