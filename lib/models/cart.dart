import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      id: '1',
      username: 'rafy',
      kelas: 'XI',
      jurusan: 'TKJ',
      name: 'Product 1',
      options: '1',
      price: '12.000',
      description: 'Description 1',
      imagePath: 'lib/images/product.png',
    ),
    Shoe(
      id: '2',
      username: 'Udil',
      kelas: 'X',
      jurusan: 'TEI',
      name: 'Product 2',
      options: '2',
      price: '25.000',
      description: 'Description 2',
      imagePath: 'lib/images/product2.png',
    ),
    Shoe(
      id: '3',
      username: 'arman',
      kelas: 'XII',
      jurusan: 'AK',
      name: 'Product 3',
      options: '1',
      price: '21.000',
      description: 'Description 3',
      imagePath: 'lib/images/product3.png',
    ),
    Shoe(
      id: '4',
      username: 'yanto',
      kelas: 'XI',
      jurusan: 'RPL',
      name: 'Product 4',
      options: '3',
      price: '18.000',
      description: 'Description 4',
      imagePath: 'lib/images/product4.png',
    ),
    Shoe(
      id: '5',
      username: 'yanti',
      kelas: 'X',
      jurusan: 'TO',
      name: 'Product 5',
      options: 'K.I',
      price: '13.000',
      description: 'Description 5',
      imagePath: 'lib/images/product5.png',
    ),
    Shoe(
      id: '6',
      username: 'syahrul',
      kelas: 'X',
      jurusan: 'TET',
      name: 'Product 6',
      options: '2',
      price: '10.000',
      description: 'Description 6',
      imagePath: 'lib/images/product6.png',
    ),
  ];
  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoe for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

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
}
