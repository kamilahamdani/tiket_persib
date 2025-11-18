import 'package:flutter/material.dart';
import 'checkout_page.dart';

class SeatSelectionPage extends StatefulWidget {
  final String kategori;
  final int harga;

  const SeatSelectionPage({
    super.key,
    required this.kategori,
    required this.harga,
  });

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  // Baris kursi A-F
  final List<String> rows = ["A", "B", "C", "D", "E", "F"];
  final int seatsPerRow = 8;

  // Kursi yang dipilih
  String? selectedSeat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Kursi (${widget.kategori})"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Silahkan pilih tempat duduk Anda",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // === GRID TEMPAT DUDUK ===
            Expanded(
              child: GridView.builder(
                itemCount: rows.length * seatsPerRow,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8, // 8 kursi per baris
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  String row = rows[index ~/ seatsPerRow];  
                  int seatNum = (index % seatsPerRow) + 1;
                  String seatId = "$row$seatNum";

                  bool aktif = selectedSeat == seatId;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSeat = seatId;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: aktif ? Colors.green : Colors.blue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        seatId,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // === TOMBOL LANJUTKAN ===
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedSeat == null ? Colors.grey : Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),

                // === ARAHKAN KE CHECKOUT ===
                onPressed: selectedSeat == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                              kategori: widget.kategori,
                              harga: widget.harga,
                              kursi: selectedSeat!,   // kirim kursi terpilih
                            ),
                          ),
                        );
                    },

                child: const Text(
                  "Lanjutkan",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
