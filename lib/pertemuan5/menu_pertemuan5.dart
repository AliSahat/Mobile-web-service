import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Input_sederhana.dart' show InputSederhanaPage;
import 'form_registrasi.dart' show FormRegistrasiPage;
import 'konventer_sehu.dart' show KonverterSuhuPage;
import 'tugas_kelompok.dart' show TugasKelompokPage;

const _primary = Color(0xFFE17055);
const _primaryDark = Color(0xFFC4553B);
const _secondary = Color(0xFFFAB1A0);
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

class MenuPertemuan5Page extends StatelessWidget {
  const MenuPertemuan5Page({super.key});

  /// Tambahkan tugas Pertemuan 5 di sini, contoh:
  ///
  /// ```dart
  /// _Tugas(
  ///   title: 'Nama Tugas',
  ///   subtitle: 'Keterangan singkat',
  ///   icon: Icons.star_rounded,
  ///   colors: [Color(0xFFE17055), Color(0xFFFAB1A0)],
  ///   page: NamaTugasPage(),
  /// ),
  /// ```
  static const List<_Tugas> _tugas = [
    _Tugas(
      title: 'Input Sederhana',
      subtitle: 'TextField input nama dengan tombol Proses Data',
      icon: Icons.text_fields_rounded,
      colors: [Color(0xFF3F51B5), Color(0xFF7986CB)],
      page: InputSederhanaPage(),
    ),
    _Tugas(
      title: 'Form Registrasi',
      subtitle: 'Formulir pendaftaran dengan 4 input data diri',
      icon: Icons.app_registration_rounded,
      colors: [Color(0xFFFF5722), Color(0xFFFF8A65)],
      page: FormRegistrasiPage(),
    ),
    _Tugas(
      title: 'Konverter Suhu',
      subtitle: 'Konversi lengkap Celcius (°C), Reamur (°R), Fahrenheit (°F), & Kelvin (K)',
      icon: Icons.thermostat_rounded,
      colors: [Color(0xFF009688), Color(0xFF4DB6AC)],
      page: KonverterSuhuPage(),
    ),
    _Tugas(
      title: 'Tugas Kelompok',
      subtitle: 'Kalkulator Sederhana (+, -, ×, ÷)',
      icon: Icons.calculate_rounded,
      colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
      page: TugasKelompokPage(),
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
                              'Pertemuan 5',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                height: 1.2,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text("Materi Textfield", style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ))
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
                          Icons.extension_rounded,
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
                'Tugas Pertemuan 5 akan muncul di sini.',
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
