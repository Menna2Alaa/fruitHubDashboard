import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String description;
  final num price;
  final File image;
  final String? imageUrl;
  final bool iFeatured;

  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.imageUrl,
    required this.iFeatured,
  });
}
