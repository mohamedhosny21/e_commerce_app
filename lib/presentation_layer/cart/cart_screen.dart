import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/generated/l10n.dart';
import 'package:home_slice/widgets/drawer_widget.dart';
import 'package:home_slice/helpers/internet_connection_listener.dart';

import '../../business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../widgets/appbar_widget.dart';
import 'widgets/cart_item_widget.dart';
import 'widgets/payment_persistant_bottomsheet.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
        BlocProvider<PizzaOrderCubit>.value(
          value: PizzaOrderCubit(),
        ),
      ],
      child: InternetConnectionBlocListener(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: const MyDrawer(),
          backgroundColor: Colors.grey.shade100,
          appBar: MyAppBar(
            elevation: 4.0,
            title: S.of(context).CartItems,
            color: Colors.grey.shade100,
            leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  size: 35.0,
                  color: MyColors.navyBlue,
                )),
          ),
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final List<PizzaModel> cartItems =
                  BlocProvider.of<CartCubit>(context).cartPizzaItems;

              if (cartItems.isEmpty) {
                return const Center(
                  child: Text("No Data"),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return CartItem(
                      context: context,
                      pizzaModel: cartItems[index],
                    );
                  },
                  itemCount: cartItems.length,
                );
              }
            },
          ),
          bottomNavigationBar: const PaymentPersistantBottomSheet(),
        ),
      ),
    );
  }
}
