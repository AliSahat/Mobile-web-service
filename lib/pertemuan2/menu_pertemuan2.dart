import 'package:flutter/material.dart';

import '../widgets/menu_page.dart';
import 'detail_mata_kuliah.dart';

class MenuPertemuan2Page extends StatelessWidget {
  const MenuPertemuan2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuPage(
      title: 'Pertemuan 2',
      description: 'Pilih tugas yang ingin dibuka.',
      items: [
        MenuItem(
          title: 'Detail Mata Kuliah',
          subtitle: 'Informasi perkuliahan',
          icon: Icons.menu_book_outlined,
          color: Colors.purple,
          page: DetailMataKuliahPage(),
        ),
      ],
    );
  }
}
