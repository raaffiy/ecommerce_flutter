import 'package:flutter/material.dart';

class TransaksiItem extends StatelessWidget {
  const TransaksiItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data Untuk Menampilkan Product
    return CustomListItem(
      image: Image.asset('lib/images/product2.png', height: 68),
      nameProduct: 'Testing Transaction',
      priceProduct: 20,
      quantityProduct: 2,
      totalProduct: 40,
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.image,
    required this.nameProduct,
    required this.priceProduct,
    required this.quantityProduct,
    required this.totalProduct,
  }) : super(key: key);

  // Tipe data
  final Widget image;
  final String nameProduct;
  final double priceProduct;
  final int quantityProduct;
  final double totalProduct;

  // menampilkan product
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: image,
              ),
              Expanded(
                flex: 3,
                child: _VideoDescription(
                  nameProduct: nameProduct,
                  priceProduct: priceProduct,
                  quantityProduct: quantityProduct,
                  totalProduct: totalProduct,
                ),
              ),
              // Icon dan teks "Waiting"
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.pending,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Waiting',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 2),

          // Tombol Show Transaction dan Cancel Transaction
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 104, 143, 106),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Show Transaction',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  // Menampilkan dialog ketika tombol "Cancel Transaction" ditekan
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Cancellation"),
                        content: const Text(
                            "Are you sure you want to cancel this product transaction?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              // Lakukan aksi pembatalan di sini
                              // Misalnya, kirim permintaan pembatalan transaksi ke backend
                              Navigator.of(context).pop();
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 167, 73, 73),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Cancel Transaction',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

// membuat desain product
class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    required this.nameProduct,
    required this.priceProduct,
    required this.quantityProduct,
    required this.totalProduct,
  });

  // Tipe data
  final String nameProduct;
  final double priceProduct;
  final int quantityProduct;
  final double totalProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 10.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Name Product
          SingleChildScrollView(
            // Menggunakan SingleChildScrollView untuk membuat teks bisa digulir secara horizontal
            scrollDirection: Axis.horizontal,
            child: Text(
              nameProduct,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),

          // Price Product
          Text(
            'Rp ${priceProduct.toStringAsFixed(3)}' +
                '  ×  ' +
                quantityProduct.toString(),
            style: const TextStyle(fontSize: 11),
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),

          Text(
            'Total: Rp ${totalProduct.toStringAsFixed(3)}',
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
        ],
      ),
    );
  }
}
