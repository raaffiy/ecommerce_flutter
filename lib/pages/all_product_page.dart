import 'package:ecommerce/components/all_product_tile.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  // list kelas
  List<String> filterKelas = <String>['X', 'XI', 'XII'];
  String dropdownKelas = '';

  // list jurusan
  List<String> filterJurusan = <String>['TKJ', 'TEI', 'RPL', 'TET', 'AK', 'TO'];
  String dropdownJurusan = '';

  @override
  void initState() {
    super.initState();
    dropdownKelas = filterKelas.first;
    dropdownJurusan = filterJurusan.first;
  }

  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully Added!'),
        content: Text('Check Your Cart'),
      ),
    );
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Search Bar
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(
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
                              });
                            },
                            items: filterKelas
                                .map<DropdownMenuItem<String>>((String value) {
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
                              });
                            },
                            items: filterJurusan
                                .map<DropdownMenuItem<String>>((String value) {
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
                      itemCount: value.getShoeList().length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        // get a shoe from shop list
                        Shoe shoe = value.getShoeList()[index];

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
    );
  }
}
