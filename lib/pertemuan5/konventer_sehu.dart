import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const KonverterSuhuApp(),
    ),
  );
}

class KonverterSuhuApp extends StatelessWidget {
  const KonverterSuhuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverter Suhu Lengkap',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const KonverterSuhuPage(),
    );
  }
}

enum SkalaSuhu {
  celcius('Celcius (°C)', '°C', 'C'),
  reamur('Reamur (°R)', '°R', 'R'),
  fahrenheit('Fahrenheit (°F)', '°F', 'F'),
  kelvin('Kelvin (K)', 'K', 'K');

  const SkalaSuhu(this.label, this.simbol, this.kode);
  final String label;
  final String simbol;
  final String kode;
}

class KonverterSuhuPage extends StatefulWidget {
  const KonverterSuhuPage({super.key});

  @override
  State<KonverterSuhuPage> createState() => _KonverterSuhuPageState();
}

class _KonverterSuhuPageState extends State<KonverterSuhuPage> {
  final TextEditingController _suhuController = TextEditingController();
  SkalaSuhu _skalaAsal = SkalaSuhu.celcius;

  double _celcius = 0.0;
  double _reamur = 0.0;
  double _fahrenheit = 32.0;
  double _kelvin = 273.15;
  bool _sudahDihitung = false;

  @override
  void dispose() {
    _suhuController.dispose();
    super.dispose();
  }

  void _hitungKonversi() {
    final input = _suhuController.text.trim().replaceAll(',', '.');
    final nilai = double.tryParse(input);

    if (nilai == null) {
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
              Expanded(child: Text('Masukkan angka suhu yang valid!')),
            ],
          ),
        ),
      );
      return;
    }

    double c;
    switch (_skalaAsal) {
      case SkalaSuhu.celcius:
        c = nilai;
      case SkalaSuhu.reamur:
        c = (5 / 4) * nilai;
      case SkalaSuhu.fahrenheit:
        c = (nilai - 32) * 5 / 9;
      case SkalaSuhu.kelvin:
        c = nilai - 273.15;
    }

    setState(() {
      _celcius = c;
      _reamur = (4 / 5) * c;
      _fahrenheit = (9 / 5) * c + 32;
      _kelvin = c + 273.15;
      _sudahDihitung = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: const Text('Konverter Suhu Lengkap'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Pilih Skala Asal & Masukkan Suhu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<SkalaSuhu>(
                  initialValue: _skalaAsal,
                  decoration: const InputDecoration(
                    labelText: 'Skala Suhu Asal',
                    prefixIcon: Icon(Icons.thermostat_rounded),
                    border: OutlineInputBorder(),
                  ),
                  items: SkalaSuhu.values
                      .map(
                        (skala) => DropdownMenuItem(
                          value: skala,
                          child: Text(skala.label),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() => _skalaAsal = val);
                      if (_suhuController.text.trim().isNotEmpty) {
                        _hitungKonversi();
                      }
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _suhuController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Suhu dalam ${_skalaAsal.label}',
                    hintText: 'Contoh: 27',
                    prefixIcon: const Icon(Icons.edit_note_rounded),
                    suffixText: _skalaAsal.simbol,
                    border: const OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => _hitungKonversi(),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _hitungKonversi,
                    icon: const Icon(Icons.calculate_rounded),
                    label: const Text(
                      'Hitung Semua Konversi',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Hasil Konversi: ${_reamur.toStringAsFixed(2)} °R',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.45,
                  children: [
                    _HasilSuhuCard(
                      nama: 'Celcius',
                      rumus: _skalaAsal == SkalaSuhu.celcius
                          ? 'Suhu Asal'
                          : '°C',
                      nilai: '${_celcius.toStringAsFixed(2)} °C',
                      icon: Icons.wb_sunny_outlined,
                      warna: Colors.blue,
                      aktif: _sudahDihitung,
                    ),
                    _HasilSuhuCard(
                      nama: 'Reamur',
                      rumus: '4/5 × °C',
                      nilai: '${_reamur.toStringAsFixed(2)} °R',
                      icon: Icons.device_thermostat_rounded,
                      warna: Colors.teal,
                      aktif: _sudahDihitung,
                    ),
                    _HasilSuhuCard(
                      nama: 'Fahrenheit',
                      rumus: '(9/5 × °C) + 32',
                      nilai: '${_fahrenheit.toStringAsFixed(2)} °F',
                      icon: Icons.local_fire_department_outlined,
                      warna: Colors.deepOrange,
                      aktif: _sudahDihitung,
                    ),
                    _HasilSuhuCard(
                      nama: 'Kelvin',
                      rumus: '°C + 273.15',
                      nilai: '${_kelvin.toStringAsFixed(2)} K',
                      icon: Icons.ac_unit_rounded,
                      warna: Colors.indigo,
                      aktif: _sudahDihitung,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HasilSuhuCard extends StatelessWidget {
  const _HasilSuhuCard({
    required this.nama,
    required this.rumus,
    required this.nilai,
    required this.icon,
    required this.warna,
    required this.aktif,
  });

  final String nama;
  final String rumus;
  final String nilai;
  final IconData icon;
  final MaterialColor warna;
  final bool aktif;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: aktif ? warna.shade300 : Colors.grey.shade300,
          width: 1.3,
        ),
        boxShadow: [
          BoxShadow(
            color: warna.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: warna.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: warna.shade700),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      rumus,
                      style: TextStyle(
                        fontSize: 10.5,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            nilai,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: warna.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
