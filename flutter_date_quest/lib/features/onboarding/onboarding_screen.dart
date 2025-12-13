import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/router.dart';
import '../../characters/mascot_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../data/translations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() async {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Mark onboarding as completed
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('has_seen_onboarding', true);
      
      AppRoutes.toHome();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);
    
    AppRoutes.toHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header with skip button
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Page indicator
                  Row(
                    children: List.generate(_totalPages, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index 
                              ? AppColors.primary 
                              : AppColors.borderColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                  
                  // Skip button
                  TextButton(
                    onPressed: _skipOnboarding,
                    child: Text(
                      tr('onboarding_skip'),
                      style: AppTextStyles.buttonMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main content - PageView
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildOnboardingSlide(
                    image: '🌴',
                    titleKey: 'onboarding_slide1_title',
                    subtitleKey: 'onboarding_slide1_subtitle',
                    mascotEmotion: MascotEmotion.excited,
                  ),
                  _buildOnboardingSlide(
                    image: '📚',
                    titleKey: 'onboarding_slide2_title',
                    subtitleKey: 'onboarding_slide2_subtitle',
                    mascotEmotion: MascotEmotion.thinking,
                  ),
                  _buildOnboardingSlide(
                    image: '🎮',
                    titleKey: 'onboarding_slide3_title',
                    subtitleKey: 'onboarding_slide3_subtitle',
                    mascotEmotion: MascotEmotion.happy,
                  ),
                ],
              ),
            ),

            // Bottom navigation
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous button (hidden on first page)
                  if (_currentPage > 0)
                    OutlinedButton(
                      onPressed: _previousPage,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(color: AppColors.primary),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            tr('onboarding_prev'),
                            style: AppTextStyles.buttonMedium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    const SizedBox(width: 120),

                  // Next/Start button
                  ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      shadowColor: AppColors.cardShadow,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _currentPage == _totalPages - 1 
                              ? tr('onboarding_done')
                              : tr('onboarding_next'),
                          style: AppTextStyles.buttonMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        if (_currentPage < _totalPages - 1) ...[
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: AppColors.white,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingSlide({
    required String image,
    required String titleKey,
    required String subtitleKey,
    required MascotEmotion mascotEmotion,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Large emoji/icon
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
            child: Center(
              child: Text(
                image,
                style: const TextStyle(fontSize: 60),
              ),
            ),
          )
              .animate()
              .fadeIn(duration: const Duration(milliseconds: 600))
              .scale(
                duration: const Duration(milliseconds: 800),
                curve: Curves.elasticOut,
              ),

          const SizedBox(height: 40),

          // Title
          Text(
            tr(titleKey),
            style: AppTextStyles.headlineLarge.copyWith(
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          )
              .animate()
              .fadeIn(duration: const Duration(milliseconds: 600))
              .slideY(
                begin: 0.3,
                end: 0,
                duration: const Duration(milliseconds: 600),
              ),

          const SizedBox(height: 20),

          // Subtitle
          Text(
            tr(subtitleKey),
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          )
              .animate(
                delay: const Duration(milliseconds: 200),
              )
              .fadeIn(duration: const Duration(milliseconds: 600))
              .slideY(
                begin: 0.2,
                end: 0,
                duration: const Duration(milliseconds: 600),
              ),

          const SizedBox(height: 40),

          // Mascot character
          MascotWidget(
            emotion: mascotEmotion,
            size: 120,
            animated: true,
          )
              .animate(
                delay: const Duration(milliseconds: 400),
              )
              .fadeIn(duration: const Duration(milliseconds: 800))
              .slideY(
                begin: 0.4,
                end: 0,
                duration: const Duration(milliseconds: 800),
              ),

          const SizedBox(height: 30),

          // Decorative elements
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              )
                  .animate(
                    delay: Duration(milliseconds: 600 + index * 100),
                  )
                  .scale(
                    delay: Duration(milliseconds: 600 + index * 100),
                  )
                  .then()
                  .fadeIn();
            }),
          ),
        ],
      ),
    );
  }
}