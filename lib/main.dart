import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsonwheels/pages/splashScreen.dart';
import 'pages/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // Define your custom color
    const Color primaryColor = Color(0xFFFA003F);
    // Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in, unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meals on Wheels',
          // You can use the library anywhere in the app, even in the theme
          theme: ThemeData(
            primaryColor: primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.openSansTextTheme(),
          ),
          home: child,
        );
      },
      child:const SplashScreen(),
    );
  }
}
