import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/router.dart';
import '../../characters/mascot_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../data/translations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showMascot = false;
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    _startSplashSequence();
  }

  void _startSplashSequence() async {
    // Step 1: Show logo and title
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _showText = true;
    });

    // Step 2: Show mascot
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      _showMascot = true;
    });

    // Step 3: Navigate to onboarding or home
    await Future.delayed(const Duration(milliseconds: 2500));
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Check if user has seen onboarding before
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('has_seen_onboarding') ?? false;

    if (hasSeenOnboarding) {
      AppRoutes.toHome();
    } else {
      AppRoutes.toOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.warmGradient,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo and Title Section
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Logo
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.cardShadow,
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.eco,
                          size: 60,
                          color: AppColors.primary,
                        ),
                      ).animate().scale(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                      ),

                      const SizedBox(height: 24),

                      // App Title
                      if (_showText)
                        Text(
                          tr('app_name'),
                          style: AppTextStyles.displayLarge.copyWith(
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        )
                            .animate()
                            .fadeIn(duration: const Duration(milliseconds: 600))
                            .slideY(
                              begin: 0.5,
                              end: 0,
                              duration: const Duration(milliseconds: 600),
                            ),

                      const SizedBox(height: 8),

                      // Tagline
                      if (_showText)
                        Text(
                          tr('tagline'),
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.secondary,
                          ),
                          textAlign: TextAlign.center,
                        )
                            .animate(delay: const Duration(milliseconds: 200))
                            .fadeIn(duration: const Duration(milliseconds: 600))
                            .slideY(
                              begin: 0.3,
                              end: 0,
                              duration: const Duration(milliseconds: 600),
                            ),
                    ],
                  ),
                ),
              ),

              // Mascot Section
              if (_showMascot)
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      MascotWidget(
                        emotion: MascotEmotion.happy,
                        size: 80,
                        animated: true,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        tr('mascot_say_hello'),
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 800))
                          .slideX(
                            begin: 0.3,
                            end: 0,
                            duration: const Duration(milliseconds: 800),
                          ),
                    ],
                  ),
                ),

              // Loading Indicator
              if (_showMascot)
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                    strokeWidth: 3,
                  )
                      .animate()
                      .fadeIn(duration: const Duration(milliseconds: 400))
                      .scale(),
                ),

              // Skip Option
              if (_showMascot)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextButton(
                    onPressed: _navigateToNextScreen,
                    child: Text(
                      tr('onboarding_skip'),
                      style: AppTextStyles.buttonMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: const Duration(milliseconds: 600))
                      .slideY(
                        begin: 0.2,
                        end: 0,
                        duration: const Duration(milliseconds: 600),
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}