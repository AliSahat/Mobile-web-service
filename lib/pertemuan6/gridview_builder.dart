import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const GridViewBuilderApp(),
    ),
  );
}

class GridViewBuilderApp extends StatelessWidget {
  const GridViewBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView.builder',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const GridViewBuilderPage(),
    );
  }
}

class _ProdukItem {
  const _ProdukItem({
    required this.nama,
    required this.harga,
    required this.icon,
    required this.color,
  });

  final String nama;
  final String harga;
  final IconData icon;
  final Color color;
}

class GridViewBuilderPage extends StatelessWidget {
  const GridViewBuilderPage({super.key});

  static const List<_ProdukItem> _daftarProduk = [
    _ProdukItem(
      nama: 'Smartphone',
      harga: 'Rp 4.500.000',
      icon: Icons.smartphone_rounded,
      color: Colors.indigo,
    ),
    _ProdukItem(
      nama: 'Laptop',
      harga: 'Rp 9.800.000',
      icon: Icons.laptop_mac_rounded,
      color: Colors.teal,
    ),
    _ProdukItem(
      nama: 'Headphone',
      harga: 'Rp 650.000',
      icon: Icons.headphones_rounded,
      color: Colors.deepOrange,
    ),
    _ProdukItem(
      nama: 'Smartwatch',
      harga: 'Rp 1.250.000',
      icon: Icons.watch_rounded,
      color: Colors.purple,
    ),
    _ProdukItem(
      nama: 'Kamera',
      harga: 'Rp 6.200.000',
      icon: Icons.camera_alt_rounded,
      color: Colors.blue,
    ),
    _ProdukItem(
      nama: 'Keyboard',
      harga: 'Rp 450.000',
      icon: Icons.keyboard_rounded,
      color: Colors.green,
    ),
    _ProdukItem(
      nama: 'Mouse Wireless',
      harga: 'Rp 250.000',
      icon: Icons.mouse_rounded,
      color: Colors.pink,
    ),
    _ProdukItem(
      nama: 'Speaker Bluetooth',
      harga: 'Rp 550.000',
      icon: Icons.speaker_rounded,
      color: Colors.amber,
    ),
  ];

  void _onProdukTap(BuildContext context, _ProdukItem produk, int nomor) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Item #$nomor: ${produk.nama} (${produk.harga})'),
          backgroundColor: produk.color,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('GridView.builder'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: GridView.builder(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemCount: _daftarProduk.length,
        itemBuilder: (context, index) {
          final produk = _daftarProduk[index];
          final nomor = index + 1;

          return Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: produk.color.withValues(alpha: 0.25)),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _onProdukTap(context, produk, nomor),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: produk.color.withValues(alpha: 0.14),
                      child: Icon(produk.icon, color: produk.color, size: 26),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      produk.nama,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      produk.harga,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: produk.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
