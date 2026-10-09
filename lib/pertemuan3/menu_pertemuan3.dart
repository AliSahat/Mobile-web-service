import 'package:flutter/material.dart';

import '../widgets/menu_page.dart';
import 'column&row.dart' show ProfilMahasiswaPage;
import 'image_network.dart' show NetworkImagePage;
import 'padding.dart' show PaddingPage;
import 'tampilan_image_assset.dart' show ImageAssetPage;
import 'tugas_kelompok.dart' show TugasKelompokPage;

class MenuPertemuan3Page extends StatelessWidget {
  const MenuPertemuan3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuPage(
      title: 'Pertemuan 3',
      description: 'Pilih tugas yang ingin dibuka.',
      items: [
        MenuItem(
          title: 'Tugas Kelompok/individu',
          subtitle: 'Kartu profil tiga anggota kelompok',
          icon: Icons.groups_outlined,
          color: Colors.indigo,
          page: TugasKelompokPage(),
        ),
        MenuItem(
          title: 'Column & Row',
          subtitle: 'Profil mahasiswa',
          icon: Icons.view_week_outlined,
          color: Colors.teal,
          page: ProfilMahasiswaPage(),
        ),
        MenuItem(
          title: 'Network Image',
          subtitle: 'Gambar produk dari internet',
          icon: Icons.public,
          color: Colors.purple,
          page: NetworkImagePage(),
        ),
        MenuItem(
          title: 'Image Asset',
          subtitle: 'Foto profil dari aset lokal',
          icon: Icons.image_outlined,
          color: Colors.pink,
          page: ImageAssetPage(),
        ),
        MenuItem(
          title: 'Padding',
          subtitle: 'Jarak di dalam kartu profil',
          icon: Icons.space_bar,
          color: Colors.orange,
          page: PaddingPage(),
        ),
      ],
    );
  }
}
