import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../characters/mascot_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../data/translations.dart';
import '../../utils/router.dart';

class GameController extends GetxController {
  final gameType = ''.obs;
  final currentLevel = 1.obs;
  final score = 0.obs;
  final lives = 3.obs;
  final isGameActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>? ?? {};
    gameType.value = arguments['gameType'] ?? 'matching';
    currentLevel.value = arguments['level'] ?? 1;
  }

  void startGame() {
    isGameActive.value = true;
    score.value = 0;
    lives.value = 3;
  }

  void endGame() {
    isGameActive.value = false;
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      init: GameController(),
      builder: (controller) {
        final gameType = controller.gameType.value;
        
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              children: [
                _buildGameHeader(controller),
                Expanded(
                  child: _buildGameContent(gameType, controller),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGameHeader(GameController controller) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
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
          IconButton(
            onPressed: () => AppRoutes.back(),
            icon: const Icon(Icons.arrow_back, color: AppColors.white),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getGameTitle(controller.gameType.value),
                  style: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
                ),
                Text(
                  'المستوى ${controller.currentLevel.value}',
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.white.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.stars, color: AppColors.white, size: 16),
                const SizedBox(width: 4),
                Text(
                  controller.score.value.toString(),
                  style: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: List.generate(controller.lives.value, (index) {
              return Icon(Icons.favorite, color: AppColors.error, size: 20);
            }),
          ),
        ],
      ),
    );
  }

  String _getGameTitle(String gameType) {
    switch (gameType) {
      case 'matching': return tr('matching_game');
      case 'memory': return tr('memory_game');
      case 'guess': return tr('guess_game');
      case 'arrange': return tr('arrange_game');
      default: return 'لعبة';
    }
  }

  Widget _buildGameContent(String gameType, GameController controller) {
    if (!controller.isGameActive.value) {
      return _buildGameStartScreen(controller);
    }

    switch (gameType) {
      case 'matching': return const MatchingGameScreen();
      case 'memory': return const MemoryGameScreen();
      case 'guess': return const GuessGameScreen();
      case 'arrange': return const ArrangeGameScreen();
      default: return const MatchingGameScreen();
    }
  }

  Widget _buildGameStartScreen(GameController controller) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MascotWidget(emotion: MascotEmotion.happy, size: 120, animated: true),
          const SizedBox(height: 32),
          Text(
            _getGameTitle(controller.gameType.value),
            style: AppTextStyles.displayMedium.copyWith(color: AppColors.primary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Text(
              _getGameInstructions(controller.gameType.value),
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: controller.startGame,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(tr('play_now'), style: AppTextStyles.buttonLarge.copyWith(color: AppColors.white)),
          ),
        ],
      ),
    );
  }

  String _getGameInstructions(String gameType) {
    switch (gameType) {
      case 'matching': return tr('matching_instructions');
      case 'memory': return tr('memory_instructions');
      case 'guess': return tr('guess_instructions');
      case 'arrange': return tr('arrange_instructions');
      default: return 'تعلم التمور من خلال الألعاب المختلفة!';
    }
  }
}

// Game screen placeholders
class MatchingGameScreen extends StatelessWidget {
  const MatchingGameScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: const Center(child: Text('لعبة المطابقة\n(قريباً)', style: TextStyle(fontSize: 24, color: AppColors.textSecondary), textAlign: TextAlign.center)),
    );
  }
}

class MemoryGameScreen extends StatelessWidget {
  const MemoryGameScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.background, child: const Center(child: Text('لعبة الذاكرة\n(قريباً)', style: TextStyle(fontSize: 24, color: AppColors.textSecondary), textAlign: TextAlign.center)));
  }
}

class GuessGameScreen extends StatelessWidget {
  const GuessGameScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.background, child: const Center(child: Text('لعبة التخمين\n(قريباً)', style: TextStyle(fontSize: 24, color: AppColors.textSecondary), textAlign: TextAlign.center)));
  }
}

class ArrangeGameScreen extends StatelessWidget {
  const ArrangeGameScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.background, child: const Center(child: Text('لعبة الترتيب\n(قريباً)', style: TextStyle(fontSize: 24, color: AppColors.textSecondary), textAlign: TextAlign.center)));
  }
}