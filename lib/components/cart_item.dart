import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1; // Tambahkan variabel quantity

  // Mengurangi jumlah item dalam keranjang
  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  // Menambah jumlah item dalam keranjang
  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  // remove item from cart
  void removeItemCart() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Hapus item dari keranjang
                Provider.of<Cart>(context, listen: false)
                    .removeItemFromCart(widget.shoe);
                Navigator.pop(context);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath, width: 50),

        // product name
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(widget.shoe.name),
        ),

        // harga product
        subtitle: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text('Rp ' + widget.shoe.price),
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tombol kurangi jumlah
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: decreaseQuantity,
            ),
            // Text menampilkan jumlah
            Text(
              '$quantity',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // Tombol tambah jumlah
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: increaseQuantity,
            ),
            // Tombol hapus item
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: removeItemCart,
              iconSize: 25,
            ),
          ],
        ),
      ),
    );
  }
}
