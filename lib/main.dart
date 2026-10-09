import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'pertemuan2/menu_pertemuan2.dart';
import 'pertemuan3/menu_pertemuan3.dart';
import 'widgets/menu_page.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Latihan Flutter',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const MenuUtamaPage(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MenuUtamaPage extends StatelessWidget {
  const MenuUtamaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuPage(
      title: 'Menu Latihan Flutter',
      description: 'Pilih pertemuan untuk melihat daftar tugas.',
      items: [
        MenuItem(
          title: 'Pertemuan 2',
          subtitle: '1 tugas',
          icon: Icons.folder_outlined,
          color: Colors.purple,
          page: MenuPertemuan2Page(),
        ),
        MenuItem(
          title: 'Pertemuan 3',
          subtitle: '5 tugas',
          icon: Icons.folder_outlined,
          color: Colors.teal,
          page: MenuPertemuan3Page(),
        ),
      ],
    );
  }
}
