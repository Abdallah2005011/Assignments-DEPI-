class ProductItemModel {
  final String name;
  final String image;
  final String description;
  final double price;

  ProductItemModel(this.name, this.image, this.price, this.description);

  static List<ProductItemModel> productsList = [
    ProductItemModel('Burger Combo', 'assets/burger_offer.png', 15.0, 'Delicious burger & fries'),
    ProductItemModel('Pizza', 'assets/pizza.png', 12.0, 'Freshly baked pizza'),
    ProductItemModel('Pasta', 'assets/pasta.png', 10.0, 'Italian style pasta'),
    ProductItemModel('Salad', 'assets/salad.png', 8.0, 'Healthy green salad'),
  ];
}