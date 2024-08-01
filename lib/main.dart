import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/business_logic_layer/cubit/localization_cubit/localization_cubit.dart';
import 'package:home_slice/helpers/shared_preferences.dart';
import 'package:home_slice/routing/app_router.dart';
import 'package:home_slice/firebase_options.dart';
import 'package:home_slice/routing/routes.dart';

import 'generated/l10n.dart';

late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final accessToken =
      await SharedPreferencesHelpers.getFacebookUserAuthStatus();

  //check if the user logged in or logged out
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null && accessToken == null) {
      initialRoute = Routes.registerScreen;
    } else {
      initialRoute = Routes.homeScreen;
    }
  });
  final savedInitialLocale = await SharedPreferencesHelpers.getAppLanguage();
  final Locale initialLocale = savedInitialLocale == null
      ? const Locale('en', 'US')
      : Locale(savedInitialLocale);
  runApp(HomeSlice(
    initialLocale: initialLocale,
    appRouter: AppRouter(),
  ));
}

class HomeSlice extends StatelessWidget {
  final Locale initialLocale;
  final AppRouter appRouter;
  const HomeSlice(
      {super.key, required this.appRouter, required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(initialLocale),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            builder: (context, child) => MaterialApp(
              locale: locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              title: 'Home Slice',
              initialRoute: initialRoute,
              onGenerateRoute: appRouter.generateRoute,
            ),
            splitScreenMode: true,
            ensureScreenSize: true,
          );
        },
      ),
    );
  }
}
