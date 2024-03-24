import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Shoe> userCart = [];

  bool isShoeInCart(Shoe shoe) {
    return userCart.contains(shoe);
  }

  // pengecekan apakah product sudah ada di cart? by id
  bool isShoeIdInCart(String shoeId) {
    return userCart.any((shoe) => shoe.id == shoeId);
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners(); // Notify listeners when an item is added to the cart
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners(); // Notify listeners when an item is removed from the cart
  }

  // syntak untuk clear product ketika sudah di checkout
  void clearCart() {
    userCart.clear();
    notifyListeners();
  }

  // syntax untuk memanggil product yang ada pada firebase
  static Future<List<Shoe>> fetchShoeList() async {
    List<Shoe> shoes = [];
    try {
      await Firebase.initializeApp();
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      snapshot.docs.forEach((doc) {
        shoes.add(Shoe(
          id: doc.id,
          image: doc['image'],
          nameProduct: doc['nameProduct'],
          priceProduct: doc['priceProduct'],
          descriptionProduct: doc['descriptionProduct'],
          nameUser: doc['nameUser'],
          kelasUser: doc['kelasUser'],
          jurusanUser: doc['jurusanUser'],
          options: doc['options'],
        ));
      });
    } catch (e) {
      print('Error fetching shoe list: $e');
    }
    return shoes;
  }

  Future<List<Shoe>> getShoeList() async {
    return fetchShoeList();
  }

  int getTotalQuantity() {
    int totalQuantity = 0;
    userCart.forEach((shoe) {
      totalQuantity += getItemQuantity(shoe);
    });
    return totalQuantity;
  }

  int getItemQuantity(Shoe shoe) {
    int quantity = 0;
    for (Shoe item in userCart) {
      if (item.id == shoe.id) {
        quantity++;
      }
    }
    return quantity;
  }

  // Metode untuk menghitung total pembayaran
  double calculateTotalPayment() {
    double totalPayment = 0;

    // Iterate through each item in the cart
    for (Shoe shoe in userCart) {
      // Calculate total price for each item considering its quantity
      totalPayment += double.parse(shoe.priceProduct) * getItemQuantity(shoe);
    }

    // Panggil notifyListeners() untuk memberitahu listener bahwa ada perubahan
    notifyListeners();

    return totalPayment;
  }
}
