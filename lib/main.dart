import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:home_slice/core/dependecy_injection/dependency_injection.dart';
import 'core/constants/api_constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'helpers/shared_preferences.dart';
import 'firebase_options.dart';

late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupGetIt();
  final accessToken =
      await SharedPreferencesHelpers.getString('facebook_token');
  //check if the user logged in or logged out
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null && accessToken == null) {
      initialRoute = Routes.registerScreen;
    } else {
      initialRoute = Routes.homeScreen;
    }
  });
  await dotenv.load(fileName: '.env');
  Stripe.publishableKey = ApiConstants.stripePublishableKey;
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/lang',
      fallbackLocale: const Locale('en'),
      child: HomeSlice(
        appRouter: AppRouter(),
      )));
}

class HomeSlice extends StatelessWidget {
  final AppRouter appRouter;
  const HomeSlice({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Home Slice',
        initialRoute: initialRoute,
        onGenerateRoute: appRouter.generateRoute,
      ),
      splitScreenMode: true,
      ensureScreenSize: true,
    );
  }
}
