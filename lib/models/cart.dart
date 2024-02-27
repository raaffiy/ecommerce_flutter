import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Product 1',
      price: '226',
      username: 'rafy',
      number: '085714713706',
      description: 'Description 1',
      imagePath: 'lib/images/product.png',
    ),
    Shoe(
      name: 'Product 2',
      price: '236',
      username: 'Udil',
      number: '0861',
      description: 'Description 2',
      imagePath: 'lib/images/product2.png',
    ),
    Shoe(
      name: 'Product 3',
      price: '220',
      username: 'arman',
      number: '0812',
      description: 'Description 3',
      imagePath: 'lib/images/product3.png',
    ),
    Shoe(
      name: 'Product 4',
      price: '267',
      username: 'yanto',
      number: '0812',
      description: 'Description 4',
      imagePath: 'lib/images/product4.png',
    ),
    Shoe(
      name: 'Product 5',
      price: '250',
      username: 'yanti',
      number: '0861',
      description: 'Description 5',
      imagePath: 'lib/images/product5.png',
    ),
    Shoe(
      name: 'Product 6',
      price: '230',
      username: 'syahrul',
      number: '0863',
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
}
