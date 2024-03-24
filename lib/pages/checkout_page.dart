import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/pages/success_buy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  // list lokasi
  List<String> listLokasi = <String>['TKJ', 'TEI', 'RPL', 'TET', 'AK', 'TO'];
  String dropdownLokasi = '';

  // list hari
  List<String> listHari = <String>[
    'SENIN',
    'SELASA',
    'RABU',
    'KAMIS',
    'JUMAT',
    'SABTU'
  ];
  String dropdownHari = '';

  // list time
  List<String> listTime = <String>[
    '09.00 AM',
    '12.00',
    '15.00 PM',
  ];
  String dropdownTime = '';

  @override
  void initState() {
    super.initState();
    // Inisialisasi firestore
    firestore = FirebaseFirestore.instance;
    // Inisialisasi transaction
    transaction = firestore.collection('transaction');
    dropdownLokasi = listLokasi.first;
    dropdownHari = listHari.first;
    dropdownTime = listTime.first;
  }

  late FirebaseFirestore firestore; // Ubah menjadi late
  late CollectionReference transaction; // Ubah menjadi late

  void OnTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SuccessBuy(),
      ),
    );
  }

  // jika semua data sudah di masukkan maka akan menampilkan show dialog di bawah ini
  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are You Sure?'),
          content: const Text('Do not enter wrong data'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Handle the action when the user clicks "Yes"
                transaction.add({
                  'nameUser': _nameController.text,
                  'hariPengambilan': dropdownHari,
                  'lokasiPengambilan': dropdownLokasi,
                  'jamPengambilan': dropdownTime,
                  'note': _noteController.text,
                }).then((value) {
                  // Clear the text fields after successful submission
                  _nameController.clear();
                  _noteController.clear();
                  // Close the dialog
                  Navigator.of(context).pop();
                  // Call the function to complete the purchase
                  _completePurchase();
                }).catchError((error) {
                  // Handle error if any
                  print("Failed to add transaction: $error");
                  // Optionally, show an error message to the user
                });
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _completePurchase() {
    // clear cart
    Provider.of<Cart>(context, listen: false).clearCart();

    // Navigate to the success page or perform any other actions
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SuccessBuy(),
      ),
    );
  }

  void _onTap() {
    // Check if the name and note fields are empty
    if (_nameController.text.isEmpty) {
      _showDataNotEnteredDialog();
    } else {
      _showConfirmationDialog();
    }
  }

  Future<void> _showDataNotEnteredDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Incomplete Data'),
          content: const Text('Some data has not been entered.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Checkout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color.fromARGB(255, 58, 57, 57),
                  ),
                ),

                const Text(
                  '!! Transaksi Dilakukan Di Tempat !!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 199, 3, 3),
                  ),
                ),

                const SizedBox(height: 20),

                // name
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text(
                        'Name : ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 107, 106, 106),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // name textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Hari
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text(
                        'Hari Pengambilan Barang.. : ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 107, 106, 106),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // List Hari
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
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
                    value: dropdownHari,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownHari = value!;
                      });
                    },
                    items:
                        listHari.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 15),

                // lokasi
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text(
                        'Lokasi Pengambilan Barang.. : ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 107, 106, 106),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // List Lokasi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
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
                    value: dropdownLokasi,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownLokasi = value!;
                      });
                    },
                    items: listLokasi
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 15),

                // Information
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text(
                        'Jam Pengambilan Barang : ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 107, 106, 106),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // List Lokasi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
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
                    value: dropdownTime,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownTime = value!;
                      });
                    },
                    items:
                        listTime.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 15),

                // note
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text(
                        'Note : ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 107, 106, 106),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // Note textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Note',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // total
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Total Payment',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      // Calculate total payment based on all items in the cart
                      Consumer<Cart>(
                        builder: (context, cart, child) {
                          return Text(
                            'Rp ${cart.calculateTotalPayment().toStringAsFixed(3)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 17),

                // Button Buy Product
                GestureDetector(
                  onTap: _onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 104, 143, 106),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Buy Product',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
