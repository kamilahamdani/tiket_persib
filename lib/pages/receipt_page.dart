import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  final String ticketType;
  final String seat;
  final int price;
  final String bank;

  const ReceiptPage({
    super.key,
    required this.ticketType,
    required this.seat,
    required this.price,
    required this.bank,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bukti Transaksi"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transaksi Berhasil!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            _row("Jenis Tiket", ticketType),
            _row("Nomor Kursi", seat),
            _row("Metode Pembayaran", bank),
            _row("Total Bayar", "Rp $price"),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 30)),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Kembali ke Home",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
