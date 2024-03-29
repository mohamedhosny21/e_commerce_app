import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/internet_cinnections_cubit/cubit/internet_connections_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/data_layer/repository/pizza_repository.dart';
import 'package:home_slice/data_layer/webservices/pizza_webservices.dart';
import 'package:home_slice/presentation_layer/screens/cart_screen/cart_screen.dart';
import 'package:home_slice/presentation_layer/screens/pizza_order_screen/pizza_order_screen.dart';
import 'package:home_slice/presentation_layer/screens/pizza_menu_screen/pizza_menu_screen.dart';
import 'package:home_slice/presentation_layer/screens/register_screen/register_screen.dart';
import 'package:home_slice/presentation_layer/widgets/navbar_widget.dart';
import 'package:home_slice/routing/routes.dart';

import '../business_logic_layer/cubit/pizza_api_cubit/pizza_cubit.dart';

class AppRouter {
  late PizzaRepository pizzaRepository;
  late PizzaCubit pizzaCubit;
  AppRouter() {
    pizzaRepository = PizzaRepository(PizzaWebServices());
    pizzaCubit = PizzaCubit(pizzaRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<FavoritePizzaCubit>(
                  create: (context) => FavoritePizzaCubit()),
              BlocProvider<CartCubit>(
                create: (context) => CartCubit(),
              ),
              BlocProvider<PizzaOrderCubit>(
                create: (context) => PizzaOrderCubit(),
              ),
              BlocProvider<InternetConnectionsCubit>(
                create: (context) => InternetConnectionsCubit(Connectivity()),
              )
            ],
            child: const NavBar(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AuthenticationCubit>(
                  create: (context) => AuthenticationCubit(),
                  child: const RegisterScreen(),
                ));

      case Routes.pizzaMenuScreen:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<PizzaCubit>(
                create: (context) => PizzaCubit(pizzaRepository),
              ),
              BlocProvider<AuthenticationCubit>.value(
                value: AuthenticationCubit(),
              ),
            ],
            child: PizzaMenuScreen(category: category),
          ),
        );

      case Routes.pizzaOrderScreen:
        // final argumentData = settings.arguments as Map<String, dynamic>;
        final pizzaModel = settings.arguments as PizzaModel;

        return MaterialPageRoute(
            builder: (context) => PizzaOrderScreen(
                  pizzaModel: pizzaModel,
                ));
      case Routes.cartScreen:
        return MaterialPageRoute(builder: (context) => CartScreen());
    }
    return null;
  }
}
