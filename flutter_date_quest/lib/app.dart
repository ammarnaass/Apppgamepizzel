import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'features/splash/splash_screen.dart';
import 'theme/app_theme.dart';
import 'data/translations.dart';
import 'utils/router.dart';

class DateQuestApp extends StatelessWidget {
  const DateQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set preferred orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      title: 'Date Quest - لعبة أحجيات التمر',
      debugShowCheckedModeBanner: false,
      
      // Localization
      locale: const Locale('ar', 'SA'),
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('ar', 'SA'), // Arabic
        Locale('en', 'US'), // English
        Locale('fr', 'FR'), // French
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      
      // Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      
      // Navigation
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
      
      // Builder for RTL support
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (context) {
              // Apply RTL if Arabic
              final locale = Localizations.localeOf(context);
              final isRTL = locale.languageCode == 'ar';
              
              return Direction(
                textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                child: child ?? const SplashScreen(),
              );
            },
          ),
        );
      },
    );
  }
}