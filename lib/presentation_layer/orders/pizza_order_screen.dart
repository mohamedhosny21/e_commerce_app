import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/business_logic_layer/cubit/localization_cubit/localization_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/generated/l10n.dart';
import 'package:home_slice/presentation_layer/orders/widgets/delivery_time_row.dart';
import 'package:home_slice/presentation_layer/orders/widgets/pizza_order_item_desc.dart';
import 'package:home_slice/presentation_layer/orders/widgets/pizza_order_item_image.dart';
import 'package:home_slice/presentation_layer/orders/widgets/pizza_order_item_name.dart';
import 'package:home_slice/presentation_layer/orders/widgets/pizza_order_item_price.dart';
import 'package:home_slice/widgets/favorite_icon_container.dart';
import 'package:home_slice/presentation_layer/orders/widgets/add_to_cart_button.dart';
import '../../business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import '../../constants/dimensions.dart';
import '../../widgets/add_remove_containers_widget.dart';
import 'widgets/pizza_order_item_quantity.dart';
import 'widgets/pizza_order_widgets.dart';

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
  late CartCubit cartCubit;
  @override
  void initState() {
    super.initState();
    initAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: MyColors.veryPaleBlue,
                child: Column(
                  children: [
                    PizzaOrderItemImage(pizzaModel: widget.pizzaModel),
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: AppDimensions.paddingFromSTEB_25_20_30_18,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50.r),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PizzaOrderItemName(
                                pizzaModel: widget.pizzaModel,
                              ),
                              AppDimensions.verticalSpacing15,
                              PizzaSizeContainers(
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
                              AppDimensions.verticalSpacing20,
                              PizzaOrderItemDesc(
                                pizzaModel: widget.pizzaModel,
                              ),
                              const DeliveryTimeRow(),
                              AppDimensions.verticalSpacing15,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PizzaQuantityDecrementalContainer(
                                      pizzaOrderCubit: pizzaOrderCubit,
                                      cartCubit: cartCubit,
                                      pizzaModel: widget.pizzaModel),
                                  AppDimensions.horizontalSpacing10,
                                  Padding(
                                    padding: AppDimensions.paddingTop4,
                                    child: PizzaOrderItemQuantity(
                                      pizzaModel: widget.pizzaModel,
                                    ),
                                  ),
                                  AppDimensions.horizontalSpacing10,
                                  PizzaQuantityIncrementalContainer(
                                      pizzaOrderCubit: pizzaOrderCubit,
                                      cartCubit: cartCubit,
                                      pizzaModel: widget.pizzaModel),
                                  const Spacer(),
                                  PizzaOrderItemPrice(
                                      pizzaModel: widget.pizzaModel)
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              context.read<LocaleCubit>().isArabic()
                  ? Positioned(
                      left: 0,
                      top: 20,
                      child: FavoriteIcon(
                          pizzaModel: widget.pizzaModel,
                          width: 100,
                          height: 55,
                          size: 40,
                          margin: AppDimensions.marginTop145))
                  : Positioned(
                      top: 20,
                      right: 0,
                      child: FavoriteIcon(
                          width: 100,
                          height: 55,
                          size: 40,
                          pizzaModel: widget.pizzaModel,
                          margin: AppDimensions.marginTop145),
                    )
            ],
          ),
        ),
        bottomNavigationBar: AddToCartButton(
          pizzaModel: widget.pizzaModel,
        ));
  }

  // Asynchronous initialization method
  Future<void> initAsync() async {
    pizzaOrderCubit = BlocProvider.of<PizzaOrderCubit>(context);
    cartCubit = BlocProvider.of<CartCubit>(context);
    widget.pizzaModel.pizzaSize ??=
        context.read<LocaleCubit>().isArabic() ? 'متوسط' : 'Medium';
    widget.pizzaModel.pizzaSizeIndex ??= 2;

    widget.pizzaModel.pizzaQuantity = PizzaQuantity(
        smallPizzaQuantity: 1, mediumPizzaQuantity: 1, largePizzaQuantity: 1);
    widget.pizzaModel.price = PizzaPrice(
        smallPizzaPrice: widget.pizzaModel.originalPrice / 2,
        mediumPizzaPrice: widget.pizzaModel.originalPrice,
        largePizzaPrice: widget.pizzaModel.originalPrice * 2);
  }
}
