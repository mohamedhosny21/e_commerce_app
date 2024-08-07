import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/core/dependecy_injection/dependency_injection.dart';
import '../../business_logic_layer/authentication_cubit/auth_cubit.dart';
import '../../business_logic_layer/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import '../../core/widgets/appbar_widget.dart';
import '../../core/widgets/drawer_widget.dart';
import '../../data_layer/models/pizza_model.dart';
import 'widgets/favorite_items_listview.dart';
import '../../helpers/internet_connection_listener.dart';

class FavouriteScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(
          value: getIt<AuthCubit>(),
        ),
        BlocProvider<FavoritePizzaCubit>(
            create: (context) => FavoritePizzaCubit()),
      ],
      child: InternetConnectionBlocListener(
        child: Scaffold(
            backgroundColor: Colors.grey.shade100,
            drawer: const MyDrawer(),
            key: _scaffoldKey,
            appBar: MyAppBar(
              elevation: 3.0,
              title: context.tr('FavoritesPizza'),
              color: Colors.grey.shade100,
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            body: BlocBuilder<FavoritePizzaCubit, FavoritePizzaState>(
              builder: (context, state) {
                final FavoritePizzaCubit favoritePizzaCubit =
                    BlocProvider.of<FavoritePizzaCubit>(context);
                final List<PizzaModel> favoriteItems =
                    favoritePizzaCubit.favoriteItems;

                if (favoriteItems.isEmpty) {
                  return const Center(
                    child: Text('No Data'),
                  );
                } else {
                  return FavoriteItemsListview(favoriteItems: favoriteItems);
                }
              },
            )),
      ),
    );
  }
}
