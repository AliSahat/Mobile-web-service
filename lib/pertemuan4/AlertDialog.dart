import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const AlertDialogApp(),
    ),
  );
}

class AlertDialogApp extends StatelessWidget {
  const AlertDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const AlertDialogPage(),
    );
  }
}

class AlertDialogPage extends StatelessWidget {
  const AlertDialogPage({super.key});

  void _tampilkanDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Informasi Profil'),
          content: const Text(
            'Nama: sitinurbaya'
            'Peran: artis indonesia'
            'Status: Aktif & Terverifikasi',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Tutup',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('AlertDialog'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.indigo),
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/women1.jpeg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  semanticLabel: 'women of indonesia',
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 50,
                      color: Colors.indigo.shade100,
                      child: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.indigo,
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
                      'women of indonesia',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'artis indonesia',
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
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _tampilkanDialog(context),
                child: const Text('Detail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
