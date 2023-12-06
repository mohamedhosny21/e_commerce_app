import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/widgets/appbar_widget.dart';
import 'package:home_slice/presentation_layer/widgets/cart_item_widget.dart';
import 'package:home_slice/presentation_layer/widgets/payment_persistant_bottomsheet.dart';

import '../../constants/colors.dart';
import '../widgets/drawer_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(),
      backgroundColor: Colors.grey.shade100,
      appBar: BuildAppBar(
        elevation: 4.0,
        title: 'Cart Items',
        color: Colors.grey.shade100,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 35.0,
              color: MyColors.myNavyBlue,
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
    );
  }
}
