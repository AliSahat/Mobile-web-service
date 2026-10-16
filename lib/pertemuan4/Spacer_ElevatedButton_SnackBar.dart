// ignore_for_file: file_names
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const SpacerElevatedButtonSnackBarApp(),
    ),
  );
}

class SpacerElevatedButtonSnackBarApp extends StatelessWidget {
  const SpacerElevatedButtonSnackBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spacer, ElevatedButton, SnackBar',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const SpacerElevatedButtonSnackBarPage(),
    );
  }
}

class SpacerElevatedButtonSnackBarPage extends StatelessWidget {
  const SpacerElevatedButtonSnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('Spacer, ElevatedButton, SnackBar'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Text(
                'Status: Aktif',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                  foregroundColor: Colors.purple,
                  elevation: 0,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Status pengguna saat ini: Aktif'),
                      duration: Duration(seconds: 2),
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
