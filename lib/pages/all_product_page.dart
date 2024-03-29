import 'package:ecommerce/components/all_product_tile.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  void initState() {
    super.initState();
    dropdownKelas = filterKelas.first;
    dropdownJurusan = filterJurusan.first;
    loadShoeList();
    updateFilteredShoes();
  }

  // list kelas
  List<String> filterKelas = <String>['X', 'XI', 'XII'];
  String dropdownKelas = '';

  // list jurusan
  List<String> filterJurusan = <String>['TKJ', 'TEI', 'RPL', 'TET', 'AK', 'TO'];
  String dropdownJurusan = '';

  // Mendapatkan daftar sepatu dari Cart
  Future<void> loadShoeList() async {
    // Mendapatkan daftar sepatu dari Cart
    List<Shoe> shoeList =
        await Provider.of<Cart>(context, listen: false).getShoeList();
    setState(() {
      filteredShoes = shoeList;
    });
  }

  // Filter dropdownKelas & dropdownJurusan
  void updateFilteredShoes() async {
    // Load the full shoe list
    List<Shoe> shoeList =
        await Provider.of<Cart>(context, listen: false).getShoeList();

    setState(() {
      filteredShoes = shoeList.where((shoe) {
        bool isKelasMatch =
            dropdownKelas.isEmpty || shoe.kelasUser == dropdownKelas;
        bool isJurusanMatch =
            dropdownJurusan.isEmpty || shoe.jurusanUser == dropdownJurusan;

        return isKelasMatch && isJurusanMatch;
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

  late List<Shoe> filteredShoes = [];

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

  Future<void> _refresh() async {
    // Refresh shoe list
    await loadShoeList();
    setState(() {
      // Update filtered shoes after refreshing
      updateFilteredShoes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[500],
          elevation: 0,
          title: const Align(
            alignment: Alignment.topRight,
            child: Text(
              'All Products',
              style: TextStyle(
                color: Color.fromARGB(255, 90, 81, 81),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(), // Add this line
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // Search Bar
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      height: 55,
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

                    const SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Dropdown kelas
                          Expanded(
                            // Menambahkan Expanded untuk mendukung CrossAxisAlignment.start
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                              ),
                              value: dropdownKelas,
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownKelas = value!;
                                  updateFilteredShoes();
                                });
                              },
                              items: filterKelas.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),

                          const SizedBox(width: 15),

                          // Dropdown jurusan
                          Expanded(
                            // Menambahkan Expanded untuk mendukung CrossAxisAlignment.start
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                              ),
                              value: dropdownJurusan,
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownJurusan = value!;
                                  updateFilteredShoes();
                                });
                              },
                              items: filterJurusan
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    // List of shoe for sale
                    SizedBox(
                      height: 550, // Set a fixed height for the container
                      child: ListView.builder(
                        itemCount: filteredShoes.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          // get a shoe from shop list
                          Shoe shoe = filteredShoes[index];

                          // Return The Shoe
                          return AllTile(
                            shoe: shoe,
                            onTap: () => addShoeToCart(shoe),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
