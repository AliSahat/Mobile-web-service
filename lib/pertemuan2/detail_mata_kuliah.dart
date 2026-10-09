import 'package:flutter/material.dart';

class DetailMataKuliahPage extends StatelessWidget {
  const DetailMataKuliahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Mata Kuliah'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.purple.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(color: Colors.purple.shade200, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withValues(alpha: 0.2),
                spreadRadius: 4,
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.menu_book,
                  size: 64,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 24),
              _buildDataRow(Icons.class_, 'Matkul', 'Pemrograman Mobile'),
              const SizedBox(height: 12),
              _buildDataRow(Icons.credit_card, 'SKS', '3'),
              const SizedBox(height: 12),
              _buildDataRow(Icons.room, 'Ruang', 'Lab Komputer'),
              const SizedBox(height: 12),
              _buildDataRow(Icons.calendar_today, 'Hari', 'Kamis'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.purple.shade400),
          const SizedBox(width: 12),
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Text(
            ':  ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 130,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
