import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0054A6), // Biru Persib
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo_persib.PNG',
              height: 32,
            ),
            const SizedBox(width: 30),
            const Text(
              'PERSIB APP',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: const [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.qr_code_scanner, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/banner_match.PNG',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Menu 4 ikon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildMenu('Ticket', Icons.event, Colors.blue),
                  buildMenu('Member', Icons.verified_user, Colors.green),
                  buildMenu('Store', Icons.shopping_bag, Colors.orange),
                  buildMenu('Fans', Icons.group, Colors.pink),
                ],
              ),
              const SizedBox(height: 25),

              // Upcoming Match
              const Text(
                'Upcoming Match',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/persib.PNG', height: 50),
                        const Text(
                          'PERSIB VS PERSIJA',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset('assets/images/persija.PNG', height: 50),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Sabtu, 20 Des 2025 — 19.30 WIB',
                      style: TextStyle(color: Colors.black87),
                    ),
                    const Text(
                      'Stadion Utama UTB',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0054A6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Text(
                          'BUY TICKET',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Latest News',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              buildNewsItem(),
              buildNewsItem(),
              buildNewsItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenu(String title, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500))
      ],
    );
  }

  Widget buildNewsItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Berita Terbaru Tentang Persib vs Persija Hari Ini...',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
