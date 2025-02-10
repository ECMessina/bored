import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final mainTextStyle = GoogleFonts.manrope(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static final mainTextStyleWithColor = GoogleFonts.manrope(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.standardDarkColor,
  );

  static final boldActivityTextStyle = GoogleFonts.rubik(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.standardDarkColor,
  );

  static final activityTextStyle = GoogleFonts.rubik(
    fontSize: 20,
    color: AppColors.standardDarkColor,
  );

  static final linkTextStyle = GoogleFonts.rubik(
    fontSize: 20,
    color: AppColors.standardDarkColor,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.standardDarkColor,
    decorationThickness: 1.5,
  );
}

class AppColors {
  static const backgroundColor = Color.fromARGB(255, 231, 204, 236);
  static const backgroundButtonColor = Color.fromARGB(255, 222, 153, 235);
  static const backgroundCardColor = Color.fromARGB(255, 210, 174, 216);
  static final backgroundFilterColor = Colors.purple.shade100;
  static final shadowColor = Colors.black;
  static final spinnerColor = Colors.purple;
  static final standardDarkColor = Colors.purple.shade600;
}

class CustomException implements Exception {
  final String message;
  CustomException(this.message);

  @override
  String toString() => message;
}
