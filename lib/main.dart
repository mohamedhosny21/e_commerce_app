import 'package:flutter/material.dart';
import 'package:home_slice/app_router.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Slice',
      onGenerateRoute: appRouter.generateRoute,
      // home: NavBar(),
    );
  }
}
