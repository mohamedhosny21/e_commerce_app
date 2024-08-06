import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_connections_state.dart';

class InternetConnectionsCubit extends Cubit<InternetConnectionsState> {
  final Connectivity connectivity;
  late StreamSubscription streamSubscription;

  InternetConnectionsCubit(this.connectivity)
      : super(InternetConnectionsInitial()) {
    checkInternetConnection();
  }
  void checkInternetConnection() {
    streamSubscription =
        connectivity.onConnectivityChanged.listen((connection) {
      if (connection == ConnectivityResult.wifi ||
          connection == ConnectivityResult.mobile) {
        emit(InternetConnectedState(
            connectionMessage: 'Internet_connection_restored'.tr()));
      } else if (connection == ConnectivityResult.none) {
        emit(InternetDisConnectedState(
            connectionMessage: 'Internet_Connection_Lost'.tr()));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
