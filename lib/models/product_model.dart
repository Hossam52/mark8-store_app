import 'dart:math';

class ProductModel {
  final String imagePath;
  final String name;
  final double price;
  final int quantitiy;
  final double weight;
  final bool isPrepared;

  ProductModel({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.quantitiy,
    required this.weight,
    required this.isPrepared,
  });
}

final List<ProductModel> allProducts = List.generate(
  3,
  (index) => ProductModel(
      imagePath: 'asset/images/burger.png',
      name: 'Burger double',
      price: Random.secure().nextInt(150).toDouble(),
      quantitiy: Random.secure().nextInt(10),
      weight: Random.secure().nextInt(100).toDouble(),
      isPrepared: Random.secure().nextBool()),
);
