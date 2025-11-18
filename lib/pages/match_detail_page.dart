import 'package:flutter/material.dart';

class MatchDetailPage extends StatelessWidget {
  final String matchTitle;
  final String date;
  final String location;
  final String banner;

  const MatchDetailPage({
    super.key,
    required this.matchTitle,
    required this.date,
    required this.location,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Detail Pertandingan",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            SizedBox(
              width: double.infinity,
              height: 220,
              child: Image.asset(
                banner,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Title Match
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                matchTitle,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(date, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 6),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.location_on, size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(location, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Deskripsi Pertandingan
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Deskripsi Pertandingan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Pertandingan seru antara PERSIB melawan tim lawan."
                " Dukung tim kebanggaanmu langsung dari stadion!",
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Pesan Tiket
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Pilih Tribun",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
