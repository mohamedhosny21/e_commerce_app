import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';

import 'package:home_slice/presentation_layer/home/widgets/chef_container.dart';
import 'package:home_slice/presentation_layer/home/widgets/hawaiian_pizza_container.dart';
import 'package:home_slice/presentation_layer/home/widgets/home_titles.dart';
import 'package:home_slice/presentation_layer/home/widgets/margherita_pizza_container.dart';

import 'package:home_slice/widgets/drawer_widget.dart';
import 'package:home_slice/helpers/internet_connection_listener.dart';

import '../../constants/dimensions.dart';
import '../../widgets/appbar_widget.dart';
import 'widgets/barbeque_pizza_container.dart';
import 'widgets/four_cheese_pizza_container.dart';
import 'widgets/pepperoni_pizza_container.dart';
import 'widgets/vegetarian_pizza_container.dart';

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
                    const HomeTitles(),
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
                                  const FourCheesePizzaContainer(),
                                  AppDimensions.verticalSpacing20,
                                  Column(
                                    children: [
                                      const BBQPizzaContainer(),
                                      AppDimensions.verticalSpacing20,
                                      const VegetarianPizzaContainer()
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
                            const ChefContainer(),
                            AppDimensions.verticalSpacing20,
                            Column(
                              children: [
                                const PeperoniPizzaContainer(),
                                AppDimensions.verticalSpacing20,
                                Column(
                                  children: [
                                    const HawaiianPizzaContainer(),
                                    AppDimensions.verticalSpacing20,
                                    const MargheritaPizzaContainer(),
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
