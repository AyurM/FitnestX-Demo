import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme appTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.black),
    displayMedium: GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.black),
    displaySmall: GoogleFonts.poppins(
        fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.black),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.gray1),
    labelLarge: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white),
    titleMedium: GoogleFonts.poppins(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.gray1));
