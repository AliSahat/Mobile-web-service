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
      title: 'Katalog Produk Gadget',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F766E)),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const TugasKelompokPage(),
    );
  }
}

class Produk {
  const Produk({
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
    required this.ikonFallback,
  });

  final String nama;
  final String kategori;
  final String harga;
  final String deskripsi;
  final String gambar;
  final IconData ikonFallback;
}

class TugasKelompokPage extends StatelessWidget {
  const TugasKelompokPage({super.key});

  static const Color _primary = Color(0xFF0F766E);
  static const Color _bgPage = Color(0xFFF5F7FA);

  static const List<Produk> _daftarProduk = [
    Produk(
      nama: 'ASUS ZenBook 14 OLED',
      kategori: 'Laptop',
      harga: 'Rp 14.500.000',
      deskripsi:
          'Laptop tipis dan ringan dengan layar OLED 14 inci beresolusi 2.8K, '
          'prosesor Intel Core i7 generasi terbaru, RAM 16 GB LPDDR5, serta '
          'penyimpanan SSD NVMe 512 GB. Dirancang untuk produktivitas harian, '
          'pemrograman, hingga kebutuhan desain kreatif.',
      gambar:
          'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500&h=500&fit=crop',
      ikonFallback: Icons.laptop_mac_rounded,
    ),
    Produk(
      nama: 'Samsung Galaxy S24',
      kategori: 'Smartphone',
      harga: 'Rp 12.999.000',
      deskripsi:
          'Smartphone flagship dengan panel Dynamic AMOLED 2X 120Hz yang tajam, '
          'sistem tiga kamera belakang 50 MP dengan dukungan fitur AI fotografi, '
          'ketahanan air IP68, serta baterai tahan seharian.',
      gambar:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500&h=500&fit=crop',
      ikonFallback: Icons.smartphone_rounded,
    ),
    Produk(
      nama: 'Sony WH-1000XM5',
      kategori: 'Audio',
      harga: 'Rp 4.250.000',
      deskripsi:
          'Headphone nirkabel over-ear dengan teknologi Active Noise Cancelling '
          'terdepan, dukungan audio beresolusi tinggi (Hi-Res Audio), bantalan '
          'telinga kulit sintetis yang lembut, dan daya tahan baterai 30 jam.',
      gambar:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&h=500&fit=crop',
      ikonFallback: Icons.headphones_rounded,
    ),
    Produk(
      nama: 'Apple Watch Series 9',
      kategori: 'Wearable',
      harga: 'Rp 6.150.000',
      deskripsi:
          'Jam tangan pintar dengan layar Retina Always-On yang cerah, sensor '
          'pemantauan detak jantung dan kadar oksigen darah (SpO2), pelacakan '
          'tidur otomatis, GPS presisi, serta tahan air hingga 50 meter.',
      gambar:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&h=500&fit=crop',
      ikonFallback: Icons.watch_rounded,
    ),
    Produk(
      nama: 'Fujifilm X-T30 II',
      kategori: 'Kamera',
      harga: 'Rp 16.800.000',
      deskripsi:
          'Kamera mirrorless ringkas dengan sensor APS-C X-Trans CMOS 4 26.1 MP, '
          'perekaman video 4K/30p, autofokus cepat dan akurat, serta koleksi '
          'simulasi warna film khas Fujifilm untuk fotografer dan kreator.',
      gambar:
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=500&h=500&fit=crop',
      ikonFallback: Icons.camera_alt_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgPage,
      appBar: AppBar(
        title: const Text(
          'Katalog Gadget',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        backgroundColor: _primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  children: [
                    const Text(
                      'DAFTAR PRODUK',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${_daftarProduk.length} Item',
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                          color: _primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              for (int i = 0; i < _daftarProduk.length; i++) ...[
                _ItemProdukCard(produk: _daftarProduk[i]),
                if (i < _daftarProduk.length - 1) const SizedBox(height: 12),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemProdukCard extends StatelessWidget {
  const _ItemProdukCard({required this.produk});

  final Produk produk;

  static const Color _primary = Color(0xFF0F766E);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 14,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              produk.gambar,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              semanticLabel: 'Foto ${produk.nama}',
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 64,
                  height: 64,
                  color: const Color(0xFFF0FDFA),
                  child: Icon(
                    produk.ikonFallback,
                    size: 28,
                    color: _primary,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produk.kategori.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  produk.nama,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  produk.harga,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: _primary,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF0FDFA),
              foregroundColor: _primary,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: _primary.withValues(alpha: 0.25)),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => DetailProdukPage(produk: produk),
                ),
              );
            },
            child: const Text(
              'Detail',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailProdukPage extends StatelessWidget {
  const DetailProdukPage({super.key, required this.produk});

  final Produk produk;

  static const Color _primary = Color(0xFF0F766E);
  static const Color _bgPage = Color(0xFFF5F7FA);

  void _tampilkanDialogKonfirmasi(BuildContext context) {
    final parentContext = context;
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Konfirmasi Pesanan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
          content: Text(
            'Apakah Anda yakin ingin memesan ${produk.nama} '
            'seharga ${produk.harga}?',
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF475569),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text(
                'Batal',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(parentContext).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: const Color(0xFF1E293B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    content: const Text('Pesanan berhasil diproses!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                'Ya/Konfirmasi',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgPage,
      appBar: AppBar(
        title: const Text(
          'Detail Produk',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        backgroundColor: _primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A0F172A),
                  blurRadius: 16,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: Image.network(
                      produk.gambar,
                      fit: BoxFit.cover,
                      semanticLabel: 'Gambar ${produk.nama}',
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFFF0FDFA),
                          child: Icon(
                            produk.ikonFallback,
                            size: 72,
                            color: _primary,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDFA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        produk.kategori,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _primary,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.verified_rounded,
                      size: 16,
                      color: _primary,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Stok Tersedia',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  produk.nama,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  produk.harga,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: _primary,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(height: 1, color: Color(0xFFE2E8F0)),
                ),
                const Text(
                  'Deskripsi Lengkap',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  produk.deskripsi,
                  style: const TextStyle(
                    fontSize: 13.5,
                    height: 1.6,
                    color: Color(0xFF475569),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => _tampilkanDialogKonfirmasi(context),
                  icon: const Icon(Icons.shopping_bag_outlined, size: 20),
                  label: const Text(
                    'Beli Sekarang',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
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
