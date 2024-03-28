import 'package:ecommerce/pages/transaksi_item.dart';
import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({Key? key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          const Text(
            'Transaction',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),

          const SizedBox(height: 20),

          // Product
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                // Return The TransaksiItem
                return const TransaksiItem(); // Gunakan TransaksiItem sebagai item dalam list
              },
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.only(
              top: 25.0,
              left: 25,
              right: 25,
            ),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
