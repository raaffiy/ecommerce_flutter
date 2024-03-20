import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class AllTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  AllTile({
    super.key,
    required this.shoe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 280,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shoe Name
                      Text(
                        shoe.nameUser,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Row(
                          children: [
                            Text(
                              shoe.kelasUser,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              ' - ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              shoe.jurusanUser,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const Text(
                              ' - ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              shoe.options,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Shoe Picture
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                shoe.image, // Menggunakan Image.network untuk URL gambar eksternal
                height: 220,
              ),
            ),

            // description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                shoe.descriptionProduct,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

            const SizedBox(height: 10),

            // price + details
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shoe Name
                      Text(
                        shoe.nameProduct,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        'Rp ' + shoe.priceProduct,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  // Plus Button
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
