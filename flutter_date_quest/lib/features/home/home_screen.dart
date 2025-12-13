import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/router.dart';
import '../../characters/mascot_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../data/translations.dart';

class HomeController extends GetxController {
  // Observable variables for game state
  final totalScore = 0.obs;
  final completedLevels = 0.obs;
  final coinsEarned = 0.obs;
  final playerLevel = 1.obs;
  final achievementsCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadPlayerData();
  }

  Future<void> _loadPlayerData() async {
    final prefs = await SharedPreferences.getInstance();
    
    totalScore.value = prefs.getInt('total_score') ?? 0;
    completedLevels.value = prefs.getInt('completed_levels') ?? 0;
    coinsEarned.value = prefs.getInt('coins_earned') ?? 0;
    playerLevel.value = prefs.getInt('player_level') ?? 1;
    achievementsCount.value = prefs.getInt('achievements_count') ?? 0;
  }

  Future<void> startGame(String gameType) async {
    AppRoutes.toGame(gameType);
  }

  Future<void> navigateToEncyclopedia() async {
    AppRoutes.toEncyclopedia();
  }

  Future<void> navigateToProfile() async {
    AppRoutes.toProfile();
  }

  Future<void> navigateToSettings() async {
    AppRoutes.toSettings();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  expandedHeight: 120,
                  floating: false,
                  pinned: true,
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      tr('app_name'),
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: AppGradients.primaryGradient,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60, right: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: MascotWidget(
                            emotion: MascotEmotion.waving,
                            size: 60,
                            animated: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Main Content
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Welcome Section
                        _buildWelcomeSection(controller),

                        const SizedBox(height: 24),

                        // Player Stats
                        _buildPlayerStats(controller),

                        const SizedBox(height: 32),

                        // Quick Actions
                        _buildQuickActions(),

                        const SizedBox(height: 32),

                        // Recent Achievements
                        _buildRecentAchievements(),

                        const SizedBox(height: 32),

                        // Game Modes
                        _buildGameModes(),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(HomeController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // Mascot
          MascotWidget(
            emotion: MascotEmotion.happy,
            size: 80,
            animated: true,
          ),

          const SizedBox(width: 16),

          // Welcome text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('greeting', args: ['${controller.playerLevel.value}']),
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tr('welcome_msg'),
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideX(
          begin: -0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildPlayerStats(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إحصائياتك اليوم',
          style: AppTextStyles.headlineMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.stars,
                label: tr('total_score'),
                value: controller.totalScore.value.toString(),
                color: AppColors.accent,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                icon: Icons.check_circle,
                label: tr('completed_levels'),
                value: controller.completedLevels.value.toString(),
                color: AppColors.success,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.workspace_premium,
                label: tr('achievements'),
                value: controller.achievementsCount.value.toString(),
                color: AppColors.warning,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                icon: Icons.school,
                label: tr('player_level'),
                value: controller.playerLevel.value.toString(),
                color: AppColors.info,
              ),
            ),
          ],
        ),
      ],
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideY(
          begin: 0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.headlineSmall.copyWith(
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إجراءات سريعة',
          style: AppTextStyles.headlineMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                icon: Icons.menu_book,
                title: tr('encyclopedia_title'),
                subtitle: tr('encyclopedia_subtitle'),
                color: AppColors.success,
                onTap: () => Get.find<HomeController>().navigateToEncyclopedia(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionCard(
                icon: Icons.person,
                title: tr('profile_title'),
                subtitle: tr('profile_subtitle'),
                color: AppColors.info,
                onTap: () => Get.find<HomeController>().navigateToProfile(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        Center(
          child: _buildActionCard(
            icon: Icons.settings,
            title: tr('settings_title'),
            subtitle: tr('settings_subtitle'),
            color: AppColors.secondary,
            onTap: () => Get.find<HomeController>().navigateToSettings(),
            width: MediaQuery.of(Get.context!).size.width * 0.45,
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideY(
          begin: 0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    double? width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
              size: 32,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentAchievements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الإنجازات الأخيرة',
          style: AppTextStyles.headlineMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.workspace_premium,
                  color: AppColors.accent,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ابدأ رحلة التعلم',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'أنجز أول مستوى في أي لعبة',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '+50',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideY(
          begin: 0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildGameModes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أنواع الألعاب',
          style: AppTextStyles.headlineMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: [
            _buildGameModeCard(
              icon: Icons.shuffle,
              title: tr('matching_game'),
              color: AppColors.primary,
              onTap: () => Get.find<HomeController>().startGame('matching'),
            ),
            _buildGameModeCard(
              icon: Icons.memory,
              title: tr('memory_game'),
              color: AppColors.secondary,
              onTap: () => Get.find<HomeController>().startGame('memory'),
            ),
            _buildGameModeCard(
              icon: Icons.question_mark,
              title: tr('guess_game'),
              color: AppColors.accent,
              onTap: () => Get.find<HomeController>().startGame('guess'),
            ),
            _buildGameModeCard(
              icon: Icons.sort,
              title: tr('arrange_game'),
              color: AppColors.success,
              onTap: () => Get.find<HomeController>().startGame('arrange'),
            ),
          ],
        ),
      ],
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideY(
          begin: 0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildGameModeCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 32,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}