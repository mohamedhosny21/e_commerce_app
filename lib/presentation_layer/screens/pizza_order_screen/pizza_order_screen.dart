import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/widgets/add_remove_containers_widget.dart';
import 'package:home_slice/presentation_layer/widgets/favorite_icon_container.dart';
import 'package:home_slice/presentation_layer/widgets/internet_connection_listener.dart';
import 'package:home_slice/presentation_layer/widgets/lower_button_widget.dart';
import '../../../business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import '../../../constants/dimensions.dart';
import 'pizza_order_widgets.dart';

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
    return InternetConnectionBlocListener(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  color: MyColors.veryPaleBlue,
                  child: Column(
                    children: [
                      Expanded(
                        child: FadeInImage.assetNetwork(
                          placeholder: AppConstants.loadingGif,
                          fit: BoxFit.fill,
                          width: 300.w,
                          image: widget.pizzaModel.image,
                        ),
                      ),
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
                                Text(
                                  widget.pizzaModel.pizzaName,
                                  style: MyTextStyles.font25NavyBlueBold,
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
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    widget.pizzaModel.menuDescription
                                        .toString(),
                                    style: MyTextStyles.font16GreyBold,
                                  ),
                                ),
                                Expanded(child: buildDeliveryTimeRow()),
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
                                      child: BlocBuilder<PizzaOrderCubit,
                                          PizzaOrderState>(
                                        builder: (context, state) {
                                          return Text(
                                            '${pizzaOrderCubit.showPizzaQuantity(widget.pizzaModel, cartCubit.cartPizzaItems)}',
                                            style:
                                                MyTextStyles.font20BlackRegular,
                                          );
                                        },
                                      ),
                                    ),
                                    AppDimensions.horizontalSpacing10,
                                    PizzaQuantityIncrementalContainer(
                                        pizzaOrderCubit: pizzaOrderCubit,
                                        cartCubit: cartCubit,
                                        pizzaModel: widget.pizzaModel),
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
                                                style: MyTextStyles
                                                    .font25BlackBold,
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
                FavoriteIcon(
                    width: 100,
                    height: 55,
                    size: 40,
                    pizzaModel: widget.pizzaModel,
                    margin: AppDimensions.marginTop145)
              ],
            ),
          ),
          bottomNavigationBar: LowerButton(
            pizzaModel: widget.pizzaModel,
          )),
    );
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
  }
}
