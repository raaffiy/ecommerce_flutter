import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      id: '1',
      image: 'lib/images/product.png',
      nameProduct: 'Product 1',
      priceProduct: '12.000',
      descriptionProduct: 'descriptionProduct 1',
      nameUser: 'rafy',
      kelas: 'XI',
      jurusan: 'TKJ',
      options: '1',
    ),
    Shoe(
      id: '2',
      image: 'lib/images/product2.png',
      nameProduct: 'Product 2',
      priceProduct: '25.000',
      descriptionProduct: 'descriptionProduct 2',
      nameUser: 'Udil',
      kelas: 'X',
      jurusan: 'TEI',
      options: '2',
    ),
    Shoe(
      id: '3',
      image: 'lib/images/product3.png',
      nameProduct: 'Product 3',
      priceProduct: '21.000',
      descriptionProduct: 'descriptionProduct 3',
      nameUser: 'arman',
      kelas: 'XII',
      jurusan: 'AK',
      options: '1',
    ),
    Shoe(
      id: '4',
      image: 'lib/images/product4.png',
      nameProduct: 'Product 4',
      priceProduct: '18.000',
      descriptionProduct: 'descriptionProduct 4',
      nameUser: 'yanto',
      kelas: 'XI',
      jurusan: 'RPL',
      options: '3',
    ),
    Shoe(
      id: '5',
      image: 'lib/images/product5.png',
      nameProduct: 'Product 5',
      priceProduct: '13.000',
      descriptionProduct: 'descriptionProduct 5',
      nameUser: 'yanti',
      kelas: 'X',
      jurusan: 'TO',
      options: 'K.I',
    ),
    Shoe(
      id: '6',
      image: 'lib/images/product6.png',
      nameProduct: 'Product 6',
      priceProduct: '10.000',
      descriptionProduct: 'descriptionProduct 6',
      nameUser: 'syahrul',
      kelas: 'X',
      jurusan: 'TET',
      options: '2',
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
