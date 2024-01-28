import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
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
            connectionMessage: 'Internet-connection-restored'));
      } else if (connection == ConnectivityResult.none) {
        emit(InternetDisConnectedState(
            connectionMessage: 'Internet-Connection_Lost'));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
