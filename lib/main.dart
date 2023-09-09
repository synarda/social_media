import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:social_media/controllers/global_bindings.dart';
import 'package:social_media/screens/login_page.dart';
import 'package:social_media/utils/const.dart';

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  load();
}

void load() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 70.0
    ..radius = 10.0
    ..progressColor = Colorss.themeNeon1
    ..backgroundColor = Colorss.backgroundColor
    ..indicatorColor = Colorss.themeNeon1
    ..textColor = Colorss.forebackground
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialBinding: GlobalBindings(),
      home: const LoginPage(),
      builder: (context, child) => FlutterEasyLoading(child: child),
    );
  }
}
