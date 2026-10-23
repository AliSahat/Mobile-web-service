import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const TugasKelompokApp(),
    ),
  );
}

class TugasKelompokApp extends StatelessWidget {
  const TugasKelompokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Sederhana - Ali Sahat Pardomuan / 5220411321',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const TugasKelompokPage(),
    );
  }
}

class TugasKelompokPage extends StatefulWidget {
  const TugasKelompokPage({super.key});

  @override
  State<TugasKelompokPage> createState() => _TugasKelompokPageState();
}

class _TugasKelompokPageState extends State<TugasKelompokPage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();

  String _operasiAktif = '+';
  String _teksHasil = '0';
  String _ekspresi = 'Masukkan dua angka lalu pilih operasi';

  @override
  void dispose() {
    _angka1Controller.dispose();
    _angka2Controller.dispose();
    super.dispose();
  }

  String _formatAngka(double nilai) {
    if (nilai == nilai.roundToDouble()) {
      return nilai.toInt().toString();
    }
    return nilai
        .toStringAsFixed(2)
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }

  void _hitung(String simbol) {
    final input1 = _angka1Controller.text.trim().replaceAll(',', '.');
    final input2 = _angka2Controller.text.trim().replaceAll(',', '.');

    final angka1 = double.tryParse(input1);
    final angka2 = double.tryParse(input2);

    if (angka1 == null || angka2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          content: const Row(
            children: [
              Icon(Icons.error_outline_rounded, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text('Harap masukkan kedua angka dengan benar!'),
              ),
            ],
          ),
        ),
      );
      return;
    }

    if (simbol == '÷' && angka2 == 0) {
      setState(() {
        _operasiAktif = simbol;
        _teksHasil = 'Tidak bisa dibagi 0';
        _ekspresi = '${_formatAngka(angka1)} ÷ 0';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.orange.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          content: const Text('Pembagian dengan angka nol tidak terdefinisi!'),
        ),
      );
      return;
    }

    double hasil;
    switch (simbol) {
      case '+':
        hasil = angka1 + angka2;
      case '-':
        hasil = angka1 - angka2;
      case '×':
        hasil = angka1 * angka2;
      case '÷':
        hasil = angka1 / angka2;
      default:
        hasil = 0;
    }

    setState(() {
      _operasiAktif = simbol;
      _teksHasil = _formatAngka(hasil);
      _ekspresi =
          '${_formatAngka(angka1)} $simbol ${_formatAngka(angka2)} = $_teksHasil';
    });
  }

  void _reset() {
    _angka1Controller.clear();
    _angka2Controller.clear();
    setState(() {
      _operasiAktif = '+';
      _teksHasil = '0';
      _ekspresi = 'Masukkan dua angka lalu pilih operasi';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        titleSpacing: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Kalkulator Sederhana',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Ali Sahat Pardomuan • 5220411321',
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
                height: 1.2,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
// lanjut Kartu Hasil Perhitungan
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF4F46E5).withValues(alpha: 0.28),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'HASIL PERHITUNGAN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          Text(
                            'Operasi ($_operasiAktif)',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.85),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _ekspresi,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Hasil: $_teksHasil',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
//form input
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Input Angka',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1E2D),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextField(
                        controller: _angka1Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Angka Pertama',
                          hintText: 'Masukkan angka ke-1',
                          prefixIcon: const Icon(Icons.looks_one_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _angka2Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Angka Kedua',
                          hintText: 'Masukkan angka ke-2',
                          prefixIcon: const Icon(Icons.looks_two_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Pilih Operasi Matematika',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1E2D),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _TombolOperasi(
                              simbol: '+',
                              label: 'Tambah (+)',
                              warna: const Color(0xFF10B981),
                              onTap: () => _hitung('+'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _TombolOperasi(
                              simbol: '-',
                              label: 'Kurang (-)',
                              warna: const Color(0xFFF59E0B),
                              onTap: () => _hitung('-'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _TombolOperasi(
                              simbol: '×',
                              label: 'Kali (×)',
                              warna: const Color(0xFF3B82F6),
                              onTap: () => _hitung('×'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _TombolOperasi(
                              simbol: '÷',
                              label: 'Bagi (÷)',
                              warna: const Color(0xFFEC4899),
                              onTap: () => _hitung('÷'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 48,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFEF4444),
                            side: const BorderSide(
                              color: Color(0xFFEF4444),
                              width: 1.4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: _reset,
                          icon: const Icon(Icons.refresh_rounded),
                          label: const Text(
                            'Reset Kalkulator',
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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

class _TombolOperasi extends StatelessWidget {
  const _TombolOperasi({
    required this.simbol,
    required this.label,
    required this.warna,
    required this.onTap,
  });

  final String simbol;
  final String label;
  final Color warna;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: warna,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
