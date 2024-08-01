import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelpers {
  static void saveUserDataWithSharedPreference({
    required String userName,
    required String userId,
    String? email,
    String? profilePicture,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('user_id', userId);
    sharedPreferences.setString('name', userName);

    sharedPreferences.setString('email', email ?? '');

    sharedPreferences.setString(
        'profile_picture',
        profilePicture ??
            'https://t3.ftcdn.net/jpg/05/64/57/00/240_F_564570063_8moqE2rAG9i19zIgKu0GHmH5BDNP0ecu.png');
  }

  static Future<String?> getUserIdWithSharedPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('user_id');
  }

  static Future<String?> getUserNameWithSharedPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('name');
  }

  static void saveFacebookUserAuthState({required String accessToken}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('facebook_token', accessToken);
  }

  static Future<String?> getFacebookUserAuthStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('facebook_token');
  }

  static void removeFacebookAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove('facebook_token');
  }

  static Future<void> saveAppLanguage(String languageCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('language_code', languageCode);
  }

  static Future<String?> getAppLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('language_code');
  }
}
