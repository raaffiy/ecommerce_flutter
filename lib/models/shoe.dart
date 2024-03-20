class Shoe {
  final String id;
  final String image;
  final String nameProduct;
  final String priceProduct;
  final String descriptionProduct;
  final String nameUser;
  final String kelasUser;
  final String jurusanUser;
  final String options;

  Shoe({
    required this.id,
    required this.image,
    required this.nameProduct,
    required this.priceProduct,
    required this.descriptionProduct,
    required this.nameUser,
    required this.kelasUser,
    required this.jurusanUser,
    required this.options,
  });

  Shoe.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          image: json['image']! as String,
          nameProduct: json['nameProduct']! as String,
          priceProduct: json['priceProduct']! as String,
          descriptionProduct: json['descriptionProduct']! as String,
          nameUser: json['nameUser']! as String,
          kelasUser: json['kelasUser']! as String,
          jurusanUser: json['jurusanUser']! as String,
          options: json['options']! as String,
        );

  Shoe copyWith({
    String? id,
    String? image,
    String? nameProduct,
    String? priceProduct,
    String? descriptionProduct,
    String? nameUser,
    String? kelasUser,
    String? jurusanUser,
    String? options,
  }) {
    return Shoe(
      id: id ?? this.id,
      image: image ?? this.image,
      nameProduct: nameProduct ?? this.nameProduct,
      priceProduct: priceProduct ?? this.priceProduct,
      descriptionProduct: descriptionProduct ?? this.descriptionProduct,
      nameUser: nameUser ?? this.nameUser,
      kelasUser: kelasUser ?? this.kelasUser,
      jurusanUser: jurusanUser ?? this.jurusanUser,
      options: options ?? this.options,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'image': image,
      'nameProduct': nameProduct,
      'priceProduct': priceProduct,
      'descriptionProduct': descriptionProduct,
      'nameUser': nameUser,
      'kelasUser': kelasUser,
      'jurusanUser': jurusanUser,
      'options': options,
    };
  }
}
