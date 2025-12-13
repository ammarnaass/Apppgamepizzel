import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Arabic-first typography system
  // ======================================
  
  // Display styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );
  
  static const TextStyle displayMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: -0.25,
  );
  
  static const TextStyle displaySmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // Headline styles
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Title styles
  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  static const TextStyle titleSmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Body styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  // Label styles
  static const TextStyle labelLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0.1,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0.1,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  // Game specific styles
  // ======================================
  
  static const TextStyle gameTitle = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    height: 1.2,
    shadows: [
      Shadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: AppColors.cardShadow,
      ),
    ],
  );
  
  static const TextStyle levelNumber = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.accent,
    height: 1.2,
  );
  
  static const TextStyle scoreText = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.2,
  );
  
  static const TextStyle coinText = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.coinGold,
    height: 1.2,
  );
  
  static const TextStyle starRating = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.starGold,
    height: 1.2,
  );

  // Button text styles
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.2,
    letterSpacing: 0.1,
  );
  
  static const TextStyle buttonMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.2,
    letterSpacing: 0.1,
  );
  
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.2,
    letterSpacing: 0.1,
  );

  // Special styles for Arabic text
  static const TextStyle arabicHeader = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  static const TextStyle arabicSubtitle = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.5,
  );
  
  static const TextStyle arabicBody = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.7,
  );

  // Method to get responsive font size
  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double scaleFactor = 0.8;
    return (screenWidth / 375) * baseSize * scaleFactor;
  }

  // Method to get text style with responsive sizing
  static TextStyle responsive({
    required BuildContext context,
    required TextStyle baseStyle,
    double? scaleFactor,
  }) {
    final responsiveSize = getResponsiveFontSize(
      context, 
      baseStyle.fontSize ?? 16,
    );
    
    return baseStyle.copyWith(fontSize: responsiveSize);
  }
}