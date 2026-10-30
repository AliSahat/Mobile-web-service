import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const ListViewSeparatedApp(),
    ),
  );
}

class ListViewSeparatedApp extends StatelessWidget {
  const ListViewSeparatedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView.separated',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const ListViewSeparatedPage(),
    );
  }
}

class _KontakItem {
  const _KontakItem({
    required this.nama,
    required this.jabatan,
    required this.telepon,
  });

  final String nama;
  final String jabatan;
  final String telepon;
}

class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  static const List<_KontakItem> _daftarKontak = [
    _KontakItem(
      nama: 'Rina Marlina',
      jabatan: 'UI/UX Designer',
      telepon: '0812-3456-7890',
    ),
    _KontakItem(
      nama: 'Dimas Aditya',
      jabatan: 'Mobile Developer',
      telepon: '0813-9876-5432',
    ),
    _KontakItem(
      nama: 'Siti Rahmawati',
      jabatan: 'Backend Engineer',
      telepon: '0857-1122-3344',
    ),
    _KontakItem(
      nama: 'Bagas Prakoso',
      jabatan: 'Project Manager',
      telepon: '0821-5566-7788',
    ),
    _KontakItem(
      nama: 'Nadia Putri',
      jabatan: 'Quality Assurance',
      telepon: '0878-9900-1122',
    ),
  ];

  void _onKontakTap(BuildContext context, _KontakItem kontak) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Menghubungi ${kontak.nama} (${kontak.telepon})'),
          backgroundColor: Colors.deepPurple,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('ListView.separated'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView.separated(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: _daftarKontak.length,
        separatorBuilder: (context, index) => Divider(
          height: 20,
          thickness: 1,
          color: Colors.deepPurple.withValues(alpha: 0.2),
        ),
        itemBuilder: (context, index) {
          final kontak = _daftarKontak[index];
          final inisial =
              kontak.nama.isNotEmpty ? kontak.nama[0].toUpperCase() : '?';

          return Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.deepPurple.withValues(alpha: 0.25),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple.withValues(alpha: 0.15),
                foregroundColor: Colors.deepPurple.shade800,
                child: Text(
                  inisial,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                kontak.nama,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                '${kontak.jabatan} • ${kontak.telepon}',
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.black54,
                ),
              ),
              trailing: const Icon(
                Icons.phone_outlined,
                color: Colors.deepPurple,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onTap: () => _onKontakTap(context, kontak),
            ),
          );
        },
      ),
    );
  }
}
