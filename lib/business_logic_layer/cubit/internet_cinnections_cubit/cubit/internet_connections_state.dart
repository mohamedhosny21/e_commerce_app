part of 'internet_connections_cubit.dart';

sealed class InternetConnectionsState {}

final class InternetConnectionsInitial extends InternetConnectionsState {}

class InternetConnectedState extends InternetConnectionsState {
  final String connectionMessage;

  InternetConnectedState({required this.connectionMessage});
}

class InternetDisConnectedState extends InternetConnectionsState {
  final String connectionMessage;

  InternetDisConnectedState({required this.connectionMessage});
}
