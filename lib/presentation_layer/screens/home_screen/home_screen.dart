import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';

import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/presentation_layer/widgets/appbar_widget.dart';

import 'package:home_slice/presentation_layer/widgets/drawer_widget.dart';
import 'package:home_slice/presentation_layer/screens/home_screen/pizza_types_container_widget.dart';
import 'package:home_slice/presentation_layer/widgets/internet_connection_listener.dart';

import '../../../constants/dimensions.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>.value(
      value: AuthenticationCubit(),
      child: Scaffold(
        drawer: const MyDrawer(),
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        body: SafeArea(
          child: InternetConnectionBlocListener(
            child: Container(
              margin: AppDimensions.marginSymmetricH20V10,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Eat Fresh Pizza',
                      style: MyTextStyles.font40NavyBlueBold,
                    ),
                    Text(
                      'Our daily fresh pizza',
                      style: MyTextStyles.font20GreyBold,
                    ),
                    AppDimensions.verticalSpacing30,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  PizzaTypesContainer(
                                    buttonText: 'Show Now',
                                    category: 'Four Cheese Pizza',
                                    descText:
                                        'A collection of best tasting pizza and most popular one',
                                    image: AppConstants.fourCheesePizzaImage,
                                    color: MyColors.yellow,
                                  ),
                                  AppDimensions.verticalSpacing20,
                                  Column(
                                    children: [
                                      PizzaTypesContainer(
                                          buttonText: 'Show Now',
                                          category: 'BBQ Chicken Pizza',
                                          descText:
                                              'A collection of best tasting pizza and most popular one',
                                          color: MyColors.alabaster,
                                          image:
                                              AppConstants.barbecuePizzaImage),
                                      AppDimensions.verticalSpacing20,
                                      PizzaTypesContainer(
                                          buttonText: 'Show Now',
                                          category: 'Vegetarian Pizza',
                                          descText:
                                              'A collection of best tasting pizza and most popular one',
                                          color: MyColors.lightGreen,
                                          image:
                                              AppConstants.vegetarianPizzaImage)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        AppDimensions.horizontalSpacing20,
                        Expanded(
                            child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 160.h,
                                  decoration: BoxDecoration(
                                      color: MyColors.pink,
                                      borderRadius:
                                          BorderRadius.circular(30.r)),
                                ),
                                Padding(
                                  padding: AppDimensions.paddingSymmetric8,
                                  child: const Image(
                                    image: NetworkImage(AppConstants.chefImage),
                                  ),
                                ),
                              ],
                            ),
                            AppDimensions.verticalSpacing20,
                            Column(
                              children: [
                                PizzaTypesContainer(
                                    buttonText: 'Show Now',
                                    category: 'Pepperoni Pizza',
                                    descText:
                                        'A collection of best tasting pizza and most popular one',
                                    color: MyColors.veryPaleBlue,
                                    image: AppConstants.pepperoniPizzaImage),
                                AppDimensions.verticalSpacing20,
                                Column(
                                  children: [
                                    PizzaTypesContainer(
                                        buttonText: 'Show Now',
                                        category: 'Hawaiian Pizza',
                                        descText:
                                            'A collection of best tasting pizza and most popular one',
                                        color: MyColors.water,
                                        image: AppConstants.hawaiianPizzaImage),
                                    AppDimensions.verticalSpacing20,
                                    PizzaTypesContainer(
                                        buttonText: 'Show Now',
                                        category: 'Margherita Pizza',
                                        descText:
                                            'A collection of best tasting pizza and most popular one',
                                        color: MyColors.lightGrayishBlue,
                                        image:
                                            AppConstants.margheritaPizzaImage),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                    AppDimensions.verticalSpacing60,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
