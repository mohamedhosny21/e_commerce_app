import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../core/constants/api_constants.dart';
import '../../helpers/shared_preferences.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> createUserAccount(
      {required String email,
      required String password,
      required String userName}) async {
    //creating temporary app to use it with app when using instance for
    final FirebaseApp tempApp = await Firebase.initializeApp(
        name: 'temporaryregister', options: Firebase.app().options);

    //used instance for instead of instance : to prevent the user from logging in directly when he created his account.so, he has to login
    final UserCredential credential =
        await FirebaseAuth.instanceFor(app: tempApp)
            .createUserWithEmailAndPassword(email: email, password: password);
    await _updateUserName(credential: credential, name: userName);
    await _sendEmailVerification(credential);
    log('credential user : ${credential.user}');
  }

  Future<void> _updateUserName(
      {required UserCredential credential, required String name}) async {
    await credential.user!.updateDisplayName(name);
  }

  Future<void> _sendEmailVerification(UserCredential credential) async {
    await credential.user?.sendEmailVerification();
  }

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final UserCredential credential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    final userData = credential.user;

    final name = userData?.displayName;
    await storeUserDataLocally(
        userId: userData!.uid, name: name ?? '', email: email);

    return credential;
  }

  Future<void> signOut() async {
    SharedPreferencesHelpers.remove('facebook_token');
    await _firebaseAuth.signOut();
  }

  Future<void> storeUserDataLocally(
      {required String userId,
      required String name,
      String? email,
      String? token,
      String? profilePictureUrl}) async {
    SharedPreferencesHelpers.setString('user_id', userId);
    SharedPreferencesHelpers.setString('name', name);
    if (email != null) {
      SharedPreferencesHelpers.setString('email', email);
    }
    if (profilePictureUrl != null) {
      SharedPreferencesHelpers.setString('profile_picture', profilePictureUrl);
    }
    if (token != null) {
      SharedPreferencesHelpers.setString('facebook_token', token);
    }
  }

  Future<UserCredential> resendEmailVerification(
      String email, String password) async {
    final UserCredential credential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Sign out the current user (if any) before signing in with a new account
    await GoogleSignIn().signOut();
    //initialize signing in process and triggers the authentication flow by opening the Google Sign-In dialog. it opens a dialog or a web page (depending on the platform) where the user can choose or enter their Google credentials to sign in.
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    await storeUserDataLocally(
        userId: googleUser!.id,
        name: googleUser.displayName!,
        email: googleUser.email);
    //If the user successfully signs in, the app retrieves authentication details (like access token and ID token)
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    //Using these authentication details, the app creates a credential suitable for Firebase authentication
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Once signed in, return the UserCredential
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential;
  }

  Future<UserCredential> signInWithFacebook() async {
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
    await storeUserDataLocally(
        userId: userId,
        name: name!,
        email: email!,
        profilePictureUrl: profilePictureUrl,
        token: accessToken);
    // Once signed in, return the UserCredential
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    return userCredential;
  }

  Future<AuthResult> signInWithTwitter() async {
    final TwitterLogin twitterLogin = TwitterLogin(
        apiKey: ApiConstants.twitterApiKey,
        apiSecretKey: ApiConstants.twitterApiSecretKey,
        redirectURI: 'twitterauth://');

    final authresult = await twitterLogin.loginV2(forceLogin: true);
    log('auth token : ${authresult.authToken}');
    log('secret token : ${authresult.authTokenSecret}');
    return authresult;
  }
}
