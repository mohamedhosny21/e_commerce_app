class PizzaModel {
  int? id;
  String? pizzaName;
  num? originalPrice;
  num? price;
  String? menuDescription;
  String? image;
  String? category;
  int? pizzaQuantity;
  String? pizzaSize;
  int? pizzaSizeIndex;
  PizzaModel(
      {this.id,
      this.pizzaName,
      this.originalPrice,
      this.price,
      this.menuDescription,
      this.image,
      this.category,
      this.pizzaQuantity,
      this.pizzaSize,
      this.pizzaSizeIndex});

  PizzaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pizzaName = json['name'];
    price = json['price'];
    menuDescription = json['menu_description'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = pizzaName;
    data['price'] = price;
    data['menu_description'] = menuDescription;
    data['image'] = image;
    data['category'] = category;
    return data;
  }
}
