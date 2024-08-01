import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/helpers/shared_preferences.dart';
import 'package:twitter_login/twitter_login.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> createUserAccount(
      {required String email,
      required String password,
      required String userName}) async {
    emit(LoadingState());
    try {
      //creating temporary app to use it with app when using instance for
      final FirebaseApp tempApp = await Firebase.initializeApp(
          name: 'temporaryregister', options: Firebase.app().options);
      //create account
      //used instance for instead of instance : to prevent the user from logging in directly when he created his account.so, he has to login

      final UserCredential credential =
          await FirebaseAuth.instanceFor(app: tempApp)
              .createUserWithEmailAndPassword(email: email, password: password);
      //update username
      await credential.user!.updateDisplayName(userName);

      //send email verification

      await credential.user?.sendEmailVerification();

      emit(OnCreateAccountSuccessState(
          successMsg: 'Account-Created-Successfully'));
      debugPrint('credential user : ${credential.user}');
    } on FirebaseAuthException catch (error) {
      emit(OnCreateAccountFailedState(errorMsg: ' ${error.code}'));
    } catch (error) {
      emit(
          OnCreateAccountFailedState(errorMsg: 'Error-creating-account$error'));
      debugPrint('Error : $error');
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LoadingState());
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final userData = credential.user;

      final name = userData?.displayName;
      SharedPreferencesHelpers.saveUserDataWithSharedPreference(
          userId: userData!.uid, userName: name ?? '', email: email);
      if (credential.user != null) {
        if (credential.user!.emailVerified) {
          debugPrint('${credential.user?.emailVerified}');
          emit(OnLoginSuccessState(successMsg: 'Login-Success'));
        } else {
          emit(OnLoginFailedState(errorMsg: 'Email-Not-Verified'));
          signOut();
        }
      }
    } on FirebaseAuthException catch (error) {
      emit(OnLoginFailedState(errorMsg: error.code));
    } catch (error) {
      emit(OnLoginFailedState(errorMsg: error.toString()));
    }
  }

  Future<void> signOut() async {
    //remove facebook access token from shared pref when signing out
    SharedPreferencesHelpers.removeFacebookAccessToken();
    await FirebaseAuth.instance.signOut();
    emit(SignOutState());
  }

  Future<void> resendEmailVerification(String email, String password) async {
    emit(LoadingState());
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null && !credential.user!.emailVerified) {
        await credential.user!.sendEmailVerification();

        emit(OnEmailVerificationSentSuccessState(
            successMsg: 'Email-verification-has-been-sent-to $email'));
        signOut();
      } else {
        emit(OnEmailVerificationSentFailedState(
            errorMsg: 'Error-sending-email-verification !!'));
      }
    } catch (error) {
      emit(OnEmailVerificationSentFailedState(
          errorMsg: 'Error-sending-email-verification'));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(LoadingState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(OnResetPasswordSuccessState(
          successMsg: 'Password-reset-email-sent-to $email'));
    } on FirebaseAuthException catch (error) {
      emit(OnResetPasswordFailedState(errorMsg: error.code));
    } catch (error) {
      emit(OnResetPasswordFailedState(errorMsg: 'Something-went-Wrong !!'));
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    emit(LoadingState());

    try {
      // Sign out the current user (if any) before signing in with a new account
      await GoogleSignIn().signOut();
      //initialize signing in process and triggers the authentication flow by opening the Google Sign-In dialog. it opens a dialog or a web page (depending on the platform) where the user can choose or enter their Google credentials to sign in.
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      SharedPreferencesHelpers.saveUserDataWithSharedPreference(
          userId: googleUser!.id,
          userName: googleUser.displayName!,
          email: googleUser.email);
      //If the user successfully signs in, the app retrieves authentication details (like access token and ID token)
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      //Using these authentication details, the app creates a credential suitable for Firebase authentication
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      emit(OnLoginSuccessState(successMsg: 'Login-Success'));

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      emit(OnLoginFailedState(errorMsg: error.code));
      throw Exception(error.toString());
    } catch (error) {
      signOut();
      emit(OnLoginFailedState(errorMsg: 'Something-went-wrong!'));
      throw Exception(error.toString());
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    emit(LoadingState());

    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final accessToken = loginResult.accessToken!.token;

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken);

      final Map<String, dynamic> userData = await FacebookAuth.instance
          .getUserData(fields: ' id,name,email,picture');
      final String userId = userData['id'];

      final String profilePictureUrl =
          'https://graph.facebook.com/$userId/picture?type=large';
      final String? name = userData['name'];
      final String? email = userData['email'];
      // final profilePicture = userData['picture']['data']['url'];
      SharedPreferencesHelpers.saveUserDataWithSharedPreference(
          userId: userId,
          userName: name!,
          email: email!,
          profilePicture: profilePictureUrl);

      emit(OnLoginSuccessState(successMsg: 'Login-Success'));
      SharedPreferencesHelpers.saveFacebookUserAuthState(
          accessToken: accessToken);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (error) {
      emit(OnLoginFailedState(errorMsg: 'Something-went-Wrong'));
      FacebookAuth.i.logOut();
      return throw Exception(error);
    }
  }

  Future<void> signInWithTwitter() async {
    emit(LoadingState());
    final TwitterLogin twitterLogin = TwitterLogin(
        apiKey: ApiConstants.twitterApiKey,
        apiSecretKey: ApiConstants.twitterApiKeySecret,
        redirectURI: 'twitterauth://');

    final authresult = await twitterLogin.loginV2(forceLogin: true);
    debugPrint('auth token : ${authresult.authToken}');
    debugPrint('secret token : ${authresult.authTokenSecret}');
    switch (authresult.status) {
      case TwitterLoginStatus.loggedIn:
        final OAuthCredential authCredential = TwitterAuthProvider.credential(
          accessToken: authresult.authToken!,
          secret: authresult.authTokenSecret!,
        );
        await FirebaseAuth.instance.signInWithCredential(authCredential);
        final userData = FirebaseAuth.instance.currentUser;

        final name = userData!.displayName;
        final profilePicture = userData.photoURL;

        debugPrint('user name : $name');

        SharedPreferencesHelpers.saveUserDataWithSharedPreference(
          userId: userData.uid,
          userName: name ?? '',
          profilePicture: profilePicture,
        );
        emit(OnLoginSuccessState(successMsg: 'Login-Success'));

      case TwitterLoginStatus.cancelledByUser:
        emit(OnLoginFailedState(errorMsg: 'Login-cancelled-by-user'));
        throw Exception();

      case TwitterLoginStatus.error:
        emit(OnLoginFailedState(errorMsg: 'something-went-wrong'));
        throw Exception();
      default:
        null;
    }
  }
}
