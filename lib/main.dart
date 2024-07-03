import 'package:adhd/Features/splash/presentation/views/splash_view.dart';
import 'package:adhd/core/utils/caching_utils/caching_utils.dart';
import 'package:adhd/core/utils/network_utils/network_utils.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  await CachingUtils.init();
  await NetworkUtils.init();
  runApp(const AdhdApp());
}

class AdhdApp extends StatelessWidget {
  const AdhdApp({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteUtils.navigatorKey,
      debugShowCheckedModeBanner: false,
      // routerConfig: AppRouter.router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue
      ),
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(375, 812),
        );
        return child!;
      },
      title: "Ahdh",
      home: 
      const SplashView(),
    );
  }
}