import 'package:flutter/material.dart';
import 'payment_page.dart';

class CheckoutPage extends StatelessWidget {
  final String kategori;
  final String kursi;
  final int harga;

  const CheckoutPage({
    super.key,
    required this.kategori,
    required this.kursi,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    int total = harga;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout Tiket"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ringkasan Pesanan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Kategori Tiket:", style: TextStyle(fontSize: 16)),
                Text(
                  kategori,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Kursi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nomor Kursi:", style: TextStyle(fontSize: 16)),
                Text(
                  kursi,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Harga Tiket:", style: TextStyle(fontSize: 16)),
                Text(
                  "Rp $harga",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),

            // TOTAL
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Pembayaran:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp $total",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const Spacer(),

            // Tombol Bayar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),

                // ✅ onPressed sekarang benar & bersih
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        ticketType: kategori,
                        selectedSeat: kursi,
                        totalPrice: harga,
                      ),
                    ),
                  );
                },

                child: const Text(
                  "Bayar Sekarang",
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
