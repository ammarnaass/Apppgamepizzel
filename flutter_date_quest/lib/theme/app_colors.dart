import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary colors - Date themed
  static const Color primary = Color(0xFFD4A574); // Dates Gold
  static const Color primaryDark = Color(0xFFB8945A);
  static const Color primaryLight = Color(0xFFE8C899);
  
  // Secondary colors
  static const Color secondary = Color(0xFF8B6F47); // Dates Brown
  static const Color secondaryDark = Color(0xFF6B5738);
  static const Color secondaryLight = Color(0xFFA88B5C);
  
  // Accent colors
  static const Color accent = Color(0xFFF4D03F); // Golden Yellow
  static const Color accentLight = Color(0xFFF7DC6F);
  static const Color accentDark = Color(0xFFD4AC0D);
  
  // Success & Status
  static const Color success = Color(0xFF5FB660); // Oasis Green
  static const Color successLight = Color(0xFF7FB168);
  static const Color warning = Color(0xFFFFB74D);
  static const Color error = Color(0xFFE57373);
  static const Color info = Color(0xFF64B5F6);
  
  // Background colors
  static const Color background = Color(0xFFFFF8E7); // Warm Sand
  static const Color backgroundLight = Color(0xFFFFFDF0);
  static const Color surface = Color(0xFFFFFAF0); // Desert Sand
  static const Color surfaceVariant = Color(0xFFF5F0E8);
  
  // Text colors
  static const Color textPrimary = Color(0xFF3C3C3C);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textDisabled = Color(0xFF9CA3AF);
  static const Color textHint = Color(0xFF9CA3AF);
  
  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
  
  // Character & UI colors
  static const Color mascotPrimary = Color(0xFFD4A574);
  static const Color mascotSecondary = Color(0xFF8B6F47);
  static const Color cardShadow = Color(0x1A8B6F47);
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color dividerColor = Color(0xFFE5E7EB);
  
  // Game specific colors
  static const Color levelCompleted = Color(0xFF10B981);
  static const Color levelLocked = Color(0xFF6B7280);
  static const Color starGold = Color(0xFFFFD700);
  static const Color coinGold = Color(0xFFFFD700);
  
  // Dark theme colors
  static const Color darkBackground = Color(0xFF1F1F1F);
  static const Color darkSurface = Color(0xFF2D2D2D);
  static const Color darkTextPrimary = Color(0xFFE5E7EB);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
}

// Gradient definitions
class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient warmGradient = LinearGradient(
    colors: [AppColors.background, AppColors.surface],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient mascotGradient = LinearGradient(
    colors: [AppColors.mascotPrimary, AppColors.mascotSecondary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient successGradient = LinearGradient(
    colors: [AppColors.success, AppColors.successLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// Text colors for different themes
class ThemeColors {
  static const lightThemeColors = {
    'background': AppColors.background,
    'surface': AppColors.surface,
    'primary': AppColors.primary,
    'secondary': AppColors.secondary,
    'textPrimary': AppColors.textPrimary,
    'textSecondary': AppColors.textSecondary,
    'cardShadow': AppColors.cardShadow,
  };
  
  static const darkThemeColors = {
    'background': AppColors.darkBackground,
    'surface': AppColors.darkSurface,
    'primary': AppColors.primaryLight,
    'secondary': AppColors.secondaryLight,
    'textPrimary': AppColors.darkTextPrimary,
    'textSecondary': AppColors.darkTextSecondary,
    'cardShadow': Color(0x1AFFFFFF),
  };
}