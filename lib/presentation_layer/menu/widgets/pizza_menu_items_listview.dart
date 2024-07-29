import 'package:flutter/material.dart';

import '../../../data_layer/models/pizza_model.dart';
import 'pizza_item_widget.dart';

class PizzaMenuItemsListview extends StatelessWidget {
  final List<PizzaModel> allPizza;
  final List<PizzaModel> searchedPizza;
  final TextEditingController searchController;
  const PizzaMenuItemsListview(
      {super.key,
      required this.allPizza,
      required this.searchedPizza,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return PizzaWidget(
            pizzaModel: searchController.text.isEmpty
                ? allPizza[index]
                : searchedPizza[index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox();
        },
        itemCount: searchController.text.isEmpty
            ? allPizza.length
            : searchedPizza.length);
  }
}
