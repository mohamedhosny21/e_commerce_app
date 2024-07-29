import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/presentation_layer/widgets/shared_preferences.dart';
import 'package:home_slice/routing/app_router.dart';
import 'package:home_slice/firebase_options.dart';
import 'package:home_slice/routing/routes.dart';

late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final accessToken = await getFacebookUserAuthStatus();

  //check if the user logged in or logged out
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null && accessToken == null) {
      initialRoute = Routes.registerScreen;
    } else {
      initialRoute = Routes.homeScreen;
    }
  });

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
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
