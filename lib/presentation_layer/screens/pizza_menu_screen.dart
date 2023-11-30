import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/widgets/appbar_widget.dart';
import 'package:home_slice/presentation_layer/widgets/drawer_widget.dart';
import 'package:home_slice/presentation_layer/widgets/pizza_item_widget.dart';
import 'package:home_slice/presentation_layer/widgets/textformfield_widget.dart';

import '../../business_logic_layer/cubit/pizza_api_cubit/pizza_cubit.dart';
import '../../constants/colors.dart';

class PizzaMenuScreen extends StatefulWidget {
  const PizzaMenuScreen({super.key, required this.category});
  final String category;

  @override
  State<PizzaMenuScreen> createState() => _PizzaMenuScreenState();
}

class _PizzaMenuScreenState extends State<PizzaMenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  late List<PizzaModel> allPizza;
  late List<PizzaModel> searchedPizza;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PizzaCubit>(context).getPizzaCubit(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: buildDrawer(),
        backgroundColor: Colors.grey.shade100,
        appBar: BuildAppBar(
          color: Colors.grey.shade100,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        body: Column(
          children: [
            buildTextFormField(
              controller: _searchController,
              suffixIcon: Icons.clear,
              suffixOnPressed: () {
                setState(() {
                  _stopSearching();
                });
              },
              prefixIcon: Icons.search,
              hintStyle: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              hintText: 'Search for a pizza',
              keyboardType: TextInputType.name,
              onChanged: (searchedWord) {
                setState(() {
                  getSearchedPizzaItems(searchedWord);
                });
              },
            ),
            //i make the items expanded and the body is column without singlechildscrollview to make the items scrollable while textformfield not scrolling
            Expanded(
              child: BlocConsumer<PizzaCubit, PizzaState>(
                listenWhen: (previous, current) {
                  return previous != current;
                },
                listener: (context, state) {
                  if (state is PizzaErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.errorMsg)));
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: MyColors.myNavyBlue,
                    ));
                  } else if (state is PizzaLoadedState) {
                    allPizza = state.allPizza;
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PizzaWidget(
                            pizzaModel: _searchController.text.isEmpty
                                ? state.allPizza[index]
                                : searchedPizza[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container();
                        },
                        itemCount: _searchController.text.isEmpty
                            ? state.allPizza.length
                            : searchedPizza.length);
                  }
                  return Container();
                },
              ),
            ),
          ],
        ));
  }

  void _stopSearching() {
    _searchController.clear();
  }

  void getSearchedPizzaItems(String searchedWord) {
    searchedPizza = allPizza
        .where((pizza) =>
            pizza.pizzaName!.toLowerCase().startsWith(searchedWord) ||
            pizza.pizzaName!.startsWith(searchedWord))
        .toList();
  }
}
