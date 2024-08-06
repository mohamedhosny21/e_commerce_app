import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/core/dependecy_injection/dependency_injection.dart';
import 'package:home_slice/presentation_layer/cart/widgets/payment_bloc_listener.dart';
import '../../business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../business_logic_layer/authentication_cubit/auth_cubit.dart';
import '../../business_logic_layer/payment_cubit/payment_cubit.dart';
import '../../core/constants/colors.dart';
import '../../data_layer/models/pizza_model.dart';
import '../../core/widgets/drawer_widget.dart';
import '../../helpers/internet_connection_listener.dart';
import '../../business_logic_layer/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../core/widgets/appbar_widget.dart';
import 'widgets/cart_item_widget.dart';
import 'widgets/payment_persistant_bottomsheet.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
        BlocProvider<PizzaOrderCubit>.value(
          value: PizzaOrderCubit(),
        ),
        BlocProvider<PaymentCubit>(
          create: (context) => getIt<PaymentCubit>(),
        ),
      ],
      child: InternetConnectionBlocListener(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: const MyDrawer(),
          backgroundColor: Colors.grey.shade100,
          appBar: MyAppBar(
            elevation: 4.0,
            title: context.tr('CartItems'),
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
          body: PaymentBlocListener(
            child: BlocBuilder<CartCubit, CartState>(
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
          ),
          bottomNavigationBar: const PaymentPersistantBottomSheet(),
        ),
      ),
    );
  }
}
