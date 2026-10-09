import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(enabled: true, builder: (context) => const ImageAssetApp()),
  );
}

class ImageAssetApp extends StatelessWidget {
  const ImageAssetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Asset',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const ImageAssetPage(),
    );
  }
}

class ImageAssetPage extends StatelessWidget {
  const ImageAssetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Asset'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.pink),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/women.jpg',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    semanticLabel: 'women of indonesia',
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60,
                        height: 60,
                        color: Colors.pink.shade100,
                        child: const Icon(
                          Icons.person,
                          size: 36,
                          color: Colors.pink,
                          semanticLabel: 'Foto belum tersedia',
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                const Flexible(
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
                      SizedBox(height: 8),
                      Text(
                        'Profesi: Aktris / Model',
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Negara: Indonesia',
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
