import 'package:austere/core/routes/app_pages.dart';
import 'package:austere/core/themes/font_theme.dart' as AppTheme;
import 'package:austere/feature/temp/logic/controller/theme/theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();
  
     
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final ThemeController themeController = Get.put(ThemeController());
    //SizeConfig.init(context);
    return ScreenUtilInit(
      enableScaleWH: () => false,
      enableScaleText: () => false,
       designSize: const Size(432, 336),
      builder: (context, child) => GetMaterialApp(
        title: 'HandMadeApp',
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
       // initialBinding: HomeBinding(),
       theme: AppTheme.lightTheme,
        
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }
}