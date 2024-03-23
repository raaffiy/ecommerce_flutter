import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of items in user cart
  List<Shoe> userCart = [];

  bool isShoeInCart(Shoe shoe) {
    return userCart.contains(shoe);
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  // clear product in cart
  void clearCart() {
    userCart.clear();
    notifyListeners();
  }

  // Fetch shoe list from Firestore
  static Future<List<Shoe>> fetchShoeList() async {
    List<Shoe> shoes = [];
    try {
      await Firebase.initializeApp();
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      snapshot.docs.forEach((doc) {
        shoes.add(Shoe(
          id: doc.id, // Menggunakan id dari dokumen Firestore sebagai id produk
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

  // Method to get shoe list
  Future<List<Shoe>> getShoeList() async {
    return fetchShoeList();
  }
}
