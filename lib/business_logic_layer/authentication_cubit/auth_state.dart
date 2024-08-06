part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class OnCreateAccountSuccessState extends AuthState {
  final String successMsg;

  OnCreateAccountSuccessState({required this.successMsg});
}

class OnCreateAccountFailedState extends AuthState {
  final String errorMsg;
  OnCreateAccountFailedState({
    required this.errorMsg,
  });
}

class OnLoginSuccessState extends AuthState {
  final String successMsg;

  OnLoginSuccessState({required this.successMsg});
}

class LoginWithSocialSuccessState extends AuthState {
  final bool isNewUser;

  LoginWithSocialSuccessState({required this.isNewUser});
}

class OnLoginFailedState extends AuthState {
  final String errorMsg;
  OnLoginFailedState({
    required this.errorMsg,
  });
}

class OnSocialLoginSuccessState extends AuthState {}

class OnSocialLoginFailedState extends AuthState {
  final String errorMsg;
  OnSocialLoginFailedState({
    required this.errorMsg,
  });
}

class OnEmailVerificationSentSuccessState extends AuthState {
  final String successMsg;
  OnEmailVerificationSentSuccessState({
    required this.successMsg,
  });
}

class OnEmailVerificationSentFailedState extends AuthState {
  final String errorMsg;
  OnEmailVerificationSentFailedState({
    required this.errorMsg,
  });
}

class OnResetPasswordSuccessState extends AuthState {
  final String successMsg;
  OnResetPasswordSuccessState({
    required this.successMsg,
  });
}

class OnResetPasswordFailedState extends AuthState {
  final String errorMsg;
  OnResetPasswordFailedState({
    required this.errorMsg,
  });
}

class SignOutState extends AuthState {}
