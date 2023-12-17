import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/widgets/favorite_icon_container.dart';
import 'package:home_slice/presentation_layer/widgets/lower_button_widget.dart';
import 'package:home_slice/presentation_layer/widgets/pizza_order_widgets.dart';
import '../../business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import '../../constants/dimensions.dart';

class PizzaOrderScreen extends StatefulWidget {
  final PizzaModel pizzaModel;

  const PizzaOrderScreen({
    super.key,
    required this.pizzaModel,
  });

  @override
  State<PizzaOrderScreen> createState() => _PizzaOrderScreenState();
}

class _PizzaOrderScreenState extends State<PizzaOrderScreen> {
  late PizzaOrderCubit pizzaOrderCubit;
  late int index;
  // late List<PizzaModel> cartItems;
  late CartCubit cartCubit;
  @override
  void initState() {
    super.initState();
    initAsync();
  }

  @override
  Widget build(BuildContext context) {
    // cartItems = BlocProvider.of<CartCubit>(context).cartPizzaItems;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            SafeArea(
              child: Container(
                color: MyColors.veryPaleBlue,
                child: Column(
                  children: [
                    Expanded(
                      child: FadeInImage.assetNetwork(
                        placeholder: loadingGif,
                        fit: BoxFit.fill,
                        width: 300,
                        image: widget.pizzaModel.image,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 35, 30, 30),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.pizzaModel.pizzaName,
                                style: const TextStyle(
                                    color: MyColors.navyBlue,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              AppDimensions.verticalSpacingDefault,
                              BuildAllPizzaSizeContainers(
                                pizzaSize: widget.pizzaModel.pizzaSize!,
                                pizzaOrderCubit: pizzaOrderCubit,
                                pizzaSizeIndex:
                                    widget.pizzaModel.pizzaSizeIndex!,
                                getPizzaSize: (pizzaSizeIndex, pizzaSize) {
                                  widget.pizzaModel.pizzaSizeIndex =
                                      pizzaSizeIndex;
                                  widget.pizzaModel.pizzaSize = pizzaSize;
                                },
                                pizzaModel: widget.pizzaModel,
                              ),
                              AppDimensions.verticalSpacingDefault,
                              Expanded(
                                child: Text(
                                  widget.pizzaModel.menuDescription.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              buildDeliveryTimeRow(),
                              AppDimensions.verticalSpacingDefault,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildAddAndRemoveContainer(
                                      color: Colors.grey.shade100,
                                      onPressed: () {
                                        pizzaOrderCubit.decrementPizzaOrder(
                                            cartCubit.cartPizzaItems,
                                            pizzaOrderCubit.showPizzaQuantity(
                                                widget.pizzaModel,
                                                cartCubit.cartPizzaItems),
                                            widget.pizzaModel);
                                        BlocProvider.of<CartCubit>(context)
                                            .updateToCartDatabase(
                                                widget.pizzaModel);
                                      },
                                      icon: Icons.remove),
                                  AppDimensions.horizontalSpacingDefault,
                                  Padding(
                                    padding: AppDimensions.paddingTop,
                                    child: BlocBuilder<PizzaOrderCubit,
                                        PizzaOrderState>(
                                      builder: (context, state) {
                                        return Text(
                                          '${pizzaOrderCubit.showPizzaQuantity(widget.pizzaModel, cartCubit.cartPizzaItems)}',
                                          style: const TextStyle(fontSize: 20),
                                        );
                                      },
                                    ),
                                  ),
                                  AppDimensions.horizontalSpacingDefault,
                                  buildAddAndRemoveContainer(
                                      color: Colors.grey.shade100,
                                      onPressed: () {
                                        pizzaOrderCubit.incrementPizzaOrder(
                                            cartCubit.cartPizzaItems,
                                            pizzaOrderCubit.showPizzaQuantity(
                                                widget.pizzaModel,
                                                cartCubit.cartPizzaItems),
                                            widget.pizzaModel);
                                        BlocProvider.of<CartCubit>(context)
                                            .updateToCartDatabase(
                                                widget.pizzaModel);
                                      },
                                      icon: Icons.add),
                                  const Spacer(),
                                  BlocBuilder<CartCubit, CartState>(
                                    builder: (context, state) {
                                      return Align(
                                        alignment: Alignment.center,
                                        child: BlocBuilder<PizzaOrderCubit,
                                            PizzaOrderState>(
                                          builder: (context, state) {
                                            return Text(
                                              '\$ ${pizzaOrderCubit.showPizzaPrice(widget.pizzaModel, cartCubit.cartPizzaItems).toStringAsFixed(2)}',
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            FavoriteIcon(
                width: 100,
                height: 55,
                size: 40,
                pizzaModel: widget.pizzaModel,
                margin: const EdgeInsetsDirectional.symmetric(vertical: 180))
          ],
        ),
        bottomNavigationBar: LowerButton(
          pizzaModel: widget.pizzaModel,
        ));
  }

  // Asynchronous initialization method
  Future<void> initAsync() async {
    pizzaOrderCubit = BlocProvider.of<PizzaOrderCubit>(context);
    cartCubit = BlocProvider.of<CartCubit>(context);
    widget.pizzaModel.pizzaSize ??= 'Medium';
    widget.pizzaModel.pizzaSizeIndex ??= 2;

    widget.pizzaModel.pizzaQuantity = PizzaQuantity(
        smallPizzaQuantity: 1, mediumPizzaQuantity: 1, largePizzaQuantity: 1);
    widget.pizzaModel.price = PizzaPrice(
        smallPizzaPrice: widget.pizzaModel.originalPrice / 2,
        mediumPizzaPrice: widget.pizzaModel.originalPrice,
        largePizzaPrice: widget.pizzaModel.originalPrice * 2);

    // Wait for the asynchronous data loading
    // await getCartItems();

    // Now, you can use the loaded data
    //   index =
    //       cartItems.indexWhere((element) => element.id == widget.pizzaModel.id);
    //   if (index != -1) {
    //     widget.pizzaModel.pizzaSizeIndex = cartItems[index].pizzaSizeIndex!;
    //     widget.pizzaModel.pizzaSize = cartItems[index].pizzaSize!;
    //   }
    //   // Update the state to rebuild the UI
    //   if (mounted) {
    //     setState(() {});
    //   }
    // }

    // Future<void> getCartItems() async {
    //   // Simulate an asynchronous operation (replace with your actual data fetching logic)
    //   await Future.delayed(const Duration(milliseconds: 90));

    //   // Fetch your cart items
    //   // ignore: use_build_context_synchronously
    //   final cartCubit = BlocProvider.of<CartCubit>(context);
    //   cartItems = cartCubit.cartPizzaItems;
    // }
  }
}
