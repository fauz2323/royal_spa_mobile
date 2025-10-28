import 'package:flutter/material.dart';

class QnaView extends StatelessWidget {
  const QnaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text(
          'Tanya Jawab',
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1E1E1E)),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.help_outline_rounded,
                    size: 56,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Pertanyaan yang Sering Diajukan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Temukan jawaban untuk pertanyaan Anda',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Tentang Aplikasi Section
            _buildSectionTitle('Tentang Aplikasi'),
            const SizedBox(height: 12),
            _buildQnAItem(
              'Apa itu aplikasi Royal Garden Spa?',
              'Royal Garden Spa adalah aplikasi mobile yang memudahkan Anda untuk memesan berbagai layanan spa dan perawatan kecantikan secara online. Dengan aplikasi ini, Anda dapat menjelajahi berbagai treatment, melihat detail layanan, melakukan pemesanan, dan mengelola riwayat booking Anda dengan mudah.',
              Icons.phone_android,
            ),
            _buildQnAItem(
              'Apakah aplikasi ini gratis?',
              'Ya, aplikasi Royal Garden Spa dapat diunduh dan digunakan secara gratis. Anda hanya perlu membayar untuk layanan spa yang Anda pesan.',
              Icons.attach_money,
            ),
            _buildQnAItem(
              'Bagaimana cara menggunakan aplikasi ini?',
              'Setelah mengunduh aplikasi, Anda perlu mendaftar dengan email dan membuat akun. Kemudian Anda dapat menjelajahi layanan yang tersedia, memilih treatment yang diinginkan, dan melakukan pemesanan dengan mengikuti langkah-langkah yang ada.',
              Icons.touch_app,
            ),
            _buildQnAItem(
              'Apakah data saya aman?',
              'Keamanan data Anda adalah prioritas kami. Aplikasi ini menggunakan enkripsi dan sistem keamanan modern untuk melindungi informasi pribadi dan data transaksi Anda.',
              Icons.security,
            ),

            const SizedBox(height: 32),

            // Tentang Layanan Spa Section
            _buildSectionTitle('Tentang Layanan Spa'),
            const SizedBox(height: 12),
            _buildQnAItem(
              'Apa saja layanan yang tersedia?',
              'Kami menyediakan berbagai layanan spa dan perawatan kecantikan seperti massage therapy (Swedish, Thai, Balinese, Hot Stone), facial treatment (Deep Cleansing, Anti-Aging, Brightening), body treatment (Body Scrub, Body Mask, Body Wrap), aromaterapi, reflexology, dan paket perawatan khusus.',
              Icons.spa,
            ),
            _buildQnAItem(
              'Berapa lama durasi setiap treatment?',
              'Durasi treatment bervariasi tergantung jenis layanan yang Anda pilih. Umumnya berkisar antara 60-120 menit. Detail durasi dapat dilihat pada halaman deskripsi setiap layanan.',
              Icons.access_time,
            ),
            _buildQnAItem(
              'Apakah bisa memilih terapis?',
              'Ya, Anda dapat memilih terapis favorit Anda saat melakukan pemesanan. Namun, ketersediaan terapis bergantung pada jadwal dan ketersediaan mereka.',
              Icons.person_search,
            ),
            _buildQnAItem(
              'Apakah tersedia paket membership atau loyalitas?',
              'Ya, kami memiliki program membership dan reward points untuk pelanggan setia. Setiap pemesanan akan mendapatkan poin yang dapat ditukar dengan diskon atau treatment gratis.',
              Icons.card_membership,
            ),

            const SizedBox(height: 32),

            // Pemesanan & Pembayaran Section
            _buildSectionTitle('Pemesanan & Pembayaran'),
            const SizedBox(height: 12),
            _buildQnAItem(
              'Bagaimana cara melakukan pemesanan?',
              'Pilih layanan yang Anda inginkan dari menu Home, lihat detail treatment, pilih tanggal dan waktu yang tersedia, kemudian konfirmasi pemesanan Anda. Anda akan menerima notifikasi konfirmasi setelah pemesanan berhasil.',
              Icons.book_online,
            ),
            _buildQnAItem(
              'Berapa lama sebelumnya saya harus melakukan booking?',
              'Kami merekomendasikan untuk melakukan booking minimal 24 jam sebelumnya untuk memastikan ketersediaan jadwal dan terapis pilihan Anda.',
              Icons.calendar_today,
            ),
            _buildQnAItem(
              'Metode pembayaran apa yang diterima?',
              'Kami menerima berbagai metode pembayaran seperti kartu kredit/debit, transfer bank, e-wallet (GoPay, OVO, Dana), dan pembayaran tunai di lokasi.',
              Icons.payment,
            ),
            _buildQnAItem(
              'Apakah bisa membatalkan atau mengubah booking?',
              'Ya, Anda dapat membatalkan atau mengubah jadwal booking maksimal 12 jam sebelum waktu appointment. Pembatalan kurang dari 12 jam akan dikenakan biaya administrasi.',
              Icons.cancel,
            ),
            _buildQnAItem(
              'Bagaimana jika saya terlambat datang?',
              'Jika Anda terlambat, durasi treatment akan disesuaikan dengan waktu yang tersisa. Mohon informasikan kepada kami jika Anda akan terlambat agar kami dapat mengatur ulang jadwal jika memungkinkan.',
              Icons.schedule,
            ),

            const SizedBox(height: 32),

            // Lokasi & Fasilitas Section
            _buildSectionTitle('Lokasi & Fasilitas'),
            const SizedBox(height: 12),
            _buildQnAItem(
              'Di mana lokasi Royal Garden Spa?',
              'Royal Garden Spa berlokasi di Jakarta, Indonesia. Alamat lengkap dan peta lokasi dapat dilihat pada menu Hubungi Kami di aplikasi.',
              Icons.location_on,
            ),
            _buildQnAItem(
              'Apa saja fasilitas yang tersedia?',
              'Kami menyediakan ruang treatment pribadi yang nyaman, shower room, locker, area relaksasi, WiFi gratis, minuman selamat datang, dan produk perawatan premium untuk setiap treatment.',
              Icons.hotel,
            ),
            _buildQnAItem(
              'Apakah ada layanan home service?',
              'Saat ini kami sedang mengembangkan layanan home service. Pantau terus aplikasi untuk informasi terbaru mengenai layanan ini.',
              Icons.home,
            ),

            const SizedBox(height: 32),

            // Kontak & Dukungan Section
            _buildSectionTitle('Kontak & Dukungan'),
            const SizedBox(height: 12),
            _buildQnAItem(
              'Bagaimana cara menghubungi customer service?',
              'Anda dapat menghubungi kami melalui email di info@royalgardenspa.com atau telepon di +62 123 456 7890. Tim customer service kami siap melayani Anda setiap hari dari pukul 09.00 - 21.00 WIB.',
              Icons.support_agent,
            ),
            _buildQnAItem(
              'Bagaimana jika mengalami masalah teknis dengan aplikasi?',
              'Jika Anda mengalami masalah teknis, silakan hubungi tim support kami atau kirim laporan melalui menu Bantuan di aplikasi. Kami akan segera membantu menyelesaikan masalah Anda.',
              Icons.bug_report,
            ),
            _buildQnAItem(
              'Apakah bisa memberikan saran atau masukan?',
              'Tentu! Kami sangat menghargai saran dan masukan dari Anda. Silakan kirim feedback melalui menu Hubungi Kami atau email kami. Masukan Anda sangat berharga untuk meningkatkan kualitas layanan kami.',
              Icons.feedback,
            ),

            const SizedBox(height: 32),

            // Contact Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE0E0E0),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.contact_support_outlined,
                      size: 32,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Masih Ada Pertanyaan?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tim customer service kami siap membantu Anda',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF757575),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to contact or open email/phone
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Hubungi Kami',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1E1E1E),
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  Widget _buildQnAItem(String question, String answer, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: 1,
        ),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          leading: Icon(
            icon,
            color: const Color(0xFF4CAF50),
            size: 24,
          ),
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1E1E1E),
              height: 1.4,
            ),
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          collapsedIconColor: const Color(0xFF757575),
          iconColor: const Color(0xFF4CAF50),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF616161),
                  height: 1.6,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
