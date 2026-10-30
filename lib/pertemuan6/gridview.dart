import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const GridViewApp(),
    ),
  );
}

class GridViewApp extends StatelessWidget {
  const GridViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const GridViewPage(),
    );
  }
}

class _GridMenu {
  const _GridMenu({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
}

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  static const List<_GridMenu> _menus = [
    _GridMenu(
      title: 'Profil',
      subtitle: 'Informasi akun',
      icon: Icons.person_rounded,
      color: Colors.indigo,
    ),
    _GridMenu(
      title: 'Wallet',
      subtitle: 'Saldo & pembayaran',
      icon: Icons.account_balance_wallet_rounded,
      color: Colors.teal,
    ),
    _GridMenu(
      title: 'Notifikasi',
      subtitle: 'Pesan & pembaruan',
      icon: Icons.notifications_rounded,
      color: Colors.orange,
    ),
    _GridMenu(
      title: 'Riwayat',
      subtitle: 'Catatan transaksi',
      icon: Icons.history_rounded,
      color: Colors.purple,
    ),
    _GridMenu(
      title: 'Pengaturan',
      subtitle: 'Preferensi aplikasi',
      icon: Icons.settings_rounded,
      color: Colors.blue,
    ),
    _GridMenu(
      title: 'Bantuan',
      subtitle: 'Pusat layanan',
      icon: Icons.help_outline_rounded,
      color: Colors.green,
    ),
  ];

  void _onMenuTap(BuildContext context, _GridMenu menu) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Membuka menu ${menu.title}'),
          backgroundColor: menu.color,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('GridView'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: GridView.count(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        children: _menus.map((menu) {
          return Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: menu.color.withValues(alpha: 0.25)),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _onMenuTap(context, menu),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: menu.color.withValues(alpha: 0.14),
                      child: Icon(menu.icon, color: menu.color, size: 28),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      menu.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      menu.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
