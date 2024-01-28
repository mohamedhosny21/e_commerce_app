// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_cubit.dart';

sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class OnCreateAccountSuccessState extends AuthenticationState {
  final String successMsg;

  OnCreateAccountSuccessState({required this.successMsg});
}

class OnCreateAccountFailedState extends AuthenticationState {
  final String errorMsg;
  OnCreateAccountFailedState({
    required this.errorMsg,
  });
}

class OnLoginSuccessState extends AuthenticationState {
  final String successMsg;

  OnLoginSuccessState({required this.successMsg});
}

class OnLoginFailedState extends AuthenticationState {
  final String errorMsg;
  OnLoginFailedState({
    required this.errorMsg,
  });
}

class OnSocialLoginSuccessState extends AuthenticationState {}

class OnSocialLoginFailedState extends AuthenticationState {
  final String errorMsg;
  OnSocialLoginFailedState({
    required this.errorMsg,
  });
}

class OnEmailVerificationSentSuccessState extends AuthenticationState {
  final String successMsg;
  OnEmailVerificationSentSuccessState({
    required this.successMsg,
  });
}

class OnEmailVerificationSentFailedState extends AuthenticationState {
  final String errorMsg;
  OnEmailVerificationSentFailedState({
    required this.errorMsg,
  });
}

class OnResetPasswordSuccessState extends AuthenticationState {
  final String successMsg;
  OnResetPasswordSuccessState({
    required this.successMsg,
  });
}

class OnResetPasswordFailedState extends AuthenticationState {
  final String errorMsg;
  OnResetPasswordFailedState({
    required this.errorMsg,
  });
}

class SignOutState extends AuthenticationState {}
