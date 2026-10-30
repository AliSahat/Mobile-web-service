import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const ListViewApp(),
    ),
  );
}

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const ListViewPage(),
    );
  }
}

class _MenuItem {
  const _MenuItem({
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

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  static const List<_MenuItem> _menuItems = [
    _MenuItem(
      title: 'Profil',
      subtitle: 'Lihat dan ubah informasi data diri Anda',
      icon: Icons.person,
      color: Colors.indigo,
    ),
    _MenuItem(
      title: 'Notifikasi',
      subtitle: 'Atur preferensi pemberitahuan dan pesan masuk',
      icon: Icons.notifications,
      color: Colors.orange,
    ),
    _MenuItem(
      title: 'Keamanan & Privasi',
      subtitle: 'Ubah kata sandi dan kelola keamanan akun',
      icon: Icons.security,
      color: Colors.teal,
    ),
    _MenuItem(
      title: 'Pengaturan',
      subtitle: 'Sesuaikan tema, bahasa, dan tampilan aplikasi',
      icon: Icons.settings,
      color: Colors.blue,
    ),
    _MenuItem(
      title: 'Riwayat Aktivitas',
      subtitle: 'Pantau catatan aktivitas dan transaksi terakhir',
      icon: Icons.history,
      color: Colors.purple,
    ),
    _MenuItem(
      title: 'Bantuan & Dukungan',
      subtitle: 'Pusat bantuan, FAQ, dan hubungi layanan pelanggan',
      icon: Icons.help_outline,
      color: Colors.green,
    ),
    _MenuItem(
      title: 'Tentang Aplikasi',
      subtitle: 'Informasi versi aplikasi, lisensi, dan pengembang',
      icon: Icons.info_outline,
      color: Colors.cyan,
    ),
  ];

  void _onItemTap(BuildContext context, _MenuItem item) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Membuka menu ${item.title}'),
          backgroundColor: item.color,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('ListView'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: ListView.separated(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: _menuItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = _menuItems[index];
          return Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: item.color.withValues(alpha: 0.25)),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              leading: CircleAvatar(
                backgroundColor: item.color.withValues(alpha: 0.12),
                child: Icon(item.icon, color: item.color),
              ),
              title: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                item.subtitle,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.black54,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onTap: () => _onItemTap(context, item),
            ),
          );
        },
      ),
    );
  }
}
