import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'receipt_page.dart';   

class PaymentPage extends StatefulWidget {
  final String ticketType;
  final String selectedSeat;
  final int totalPrice;

  const PaymentPage({
    super.key,
    required this.ticketType,
    required this.selectedSeat,
    required this.totalPrice,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedBank;

  final List<Map<String, String>> bankList = [
    {"name": "BCA", "account": "1234567890"},
    {"name": "BRI", "account": "9876543210"},
    {"name": "BNI", "account": "6543210987"},
    {"name": "MANDIRI", "account": "3456789012"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Pembayaran"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====================== DETAIL PEMBELIAN =====================
            const Text(
              "Detail Pembelian",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildDetailRow("Kategori Tiket", widget.ticketType),
            _buildDetailRow("Nomor Kursi", widget.selectedSeat),
            _buildDetailRow("Total Harga", "Rp ${widget.totalPrice}"),

            const SizedBox(height: 30),

            // ==================== PEMILIHAN BANK ========================
            const Text(
              "Pilih Metode Pembayaran",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: bankList.length,
                itemBuilder: (context, index) {
                  final bank = bankList[index];

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: selectedBank == bank["name"]
                        ? Colors.blue.shade100
                        : Colors.white,
                    child: ListTile(
                      leading: Radio<String>(
                        value: bank["name"]!,
                        groupValue: selectedBank,
                        onChanged: (value) {
                          setState(() {
                            selectedBank = value!;
                          });
                        },
                      ),
                      title: Text(
                        bank["name"]!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("No. Rekening: ${bank["account"]}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: bank["account"]!)
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "No. rekening ${bank["name"]} disalin!",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // ===================== TOMBOL KONFIRMASI ======================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  if (selectedBank == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Silakan pilih metode pembayaran!"),
                      ),
                    );
                    return;
                  }

                  // Navigasi ke Bukti Transaksi
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReceiptPage(
                        ticketType: widget.ticketType,
                        seat: widget.selectedSeat,
                        price: widget.totalPrice,
                        bank: selectedBank!,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Konfirmasi Pembayaran",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // =============== WIDGET BARIS DETAIL ===============
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
