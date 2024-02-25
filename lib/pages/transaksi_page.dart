import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Text(
            'Transaction',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),

          SizedBox(height: 542),

          Padding(
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
