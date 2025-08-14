import 'package:austere/core/utils/exensions.dart';
import 'package:flutter/material.dart';
//import 'package:karwahoutside/core/utils/exensions.dart';

// class AppTheme {
  ThemeData get lightTheme => ThemeData(
        fontFamily: 'Inter_24pt',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize:61 , fontWeight: FontWeight.w700),
          //displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
          displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
          headlineSmall: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          titleLarge: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      );

  ThemeData get darkTheme => ThemeData(
        fontFamily: 'Inter_24pt',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize:61 , fontWeight: FontWeight.w700),
          displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          titleLarge: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        scaffoldBackgroundColor: Color(0xFF121212),
        useMaterial3: true,
      );
