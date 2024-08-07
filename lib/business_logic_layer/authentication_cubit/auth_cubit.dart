import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:home_slice/data_layer/repository/auth_repository.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitial());
  void createUserAccount(
      {required String email,
      required String password,
      required String userName}) async {
    emit(LoadingState());
    try {
      _authRepository.createUserAccount(
          email: email, password: password, userName: userName);

      emit(OnCreateAccountSuccessState(
          successMsg: 'Account_created_successfully'.tr()));
    } on FirebaseAuthException catch (error) {
      emit(OnCreateAccountFailedState(errorMsg: ' ${error.code}'));
    } catch (error) {
      emit(OnCreateAccountFailedState(
          errorMsg: 'Error_creating_account'.tr() + error.toString()));
      debugPrint('Error : $error');
    }
  }

  void signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LoadingState());
    try {
      final UserCredential credential = await _authRepository
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        if (credential.user!.emailVerified) {
          log('${credential.user?.emailVerified}');
          emit(OnLoginSuccessState(successMsg: 'Login_Success'.tr()));
        } else {
          emit(OnLoginFailedState(
              errorMsg: 'Your_email_is_not_verified_yet'.tr()));
          await signOut();
        }
      }
    } on FirebaseAuthException catch (error) {
      emit(OnLoginFailedState(errorMsg: error.code));
    } catch (error) {
      emit(OnLoginFailedState(errorMsg: error.toString()));
    }
  }

  void resendEmailVerification(String email, String password) async {
    emit(LoadingState());
    try {
      final UserCredential credential =
          await _authRepository.resendEmailVerification(email, password);

      if (credential.user != null && !credential.user!.emailVerified) {
        await credential.user!.sendEmailVerification();

        emit(OnEmailVerificationSentSuccessState(
            successMsg: 'Email_has_been_sent_to'.tr() + email));
        await signOut();
      } else {
        emit(OnEmailVerificationSentFailedState(
            errorMsg: 'Error_sending_email_verification'.tr()));
      }
    } catch (error) {
      emit(OnEmailVerificationSentFailedState(
          errorMsg: 'Error_sending_email_verification'.tr()));
    }
  }

  void resetPassword(String email) async {
    emit(LoadingState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(OnResetPasswordSuccessState(
          successMsg: 'Password_reset_email_sent_to'.tr() + email));
    } on FirebaseAuthException catch (error) {
      emit(OnResetPasswordFailedState(errorMsg: error.code));
    } catch (error) {
      emit(OnResetPasswordFailedState(errorMsg: 'something_went_wrong'.tr()));
    }
  }

  void signInWithGoogle() async {
    emit(LoadingState());

    try {
      final UserCredential userCredential =
          await _authRepository.signInWithGoogle();
      final bool isNewUser = userCredential.additionalUserInfo!.isNewUser;
      emit(LoginWithSocialSuccessState(isNewUser: isNewUser));
    } on FirebaseAuthException catch (error) {
      emit(OnLoginFailedState(errorMsg: error.code));
      throw Exception(error.toString());
    } catch (error) {
      await signOut();
      emit(OnLoginFailedState(errorMsg: 'something_went_wrong'.tr()));
      throw Exception(error.toString());
    }
  }

  void signInWithFacebook() async {
    emit(LoadingState());

    try {
      final UserCredential userCredential =
          await _authRepository.signInWithFacebook();
      final bool isNewUser = userCredential.additionalUserInfo!.isNewUser;
      emit(LoginWithSocialSuccessState(isNewUser: isNewUser));
    } catch (error) {
      emit(OnLoginFailedState(errorMsg: 'something_went_wrong'.tr()));
      FacebookAuth.i.logOut();
      throw Exception(error);
    }
  }

  Future<void> signInWithTwitter() async {
    emit(LoadingState());
    final AuthResult authResult = await _authRepository.signInWithTwitter();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        final OAuthCredential authCredential = TwitterAuthProvider.credential(
          accessToken: authResult.authToken!,
          secret: authResult.authTokenSecret!,
        );
        final currentUser = FirebaseAuth.instance.currentUser;
        await _authRepository.storeUserDataLocally(
            userId: currentUser!.uid,
            name: currentUser.displayName!,
            profilePictureUrl: currentUser.photoURL);
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(authCredential);
        final bool isNewUser = userCredential.additionalUserInfo!.isNewUser;
        emit(LoginWithSocialSuccessState(isNewUser: isNewUser));

      case TwitterLoginStatus.cancelledByUser:
        emit(OnLoginFailedState(errorMsg: 'Login_cancelled_by_user'.tr()));
        throw Exception();

      case TwitterLoginStatus.error:
        emit(OnLoginFailedState(errorMsg: 'something_went_wrong'.tr()));
        throw Exception();
      default:
        null;
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
