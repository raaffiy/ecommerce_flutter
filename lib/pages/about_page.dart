import 'package:ecommerce/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  // Error Logout, ketika home page atau about page di pilih
  // maka akan terjadi error yaitu tidak bisa logout
  late User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  // Sign User Out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  // UI Ecommerce
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navbar Up
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),

      // Content Navbar Up
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Logo
                DrawerHeader(
                  child: Image.asset('assets/icon.png'),
                ),

                // Home pages
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Navigasi ke home_page.dart
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                  ),
                ),

                // About Page
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Navigasi ke about_page.dart
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPage()),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Logout Page
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: signUserOut,
              ),
            ),
          ],
        ),
      ),

      // Page
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Created By',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),

            SizedBox(height: 5),

            // Sub Title
            Text(
              'Maulana Ra\'afi',
              style: TextStyle(
                fontSize: 23,
                color: Color.fromARGB(255, 87, 87, 87),
              ),
              textAlign: TextAlign.center,
            ),

            // Sub Title
            Text(
              'XI RPL U',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
