// ignore_for_file: public_member_api_docs, sort_constructors_first
class PizzaModel {
  final int id;
  final String pizzaName;
  final num originalPrice;
  PizzaPrice? price;
  final String menuDescription;
  final String image;
  final String? category;
  PizzaQuantity? pizzaQuantity;

  String? pizzaSize;
  int? pizzaSizeIndex;
  PizzaModel(
      {required this.id,
      required this.pizzaName,
      required this.originalPrice,
      this.price,
      required this.menuDescription,
      required this.image,
      this.category,
      this.pizzaQuantity,
      this.pizzaSize,
      this.pizzaSizeIndex});

  factory PizzaModel.fromJson(Map<String, dynamic> json) {
    return PizzaModel(
        id: json['id'],
        pizzaName: json['name'],
        menuDescription: json['menu_description'],
        originalPrice: json['price'],
        image: json['image'],
        category: json['category']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = pizzaName;
    data['price'] = originalPrice;
    data['menu_description'] = menuDescription;
    data['image'] = image;
    data['category'] = category;
    return data;
  }
}

class PizzaQuantity {
  int smallPizzaQuantity;
  int mediumPizzaQuantity;

  int largePizzaQuantity;
  PizzaQuantity({
    this.smallPizzaQuantity = 1,
    this.mediumPizzaQuantity = 1,
    this.largePizzaQuantity = 1,
  });
}

class PizzaPrice {
  num smallPizzaPrice;
  num mediumPizzaPrice;
  num largePizzaPrice;
  PizzaPrice({
    this.smallPizzaPrice = 0,
    this.mediumPizzaPrice = 0,
    this.largePizzaPrice = 0,
  });
}
