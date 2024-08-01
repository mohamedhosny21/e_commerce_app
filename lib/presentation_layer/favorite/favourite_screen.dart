import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/generated/l10n.dart';
import 'package:home_slice/presentation_layer/favorite/widgets/favorite_items_listview.dart';
import 'package:home_slice/widgets/drawer_widget.dart';
import 'package:home_slice/helpers/internet_connection_listener.dart';

import '../../widgets/appbar_widget.dart';

class FavouriteScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>.value(
          value: AuthenticationCubit(),
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
              title: S.of(context).FavoritesPizza,
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
