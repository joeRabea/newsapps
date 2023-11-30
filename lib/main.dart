import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insights_news/splash_view.dart';
import 'package:insights_news/upload_view.dart';

import 'app_color.dart';
import 'login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.scaffoldBG,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColor.scaffoldBG,
              elevation: 0.0,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed),
          textTheme: TextTheme(
            displayMedium: TextStyle(
                color: AppColor.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            displaySmall: TextStyle(color: AppColor.grey, fontSize: 14),
          ),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: UploadView()
        );
  }
}
