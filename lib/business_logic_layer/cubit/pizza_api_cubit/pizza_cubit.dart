import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/data_layer/repository/pizza_repository.dart';

part 'pizza_state.dart';

class PizzaCubit extends Cubit<PizzaState> {
  final PizzaRepository pizzaRepository;
  PizzaCubit(this.pizzaRepository) : super(PizzaInitial());

  void getPizzaCubit(String pizzaCategory) {
    // use Timer to let bloc listener to trigger loading state when cubit function called in initState or buildWidget

    emit(LoadingState());
    pizzaRepository.getPizzaRepo(pizzaCategory).then((value) {
      emit(PizzaLoadedState(allPizza: value));
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(PizzaErrorState(errorMsg: 'Ooops,something went wrong !'));
    });
  }
}
