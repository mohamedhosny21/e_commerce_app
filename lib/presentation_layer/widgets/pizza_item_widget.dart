import 'package:flutter/material.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/widgets/favorite_icon_container.dart';

class PizzaWidget extends StatelessWidget {
  final PizzaModel pizzaModel;

  const PizzaWidget({
    super.key,
    required this.pizzaModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/pizza_order_screen',
                arguments: pizzaModel);
          },
          child: Card(
            margin: const EdgeInsetsDirectional.all(10),
            elevation: 0.0,
            child: Container(
              padding: const EdgeInsetsDirectional.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pizzaModel.image!.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          placeholder: loadingGif,
                          image: '${pizzaModel.image}',
                          width: 120,
                          height: 120,
                          fit: BoxFit.fill,
                        )
                      : Container(),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pizzaModel.pizzaName.toString(),
                          style: const TextStyle(
                              color: MyColors.myNavyBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          pizzaModel.menuDescription.toString(),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '\$ ${pizzaModel.price?.toStringAsFixed(2)}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      FavoriteIcon(
                          width: 50,
                          height: 50,
                          size: 30,
                          pizzaModel: pizzaModel)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showSnackBar(BuildContext context, String snackBarText,
      IconData snackBarIcon, Color snackBarColor) {
    //i used hide as the snackbar was shown multiple times
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: snackBarColor,
      content: ListTile(
        leading: Icon(
          snackBarIcon,
          color: Colors.black,
        ),
        title: Text(
          snackBarText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
