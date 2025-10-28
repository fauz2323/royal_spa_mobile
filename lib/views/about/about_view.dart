import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Tentang Aplikasi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo/Icon Section
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.spa,
                size: 60,
                color: Colors.white,
              ),
            ),

            // App Name
            const Text(
              'Royal Garden Spa',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4CAF50),
              ),
            ),

            const SizedBox(height: 10),

            // Tagline
            const Text(
              'Relaksasi & Kecantikan Terbaik',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 30),

            // About Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Color(0xFF4CAF50),
                          size: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Tentang Aplikasi',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Royal Garden Spa adalah aplikasi mobile yang memudahkan Anda untuk memesan layanan spa dan perawatan kecantikan terbaik. Dengan berbagai pilihan treatment yang tersedia, Anda dapat menikmati pengalaman relaksasi yang tak terlupakan.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Features Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.star_outline,
                          color: Color(0xFF4CAF50),
                          size: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Fitur Unggulan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    _buildFeatureItem(
                      Icons.calendar_today,
                      'Pemesanan Online',
                      'Pesan layanan spa dengan mudah dan cepat',
                    ),
                    _buildFeatureItem(
                      Icons.history,
                      'Riwayat Pemesanan',
                      'Lihat dan kelola riwayat treatment Anda',
                    ),
                    _buildFeatureItem(
                      Icons.account_circle,
                      'Profil Personal',
                      'Kelola informasi dan preferensi pribadi',
                    ),
                    _buildFeatureItem(
                      Icons.spa,
                      'Layanan Lengkap',
                      'Berbagai pilihan treatment spa dan kecantikan',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // App Info Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildInfoRow('Versi Aplikasi', '1.0.0'),
                    _buildInfoRow('Tahun Pembuatan', '2025'),
                    _buildInfoRow('Platform', 'Flutter'),
                    _buildInfoRow('Developer', 'Royal Garden Spa Team'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Contact Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.contact_phone,
                          color: Color(0xFF4CAF50),
                          size: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Hubungi Kami',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    _buildContactItem(Icons.email, 'info@royalgardenspa.com'),
                    _buildContactItem(Icons.phone, '+62 123 456 7890'),
                    _buildContactItem(Icons.location_on, 'Jakarta, Indonesia'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Copyright
            Text(
              '© 2025 Royal Garden Spa\nAll Rights Reserved',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF4CAF50),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4CAF50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: const Color(0xFF4CAF50),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
