import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../data/translations.dart';

class SettingsController extends GetxController {
  final currentLanguage = 'ar'.obs;
  final currentTheme = 'system'.obs;
  final soundEnabled = true.obs;
  final musicEnabled = true.obs;
  final notificationsEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    
    currentLanguage.value = prefs.getString('language') ?? 'ar';
    currentTheme.value = prefs.getString('theme') ?? 'system';
    soundEnabled.value = prefs.getBool('sound_enabled') ?? true;
    musicEnabled.value = prefs.getBool('music_enabled') ?? true;
    notificationsEnabled.value = prefs.getBool('notifications_enabled') ?? true;
  }

  Future<void> changeLanguage(String language) async {
    currentLanguage.value = language;
    
    // Update app locale
    final locale = Locale(language, language == 'ar' ? 'SA' : 'US');
    Get.updateLocale(locale);
    
    // Save to preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
  }

  Future<void> changeTheme(String theme) async {
    currentTheme.value = theme;
    
    // Apply theme
    ThemeMode themeMode;
    switch (theme) {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
    }
    
    Get.changeThemeMode(themeMode);
    
    // Save to preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

  Future<void> toggleSound(bool enabled) async {
    soundEnabled.value = enabled;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sound_enabled', enabled);
  }

  Future<void> toggleMusic(bool enabled) async {
    musicEnabled.value = enabled;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('music_enabled', enabled);
  }

  Future<void> toggleNotifications(bool enabled) async {
    notificationsEnabled.value = enabled;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', enabled);
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tr('settings'),
          style: AppTextStyles.headlineLarge.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: GetBuilder<SettingsController>(
          init: SettingsController(),
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Language Settings
                  _buildSectionHeader(tr('language')),
                  _buildLanguageSelector(controller),
                  
                  const SizedBox(height: 24),

                  // Theme Settings
                  _buildSectionHeader(tr('theme')),
                  _buildThemeSelector(controller),
                  
                  const SizedBox(height: 24),

                  // Audio Settings
                  _buildSectionHeader('الصوت'),
                  _buildAudioSettings(controller),
                  
                  const SizedBox(height: 32),

                  // Other Settings
                  _buildSectionHeader('إعدادات أخرى'),
                  _buildOtherSettings(controller),
                  
                  const SizedBox(height: 32),

                  // About Section
                  _buildAboutSection(),
                  
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.headlineMedium.copyWith(
        color: AppColors.primary,
      ),
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 600));
  }

  Widget _buildLanguageSelector(SettingsController controller) {
    return Container(
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
          _buildLanguageOption('ar', tr('language_arabic'), controller),
          _buildDivider(),
          _buildLanguageOption('en', tr('language_english'), controller),
          _buildDivider(),
          _buildLanguageOption('fr', tr('language_french'), controller),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideY(
          begin: 0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildLanguageOption(String language, String label, SettingsController controller) {
    final isSelected = controller.currentLanguage.value == language;
    
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isSelected ? AppColors.primary : AppColors.surfaceVariant,
        child: Text(
          language == 'ar' ? '🇸🇦' : language == 'en' ? '🇺🇸' : '🇫🇷',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      title: Text(
        label,
        style: AppTextStyles.titleMedium.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
      trailing: isSelected 
          ? const Icon(Icons.check_circle, color: AppColors.primary)
          : const Icon(Icons.radio_button_unchecked, color: AppColors.borderColor),
      onTap: () => controller.changeLanguage(language),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      minLeadingWidth: 0,
    );
  }

  Widget _buildThemeSelector(SettingsController controller) {
    return Container(
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
          _buildThemeOption('light', tr('theme_light'), Icons.light_mode, controller),
          _buildDivider(),
          _buildThemeOption('dark', tr('theme_dark'), Icons.dark_mode, controller),
          _buildDivider(),
          _buildThemeOption('system', tr('theme_system'), Icons.phone_android, controller),
        ],
      ),
    )
        .animate(
          delay: const Duration(milliseconds: 100),
        )
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideY(
          begin: 0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildThemeOption(String theme, String label, IconData icon, SettingsController controller) {
    final isSelected = controller.currentTheme.value == theme;
    
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
      ),
      title: Text(
        label,
        style: AppTextStyles.titleMedium.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
      trailing: isSelected 
          ? const Icon(Icons.check_circle, color: AppColors.primary)
          : const Icon(Icons.radio_button_unchecked, color: AppColors.borderColor),
      onTap: () => controller.changeTheme(theme),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      minLeadingWidth: 0,
    );
  }

  Widget _buildAudioSettings(SettingsController controller) {
    return Container(
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
          _buildSwitchTile(
            icon: Icons.volume_up,
            title: tr('sound_effects'),
            value: controller.soundEnabled.value,
            onChanged: controller.toggleSound,
          ),
          _buildDivider(),
          _buildSwitchTile(
            icon: Icons.music_note,
            title: tr('background_music'),
            value: controller.musicEnabled.value,
            onChanged: controller.toggleMusic,
          ),
          _buildDivider(),
          _buildSwitchTile(
            icon: Icons.notifications,
            title: tr('notifications'),
            value: controller.notificationsEnabled.value,
            onChanged: controller.toggleNotifications,
          ),
        ],
      ),
    )
        .animate(
          delay: const Duration(milliseconds: 200),
        )
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideY(
          begin: 0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: AppTextStyles.titleMedium.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primary,
        activeTrackColor: AppColors.primaryLight,
        inactiveThumbColor: AppColors.textSecondary,
        inactiveTrackColor: AppColors.borderColor,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      minLeadingWidth: 0,
    );
  }

  Widget _buildOtherSettings(SettingsController controller) {
    return Container(
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
          _buildActionTile(
            icon: Icons.privacy_tip,
            title: tr('privacy_policy'),
            onTap: () {},
          ),
          _buildDivider(),
          _buildActionTile(
            icon: Icons.help,
            title: tr('help_support'),
            onTap: () {},
          ),
          _buildDivider(),
          _buildActionTile(
            icon: Icons.info,
            title: tr('about_app'),
            onTap: () {},
          ),
        ],
      ),
    )
        .animate(
          delay: const Duration(milliseconds: 300),
        )
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideY(
          begin: 0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: AppTextStyles.titleMedium.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.textHint,
        size: 16,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      minLeadingWidth: 0,
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(20),
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
          Text(
            tr('app_name'),
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'الإصدار 1.0.0',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'لعبة تعليمية ممتعة لتعلم أنواع التمور المختلفة',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    )
        .animate(
          delay: const Duration(milliseconds: 400),
        )
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideY(
          begin: 0.3,
          end: 0,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.borderColor,
    );
  }
}