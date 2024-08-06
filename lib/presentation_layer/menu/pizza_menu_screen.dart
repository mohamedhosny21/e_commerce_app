import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/styles.dart';
import '../../core/widgets/appbar_widget.dart';
import '../../core/widgets/drawer_widget.dart';
import '../../core/widgets/textformfield_widgets.dart';
import '../../data_layer/models/pizza_model.dart';
import 'widgets/pizza_menu_items_listview.dart';
import '../../helpers/snackbar.dart';
import '../../business_logic_layer/pizza_api_cubit/pizza_cubit.dart';
import '../../core/constants/colors.dart';

class PizzaMenuScreen extends StatefulWidget {
  const PizzaMenuScreen({super.key, required this.category});
  final String category;

  @override
  State<PizzaMenuScreen> createState() => _PizzaMenuScreenState();
}

class _PizzaMenuScreenState extends State<PizzaMenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchController = TextEditingController();
  List<PizzaModel> allPizza = [];
  List<PizzaModel> searchedPizza = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<PizzaCubit>(context).getPizzaCubit(
        pizzaCategory: widget.category, lang: context.locale.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const MyDrawer(),
        backgroundColor: Colors.grey.shade100,
        appBar: MyAppBar(
          color: Colors.grey.shade100,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        body: Column(
          children: [
            MyTextFormField(
              cursorColor: Colors.black,
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
              controller: searchController,
              suffixIcon: Icons.clear,
              suffixOnPressed: () {
                setState(() {
                  _stopSearching();
                });
              },
              prefixIcon: Icons.search,
              hintStyle: MyTextStyles.font20GreyRegular,
              hintText: context.tr('Search_for_a_pizza'),
              keyboardType: TextInputType.name,
              onChanged: (searchedWord) {
                setState(() {
                  getSearchedPizzaItems(searchedWord);
                });
              },
            ),
            //i make the items expanded and the body is column without singlechildscrollview to make the items scrollable while textformfield not scrolling
            Expanded(
              child: _buildPizzaMenuBlocConsumer(),
            ),
          ],
        ));
  }

  BlocConsumer<PizzaCubit, PizzaState> _buildPizzaMenuBlocConsumer() {
    return BlocConsumer<PizzaCubit, PizzaState>(
      listener: (context, state) {
        if (state is PizzaErrorState) {
          showErrorSnackBar(
              context, state.errorMsg ?? 'Ooops_something_went_wrong'.tr());
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
              child: CircularProgressIndicator(
            color: MyColors.navyBlue,
          ));
        } else if (state is PizzaLoadedState) {
          if (state.allPizza.isNotEmpty) {
            allPizza = state.allPizza;

            return PizzaMenuItemsListview(
                allPizza: allPizza,
                searchedPizza: searchedPizza,
                searchController: searchController);
          }
        }
        return const SizedBox();
      },
    );
  }

  void _stopSearching() {
    searchController.clear();
  }

  void getSearchedPizzaItems(String searchedWord) {
    searchedPizza = allPizza
        .where((pizza) =>
            pizza.pizzaName.toLowerCase().startsWith(searchedWord) ||
            pizza.pizzaName.startsWith(searchedWord))
        .toList();
  }
}
