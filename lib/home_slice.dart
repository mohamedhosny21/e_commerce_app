import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/core/routing/app_router.dart';

class HomeSlice extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;
  const HomeSlice(
      {super.key, required this.appRouter, required this.initialRoute});

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
