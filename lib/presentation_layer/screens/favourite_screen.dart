import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/widgets/appbar_widget.dart';
import 'package:home_slice/presentation_layer/widgets/drawer_widget.dart';

class FavouriteScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawer: buildDrawer(),
        key: _scaffoldKey,
        appBar: BuildAppBar(
          elevation: 3.0,
          title: 'My Favorite Pizza',
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
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    key: ValueKey(favoriteItems[index].id),
                    onDismissed: (direction) {
                      favoritePizzaCubit.deleteFromFavoriteDatabase(
                          favoriteItems[index].id, favoriteItems[index]);
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, pizzaOrderScreen,
                            arguments: {'pizzaModel': favoriteItems[index]});
                      },
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(top: 10),
                        child: Card(
                          margin: const EdgeInsetsDirectional.all(10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FadeInImage.assetNetwork(
                                      width: 120,
                                      height: 120,
                                      placeholder: loadingGif,
                                      image: favoriteItems[index]
                                          .image
                                          .toString()),
                                  AppDimensions.horizontalSpacingDefault,
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      favoriteItems[index].pizzaName.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: MyColors.navyBlue,
                                              shape: BoxShape.circle,
                                              border: Border.all()),
                                          child: IconButton(
                                              onPressed: () {
                                                favoritePizzaCubit
                                                    .deleteFromFavoriteDatabase(
                                                        favoriteItems[index].id,
                                                        favoriteItems[index]);
                                              },
                                              icon: const Icon(
                                                Icons.favorite_sharp,
                                                color: Colors.red,
                                                size: 30,
                                              )))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: favoriteItems.length,
              );
            }
          },
        ));
  }
}
