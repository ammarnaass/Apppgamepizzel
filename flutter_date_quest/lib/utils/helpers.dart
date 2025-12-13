import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Date utilities
class DateUtils {
  static String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
  
  static String getCurrentLocale() {
    return Get.locale?.languageCode ?? 'ar';
  }
  
  static bool isRTL() {
    return getCurrentLocale() == 'ar';
  }
}

// Screen utilities
class ScreenUtils {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  
  static bool isSmallScreen(BuildContext context) {
    return getScreenWidth(context) < 600;
  }
  
  static bool isMediumScreen(BuildContext context) {
    return getScreenWidth(context) >= 600 && getScreenWidth(context) < 1200;
  }
  
  static bool isLargeScreen(BuildContext context) {
    return getScreenWidth(context) >= 1200;
  }
}

// Animation utilities
class AnimationUtils {
  static Duration getShortAnimation() {
    return const Duration(milliseconds: 200);
  }
  
  static Duration getMediumAnimation() {
    return const Duration(milliseconds: 400);
  }
  
  static Duration getLongAnimation() {
    return const Duration(milliseconds: 600);
  }
  
  static Duration getExtraLongAnimation() {
    return const Duration(milliseconds: 800);
  }
}

// Storage utilities
class StorageKeys {
  static const String hasSeenOnboarding = 'has_seen_onboarding';
  static const String currentLanguage = 'language';
  static const String currentTheme = 'theme';
  static const String totalScore = 'total_score';
  static const String completedLevels = 'completed_levels';
  static const String coinsEarned = 'coins_earned';
  static const String playerLevel = 'player_level';
  static const String achievementsCount = 'achievements_count';
  static const String soundEnabled = 'sound_enabled';
  static const String musicEnabled = 'music_enabled';
  static const String notificationsEnabled = 'notifications_enabled';
}

// Validation utilities
class ValidationUtils {
  static bool isValidEmail(String email) {
    return GetUtils.isEmail(email);
  }
  
  static bool isValidPhoneNumber(String phone) {
    return GetUtils.isPhoneNumber(phone);
  }
  
  static bool isValidPassword(String password) {
    return password.length >= 6;
  }
}

// Game utilities
class GameUtils {
  static int calculateScore(int correctAnswers, int totalQuestions, int timeRemaining) {
    final baseScore = (correctAnswers / totalQuestions) * 100;
    final timeBonus = (timeRemaining / 60) * 10; // 10 points per minute remaining
    return (baseScore + timeBonus).round();
  }
  
  static String getPerformanceMessage(double accuracy) {
    if (accuracy >= 0.9) return 'ممتاز!';
    if (accuracy >= 0.7) return 'جيد جداً!';
    if (accuracy >= 0.5) return 'جيد!';
    if (accuracy >= 0.3) return 'يحتاج تحسين!';
    return 'حاول مرة أخرى!';
  }
  
  static int getStarsEarned(double accuracy) {
    if (accuracy >= 0.9) return 3;
    if (accuracy >= 0.7) return 2;
    if (accuracy >= 0.5) return 1;
    return 0;
  }
}

// Animation curves
class AppCurves {
  static const Curve bounce = Curves.bounceOut;
  static const Curve smooth = Curves.easeInOut;
  static const Curve fast = Curves.easeOut;
  static const Curve gentle = Curves.easeInOutCubic;
}

// Localization utilities
class LocalizationUtils {
  static String getLocalizedName(String nameAr, String nameEn, String nameFr) {
    final locale = Get.locale?.languageCode;
    switch (locale) {
      case 'ar':
        return nameAr;
      case 'fr':
        return nameFr;
      default:
        return nameEn;
    }
  }
  
  static String getLocalizedText(String key) {
    return tr(key);
  }
}