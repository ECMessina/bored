import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final mainTextStyle = GoogleFonts.manrope(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

final boldActivityTextStyle = GoogleFonts.rubik(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.purple.shade600,
);

final activityTextStyle = GoogleFonts.rubik(
  fontSize: 20,
  color: Colors.purple.shade600,
);

final linkTextStyle = GoogleFonts.rubik(
  fontSize: 20,
  color: Colors.purple.shade600,
  decoration: TextDecoration.underline,
  decorationColor: Colors.purple.shade600,
  decorationThickness: 1.5,
);

class AppColors {
  static const backgroundColor = Color.fromARGB(255, 231, 204, 236);
  static const backgroundButtonColor = Color.fromARGB(255, 222, 153, 235);
  static const backgroundCardColor = Color.fromARGB(255, 210, 174, 216);
}
