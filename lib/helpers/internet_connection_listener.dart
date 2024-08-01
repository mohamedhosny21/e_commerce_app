import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/internet_cinnections_cubit/cubit/internet_connections_cubit.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/helpers/snackbar.dart';

// ignore: must_be_immutable
class InternetConnectionBlocListener extends StatelessWidget {
  final Widget child;
  bool wasDisconnected = false;
  InternetConnectionBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InternetConnectionsCubit, InternetConnectionsState>(
        builder: (context, state) {
          if (state is InternetConnectedState) {
            return child;
          } else if (state is InternetDisConnectedState) {
            return Center(
              child: Transform.scale(
                  scale: 1.0,
                  child: Image.asset(AppConstants.internetDisconnectedImage)),
            );
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {
          if (state is InternetConnectedState) {
            if (wasDisconnected) {
              showSnackBar(
                  context,
                  state.connectionMessage,
                  Icons.signal_wifi_statusbar_4_bar_rounded,
                  Colors.green.shade200,
                  Colors.black);
            }
            wasDisconnected = false;
          } else if (state is InternetDisConnectedState) {
            showSnackBar(context, state.connectionMessage,
                Icons.signal_wifi_off_sharp, Colors.red, Colors.black);
            wasDisconnected = true;
          }
        },
      ),
    );
  }
}
