import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:ecommerce/pages/all_product_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final user = FirebaseAuth.instance.currentUser!;
  late List<Shoe> filteredShoes = [];

  @override
  void initState() {
    super.initState();
    loadShoeList();
  }

  Future<void> loadShoeList() async {
    // Mendapatkan daftar sepatu dari Cart
    List<Shoe> shoeList =
        await Provider.of<Cart>(context, listen: false).getShoeList();
    setState(() {
      filteredShoes = shoeList;
    });
  }

  // Search function
  Future<void> searchShoes(String query) async {
    // Load the full shoe list
    List<Shoe> shoeList =
        await Provider.of<Cart>(context, listen: false).getShoeList();

    // Apply the search query to the full shoe list
    setState(() {
      filteredShoes = shoeList.where((shoe) {
        return shoe.nameProduct.toLowerCase().contains(query.toLowerCase()) ||
            shoe.nameUser.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    var cart = Provider.of<Cart>(context, listen: false);

    // Check if the shoe is already in the cart based on ID
    if (cart.isShoeIdInCart(shoe.id)) {
      // Show dialog if the product is already in the basket
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Product Already in Cart'),
          content: const Text('The product is already in the basket.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Add the shoe to the cart
      cart.addItemToCart(shoe);

      // Alert the user, shoe successfully added
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Successfully Added!'),
          content: Text('Check Your Cart'),
        ),
      );
    }
  }

  Future<void> _refresh() async {
    // Refresh shoe list
    await loadShoeList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: searchShoes,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

              // Message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'Welcome ' + user.email!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              // Hot Picks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Hot Picks 🔥',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllProducts(),
                          ),
                        );
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // List of shoe for sale
              Container(
                height: 408, // Adjust the height according to your requirement
                child: ListView.builder(
                  itemCount: filteredShoes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // get a shoe from filtered shoe list
                    Shoe shoe = filteredShoes[index];

                    // Return The Shoe
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(
                  top: 25.0,
                  left: 50,
                  right: 50,
                ),
                child: Divider(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
