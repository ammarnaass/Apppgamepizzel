import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';

// Mascot emotions for different states
enum MascotEmotion {
  happy,
  sad,
  thinking,
  excited,
  wrong,
  correct,
  waving,
  celebrating
}

class MascotWidget extends StatefulWidget {
  final MascotEmotion emotion;
  final double size;
  final bool animated;
  final VoidCallback? onTap;
  final String? message;

  const MascotWidget({
    super.key,
    required this.emotion,
    this.size = 100,
    this.animated = true,
    this.onTap,
    this.message,
  });

  @override
  State<MascotWidget> createState() => _MascotWidgetState();
}

class _MascotWidgetState extends State<MascotWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    
    if (widget.animated) {
      _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );
      
      _bounceAnimation = Tween<double>(
        begin: 0.0,
        end: 10.0,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ),
      );
      
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    if (widget.animated) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _bounceAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, widget.animated ? -_bounceAnimation.value : 0),
            child: _buildMascot(),
          );
        },
      ),
    );
  }

  Widget _buildMascot() {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryLight,
            AppColors.primary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main date character
          Positioned.fill(
            child: CustomPaint(
              painter: DateMascotPainter(widget.emotion),
            ),
          ),
          
          // Eyes
          _buildEyes(),
          
          // Mouth
          _buildMouth(),
          
          // Hat
          _buildHat(),
          
          // Accessories based on emotion
          if (widget.emotion == MascotEmotion.thinking) _buildThinkingClouds(),
          if (widget.emotion == MascotEmotion.excited || widget.emotion == MascotEmotion.celebrating) _buildSparkles(),
        ],
      ),
    );
  }

  Widget _buildEyes() {
    final eyeSize = widget.size * 0.08;
    final eyeOffset = widget.size * 0.25;
    
    return Stack(
      children: [
        // Left eye
        Positioned(
          left: widget.size / 2 - eyeOffset,
          top: widget.size * 0.3,
          child: _buildEye(eyeSize),
        ),
        // Right eye
        Positioned(
          left: widget.size / 2 + eyeOffset - eyeSize,
          top: widget.size * 0.3,
          child: _buildEye(eyeSize),
        ),
      ],
    );
  }

  Widget _buildEye(double size) {
    Color eyeColor;
    double pupilOffset = 0;
    
    switch (widget.emotion) {
      case MascotEmotion.sad:
        eyeColor = AppColors.primaryDark;
        break;
      case MascotEmotion.thinking:
        eyeColor = AppColors.secondary;
        pupilOffset = size * 0.2;
        break;
      case MascotEmotion.excited:
      case MascotEmotion.happy:
      case MascotEmotion.celebrating:
        eyeColor = AppColors.black;
        break;
      default:
        eyeColor = AppColors.black;
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow.withOpacity(0.3),
            blurRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: size * 0.6,
          height: size * 0.6,
          decoration: BoxDecoration(
            color: eyeColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMouth() {
    switch (widget.emotion) {
      case MascotEmotion.happy:
      case MascotEmotion.excited:
      case MascotEmotion.celebrating:
        return Positioned(
          left: widget.size / 2 - widget.size * 0.15,
          top: widget.size * 0.65,
          child: Container(
            width: widget.size * 0.3,
            height: widget.size * 0.15,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(widget.size * 0.1),
            ),
          ),
        );
      
      case MascotEmotion.sad:
      case MascotEmotion.wrong:
        return Positioned(
          left: widget.size / 2 - widget.size * 0.15,
          top: widget.size * 0.7,
          child: Transform.rotate(
            angle: 3.14159,
            child: Container(
              width: widget.size * 0.3,
              height: widget.size * 0.15,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(widget.size * 0.1),
              ),
            ),
          ),
        );
      
      case MascotEmotion.thinking:
        return Positioned(
          left: widget.size / 2 - widget.size * 0.05,
          top: widget.size * 0.68,
          child: Container(
            width: widget.size * 0.1,
            height: widget.size * 0.1,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
          ),
        );
      
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildHat() {
    if (widget.emotion == MascotEmotion.thinking) {
      return Positioned(
        left: widget.size / 2 - widget.size * 0.4,
        top: -widget.size * 0.1,
        child: Container(
          width: widget.size * 0.8,
          height: widget.size * 0.25,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.size * 0.4),
              topRight: Radius.circular(widget.size * 0.4),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      );
    }
    
    return Positioned(
      left: widget.size / 2 - widget.size * 0.35,
      top: -widget.size * 0.05,
      child: Container(
        width: widget.size * 0.7,
        height: widget.size * 0.2,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.size * 0.3),
            topRight: Radius.circular(widget.size * 0.3),
          ),
        ),
        child: Center(
          child: Container(
            width: widget.size * 0.15,
            height: widget.size * 0.15,
            decoration: BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThinkingClouds() {
    return Positioned(
      right: -widget.size * 0.2,
      top: -widget.size * 0.1,
      child: Column(
        children: [
          _buildCloud(widget.size * 0.2),
          _buildCloud(widget.size * 0.15),
        ],
      ),
    );
  }

  Widget _buildCloud(double size) {
    return Container(
      width: size,
      height: size * 0.6,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(size * 0.3),
      ),
      margin: EdgeInsets.only(bottom: size * 0.1),
    );
  }

  Widget _buildSparkles() {
    final sparkles = <Widget>[];
    final positions = [
      Offset(widget.size * 0.2, widget.size * 0.2),
      Offset(widget.size * 0.8, widget.size * 0.3),
      Offset(widget.size * 0.1, widget.size * 0.7),
      Offset(widget.size * 0.9, widget.size * 0.7),
    ];
    
    for (int i = 0; i < positions.length; i++) {
      sparkles.add(
        Positioned(
          left: positions[i].dx,
          top: positions[i].dy,
          child: Icon(
            Icons.star,
            size: widget.size * 0.15,
            color: AppColors.accent,
          ).animate(
            onPlay: (controller) => controller.repeat(),
          ).rotate(
            duration: const Duration(seconds: 2),
          ).scale(
            delay: Duration(milliseconds: i * 200),
          ),
        ),
      );
    }
    
    return Stack(children: sparkles);
  }
}

// Custom painter for the date mascot shape
class DateMascotPainter extends CustomPainter {
  final MascotEmotion emotion;

  DateMascotPainter(this.emotion);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    // Draw oval date shape
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(
      center: center,
      width: size.width * 0.8,
      height: size.height * 1.1,
    );
    
    canvas.drawOval(rect, paint);

    // Add subtle shading
    final shadingPaint = Paint()
      ..color = AppColors.primaryDark.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final shadingRect = Rect.fromCenter(
      center: center + Offset(size.width * 0.1, size.height * 0.1),
      width: size.width * 0.6,
      height: size.height * 0.8,
    );
    
    canvas.drawOval(shadingRect, shadingPaint);

    // Add some texture lines
    final texturePaint = Paint()
      ..color = AppColors.primaryLight.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 0; i < 3; i++) {
      final offset = Offset(size.width * 0.2, size.height * 0.3 + i * size.height * 0.1);
      canvas.drawLine(
        offset,
        offset + Offset(size.width * 0.6, 0),
        texturePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}