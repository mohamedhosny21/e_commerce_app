import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data_layer/models/pizza_model.dart';
import '../../data_layer/repository/pizza_repository.dart';

part 'pizza_state.dart';

class PizzaCubit extends Cubit<PizzaState> {
  final PizzaRepository pizzaRepository;
  String? errorStatusMsg;
  PizzaCubit(this.pizzaRepository) : super(PizzaInitial());

  void getPizzaCubit(
      {required String pizzaCategory, required String lang}) async {
    emit(LoadingState());

    try {
      final allPizza = await pizzaRepository.getPizzaRepo(
          pizzaCategory: pizzaCategory, lang: lang);
      emit(PizzaLoadedState(allPizza: allPizza));
    } catch (error) {
      errorStatusMsg = pizzaRepository.errorStatusMsg;
      debugPrint(onError.toString());
      emit(PizzaErrorState(errorMsg: errorStatusMsg));
    }
  }
}
