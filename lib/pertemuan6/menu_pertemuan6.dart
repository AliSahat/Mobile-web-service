import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gridview.dart' show GridViewPage;
import 'gridview_builder.dart' show GridViewBuilderPage;
import 'listview.dart' show ListViewPage;
import 'listview_builder.dart' show ListViewBuilderPage;
import 'listview_separated.dart' show ListViewSeparatedPage;

const _primary = Color(0xFFE84393);
const _primaryDark = Color(0xFFC23078);
const _secondary = Color(0xFFFD79A8);
const _background = Color(0xFFF7F7FB);
const _textDark = Color(0xFF1E1E2D);
const _textMuted = Color(0xFF8A8AA0);

class _Tugas {
  const _Tugas({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colors,
    required this.page,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;
  final Widget page;
}

class MenuPertemuan6Page extends StatelessWidget {
  const MenuPertemuan6Page({super.key});

  /// Tambahkan tugas Pertemuan 6 di sini, contoh:
  ///
  /// ```dart
  /// _Tugas(
  ///   title: 'Nama Tugas',
  ///   subtitle: 'Keterangan singkat',
  ///   icon: Icons.star_rounded,
  ///   colors: [Color(0xFFE84393), Color(0xFFFD79A8)],
  ///   page: NamaTugasPage(),
  /// ),
  /// ```
  static const List<_Tugas> _tugas = [
    _Tugas(
      title: 'ListView Menu',
      subtitle: 'Daftar menu Profil, Notifikasi, Pengaturan, dan lainnya',
      icon: Icons.list_alt_rounded,
      colors: [Color(0xFFE84393), Color(0xFFFD79A8)],
      page: ListViewPage(),
    ),
    _Tugas(
      title: 'ListView.builder',
      subtitle: 'Menampilkan 10 daftar nama orang menggunakan ListView.builder',
      icon: Icons.people_alt_rounded,
      colors: [Color(0xFF009688), Color(0xFF4DB6AC)],
      page: ListViewBuilderPage(),
    ),
    _Tugas(
      title: 'ListView.separated',
      subtitle: 'Menampilkan daftar kontak dengan pemisah Divider',
      icon: Icons.view_agenda_rounded,
      colors: [Color(0xFF673AB7), Color(0xFF9575CD)],
      page: ListViewSeparatedPage(),
    ),
    _Tugas(
      title: 'GridView',
      subtitle: 'Tampilan grid menu Profil, Wallet, Notifikasi, dan lainnya',
      icon: Icons.grid_view_rounded,
      colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
      page: GridViewPage(),
    ),
    _Tugas(
      title: 'GridView.builder',
      subtitle: 'Menampilkan katalog produk dinamis menggunakan GridView.builder',
      icon: Icons.apps_rounded,
      colors: [Color(0xFFFF5722), Color(0xFFFF8A65)],
      page: GridViewBuilderPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(jumlahTugas: _tugas.length),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Daftar Tugas',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: _textDark,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${_tugas.length} item',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: _textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _tugas.isEmpty
                    ? const _EmptyState()
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                        itemCount: _tugas.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 14),
                        itemBuilder: (context, i) =>
                            _TugasCard(nomor: i + 1, tugas: _tugas[i]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.jumlahTugas});

  final int jumlahTugas;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [_primaryDark, _primary, _secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            const Positioned(top: -40, right: -30, child: _Bubble(size: 140)),
            const Positioned(bottom: -50, left: -20, child: _Bubble(size: 110)),
            const Positioned(top: 34, right: 96, child: _Bubble(size: 16)),
            Padding(
              padding: EdgeInsets.fromLTRB(16, topPadding + 12, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _GlassButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () => Navigator.of(context).maybePop(),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Menu Latihan',
                              style: GoogleFonts.poppins(
                                color: Colors.white.withValues(alpha: 0.85),
                                fontSize: 11.5,
                              ),
                            ),
                            Text(
                              'Pertemuan 6',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                height: 1.2,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.12),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.auto_awesome_mosaic_rounded,
                          color: _primary,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lightbulb_outline_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Pilih tugas yang ingin dibuka.',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12.5,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$jumlahTugas tugas',
                            style: GoogleFonts.poppins(
                              color: _primaryDark,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _primary.withValues(alpha: 0.08),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: _primary.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.inbox_rounded,
                  color: _primary,
                  size: 34,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Belum ada tugas',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Tugas Pertemuan 6 akan muncul di sini.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 12.5, color: _textMuted),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GlassButton extends StatelessWidget {
  const _GlassButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        child: SizedBox(
          width: 42,
          height: 42,
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.08),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
    );
  }
}

class _TugasCard extends StatelessWidget {
  const _TugasCard({required this.nomor, required this.tugas});

  final int nomor;
  final _Tugas tugas;

  @override
  Widget build(BuildContext context) {
    final accent = tugas.colors.first;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.10),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.of(
            context,
          ).push(MaterialPageRoute<void>(builder: (_) => tugas.page)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: tugas.colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(tugas.icon, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TUGAS ${nomor.toString().padLeft(2, '0')}',
                        style: GoogleFonts.poppins(
                          fontSize: 10.5,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                          color: accent,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        tugas.title,
                        style: GoogleFonts.poppins(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                          color: _textDark,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        tugas.subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 12.5,
                          color: _textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: _textMuted,
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
