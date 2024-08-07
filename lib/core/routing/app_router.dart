import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/payment_cubit/payment_cubit.dart';
import 'package:home_slice/presentation_layer/cart/transaction_completed_screen.dart';
import '../../business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../business_logic_layer/authentication_cubit/auth_cubit.dart';
import '../../business_logic_layer/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import '../../business_logic_layer/internet_cinnections_cubit/cubit/internet_connections_cubit.dart';
import '../../business_logic_layer/pizza_api_cubit/pizza_cubit.dart';
import '../../business_logic_layer/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../data_layer/models/pizza_model.dart';
import '../../presentation_layer/orders/pizza_order_screen.dart';
import '../../presentation_layer/menu/pizza_menu_screen.dart';
import '../../presentation_layer/register/register_screen.dart';
import '../../presentation_layer/settings/language_screen.dart';
import '../../presentation_layer/settings/settings_screen.dart';
import '../dependecy_injection/dependency_injection.dart';
import '../widgets/navbar_widget.dart';
import 'routes.dart';

class AppRouter {
  AppRouter();
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<InternetConnectionsCubit>(
            create: (context) => InternetConnectionsCubit(Connectivity()),
            child: const NavBar(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<AuthCubit>(
                      create: (context) => getIt<AuthCubit>(),
                    ),
                    BlocProvider<PaymentCubit>(
                      create: (context) => getIt<PaymentCubit>(),
                    ),
                  ],
                  child: const RegisterScreen(),
                ));

      case Routes.pizzaMenuScreen:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<PizzaCubit>(
                create: (context) => getIt<PizzaCubit>(),
              ),
              BlocProvider<AuthCubit>.value(
                value: getIt<AuthCubit>(),
              ),
              BlocProvider<FavoritePizzaCubit>.value(
                  value: FavoritePizzaCubit()),
            ],
            child: PizzaMenuScreen(category: category),
          ),
        );

      case Routes.pizzaOrderScreen:
        final pizzaModel = settings.arguments as PizzaModel;

        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<PizzaOrderCubit>.value(
                      value: PizzaOrderCubit(),
                    ),
                    BlocProvider<CartCubit>(
                      create: (context) => CartCubit(),
                    ),
                    BlocProvider<FavoritePizzaCubit>.value(
                        value: FavoritePizzaCubit()),
                  ],
                  child: PizzaOrderScreen(
                    pizzaModel: pizzaModel,
                  ),
                ));
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case Routes.languageScreen:
        return MaterialPageRoute(
          builder: (context) => const LanguageScreen(),
        );
      case Routes.transactionCompletedScreen:
        return MaterialPageRoute(
          builder: (context) => const TransactionCompletedScreen(),
        );
    }
    return null;
  }
}
