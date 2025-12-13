import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../encyclopedia/date_model.dart';
import '../../../utils/router.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../../data/translations.dart';

class EncyclopediaController extends GetxController {
  final searchController = TextEditingController();
  final filteredDates = <DateVariety>[].obs;
  final selectedCategory = 'all'.obs;
  final isSearching = false.obs;

  @override
  void onInit() {
    super.onInit();
    filteredDates.value = DateVarieties.varieties;
    searchController.addListener(_onSearchChanged);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredDates.value = DateVarieties.varieties;
    } else {
      filteredDates.value = DateVarieties.search(query);
    }
  }

  void filterByTaste(String taste) {
    selectedCategory.value = taste;
    if (taste == 'all') {
      filteredDates.value = DateVarieties.varieties;
    } else {
      filteredDates.value = DateVarieties.varieties
          .where((date) => date.taste.toLowerCase().contains(taste.toLowerCase()))
          .toList();
    }
  }

  void clearSearch() {
    searchController.clear();
    filteredDates.value = DateVarieties.varieties;
  }

  void navigateToDateDetail(DateVariety date) {
    AppRoutes.toDateDetail(date.id);
  }
}

class EncyclopediaScreen extends StatelessWidget {
  const EncyclopediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GetBuilder<EncyclopediaController>(
          init: EncyclopediaController(),
          builder: (controller) {
            return CustomScrollView(
              slivers: [
                // Header with search
                SliverAppBar(
                  expandedHeight: 140,
                  floating: false,
                  pinned: true,
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      tr('encyclopedia_header'),
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: AppGradients.primaryGradient,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr('encyclopedia_subheader'),
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.white.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Search bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
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
                      child: TextField(
                        controller: controller.searchController,
                        style: AppTextStyles.bodyMedium,
                        decoration: InputDecoration(
                          hintText: tr('search_hint'),
                          hintStyle: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textHint,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColors.primary,
                          ),
                          suffixIcon: controller.searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: AppColors.textSecondary,
                                  ),
                                  onPressed: controller.clearSearch,
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Category filters
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تصفية حسب الطعم',
                          style: AppTextStyles.titleMedium.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildCategoryChip('all', tr('all'), controller),
                              _buildCategoryChip('sweet', tr('taste_sweet'), controller),
                              _buildCategoryChip('dry', tr('taste_dry'), controller),
                              _buildCategoryChip('soft', tr('taste_soft'), controller),
                              _buildCategoryChip('caramel', tr('taste_caramel'), controller),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Date varieties list
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final date = controller.filteredDates[index];
                        return _buildDateCard(date, controller)
                            .animate()
                            .fadeIn(
                              delay: Duration(milliseconds: index * 100),
                              duration: const Duration(milliseconds: 600),
                            )
                            .slideY(
                              begin: 0.3,
                              end: 0,
                              duration: const Duration(milliseconds: 600),
                            );
                      },
                      childCount: controller.filteredDates.length,
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

  Widget _buildCategoryChip(String value, String label, EncyclopediaController controller) {
    final isSelected = controller.selectedCategory.value == value;
    
    return GestureDetector(
      onTap: () => controller.filterByTaste(value),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderColor,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: isSelected ? AppColors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildDateCard(DateVariety date, EncyclopediaController controller) {
    return GestureDetector(
      onTap: () => controller.navigateToDateDetail(date),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
            // Date image placeholder
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: date.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: date.color.withOpacity(0.5),
                ),
              ),
              child: Center(
                child: Text(
                  '🌰',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),

            // Date info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      date.nameAr,
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    
                    // English name
                    Text(
                      date.nameEn,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Origin and taste
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          size: 14,
                          color: AppColors.textHint,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            date.origin,
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    
                    Row(
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 14,
                          color: AppColors.textHint,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date.taste,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Arrow
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.textHint,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Detail screen placeholder
class DateDetailScreen extends StatelessWidget {
  const DateDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;
    final dateId = arguments?['dateId'] ?? 1;
    final date = DateVarieties.getById(dateId);

    return Scaffold(
      appBar: AppBar(
        title: Text(date.nameAr),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with large image
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: date.color.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: date.color.withOpacity(0.5),
                  ),
                ),
                child: Center(
                  child: Text(
                    '🌰',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Names
            Text(
              date.nameAr,
              style: AppTextStyles.displayMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
            Text(
              date.nameEn,
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // Description
            Text(
              date.getDescription(Get.locale?.languageCode ?? 'ar'),
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 32),

            // Info sections
            _buildInfoSection('المنشأ', Icons.place, date.origin),
            _buildInfoSection('الطعم', Icons.restaurant, date.taste),

            const SizedBox(height: 24),

            // Nutrition info
            Text(
              tr('nutrition'),
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 12),
            
            for (final entry in date.nutrition.entries)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      entry.value,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
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

  Widget _buildInfoSection(String title, IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            '$title: ',
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}