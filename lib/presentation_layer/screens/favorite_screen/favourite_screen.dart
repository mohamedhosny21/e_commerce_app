import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/screens/favorite_screen/favorite_widget.dart';
import 'package:home_slice/presentation_layer/widgets/appbar_widget.dart';
import 'package:home_slice/presentation_layer/widgets/drawer_widget.dart';
import 'package:home_slice/presentation_layer/widgets/internet_connection_listener.dart';
import 'package:home_slice/routing/routes.dart';

class FavouriteScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>.value(
      value: AuthenticationCubit(),
      child: InternetConnectionBlocListener(
        child: Scaffold(
            backgroundColor: Colors.grey.shade100,
            drawer: const MyDrawer(),
            key: _scaffoldKey,
            appBar: MyAppBar(
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
                      return DismissibleWidget(
                        favoriteItem: favoriteItems[index],
                        favoritePizzaCubit: favoritePizzaCubit,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.pizzaOrderScreen,
                                arguments: favoriteItems[index]);
                          },
                          child: Container(
                            margin: AppDimensions.marginTop20,
                            child: Card(
                              color: Colors.white,
                              margin: AppDimensions.marginSymmetric10,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      FadeInImage.assetNetwork(
                                          width: 120,
                                          height: 120,
                                          placeholder: AppConstants.loadingGif,
                                          image: favoriteItems[index]
                                              .image
                                              .toString()),
                                      AppDimensions.horizontalSpacing10,
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          favoriteItems[index]
                                              .pizzaName
                                              .toString(),
                                          style: MyTextStyles.font20BlackBold,
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
                                                            favoriteItems[index]
                                                                .id,
                                                            favoriteItems[
                                                                index]);
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
            )),
      ),
    );
  }
}
