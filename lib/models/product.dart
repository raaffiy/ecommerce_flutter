import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/shoe.dart';

const String SHOE_COLLECTION_REF = "products";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _shoeRef;

  DatabaseService() {
    _shoeRef = _firestore.collection(SHOE_COLLECTION_REF).withConverter<Shoe>(
        fromFirestore: (snapshots, _) => Shoe.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (shoe, _) => shoe.toJson());
  }
  Stream<QuerySnapshot> getShoes() {
    return _shoeRef.snapshots();
  }

  void addShoe(Shoe shoe) async {
    _shoeRef.add(shoe);
  }
}
