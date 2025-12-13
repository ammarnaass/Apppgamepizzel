import 'package:get/get.dart';

import '../features/splash/splash_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/home/home_screen.dart';
import '../features/encyclopedia/encyclopedia_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/game/game_screen.dart';

class AppRoutes {
  AppRoutes._();

  // Route names
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String encyclopedia = '/encyclopedia';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String game = '/game';
  
  // Game specific routes
  static const String memoryGame = '/game/memory';
  static const String matchingGame = '/game/matching';
  static const String guessGame = '/game/guess';
  static const String arrangeGame = '/game/arrange';
  
  // Encyclopedia detail routes
  static const String dateDetail = '/encyclopedia/date';

  // GetX pages list
  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: onboarding,
      page: () => const OnboardingScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: encyclopedia,
      page: () => const EncyclopediaScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: settings,
      page: () => const SettingsScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: game,
      page: () => const GameScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
      children: [
        GetPage(
          name: memoryGame,
          page: () => const MemoryGameScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: matchingGame,
          page: () => const MatchingGameScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: guessGame,
          page: () => const GuessGameScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: arrangeGame,
          page: () => const ArrangeGameScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
      ],
    ),
    GetPage(
      name: dateDetail,
      page: () => const DateDetailScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
  
  // Navigation helper methods
  static Future<void> toHome() => Get.offAllNamed(home);
  
  static Future<void> toEncyclopedia() => Get.toNamed(encyclopedia);
  
  static Future<void> toProfile() => Get.toNamed(profile);
  
  static Future<void> toSettings() => Get.toNamed(settings);
  
  static Future<void> toGame(String gameType, {Map<String, dynamic>? arguments}) => 
      Get.toNamed(game, arguments: {'gameType': gameType, ...?arguments});
  
  static Future<void> toMemoryGame({Map<String, dynamic>? arguments}) => 
      Get.toNamed(memoryGame, arguments: arguments);
      
  static Future<void> toMatchingGame({Map<String, dynamic>? arguments}) => 
      Get.toNamed(matchingGame, arguments: arguments);
      
  static Future<void> toGuessGame({Map<String, dynamic>? arguments}) => 
      Get.toNamed(guessGame, arguments: arguments);
      
  static Future<void> toArrangeGame({Map<String, dynamic>? arguments}) => 
      Get.toNamed(arrangeGame, arguments: arguments);
  
  static Future<void> toDateDetail(int dateId) => 
      Get.toNamed(dateDetail, arguments: {'dateId': dateId});
      
  static void back() => Get.back();
  
  static Future<void> toOnboarding() => Get.offAllNamed(onboarding);
}

// Navigation service for better management
class NavigationService extends GetxService {
  static NavigationService get to => Get.find<NavigationService>();
  
  // Observable for tracking current route
  final currentRoute = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Track route changes
    Get.routeObserver.addListener(RouteSettings(
      name: currentRoute.value,
    ));
  }
  
  // Navigate to specific route with optional parameters
  Future<T?> navigateTo<T>(String routeName, {Map<String, dynamic>? arguments}) {
    currentRoute.value = routeName;
    return Get.toNamed(routeName, arguments: arguments);
  }
  
  // Navigate to replacement route
  Future<T?> navigateReplacement<T>(String routeName, {Map<String, dynamic>? arguments}) {
    currentRoute.value = routeName;
    return Get.offNamed(routeName, arguments: arguments);
  }
  
  // Navigate and clear all previous routes
  Future<T?> navigateAndClearStack<T>(String routeName, {Map<String, dynamic>? arguments}) {
    currentRoute.value = routeName;
    return Get.offAllNamed(routeName, arguments: arguments);
  }
  
  // Go back to previous screen
  void goBack() => Get.back();
  
  // Check if current route matches given route
  bool isCurrentRoute(String routeName) {
    return Get.currentRoute == routeName;
  }
  
  // Get current page arguments
  Map<String, dynamic>? get currentArguments {
    return Get.arguments as Map<String, dynamic>?;
  }
  
  // Check if current screen is main navigation screen
  bool get isOnMainScreen {
    return isCurrentRoute(AppRoutes.home) ||
           isCurrentRoute(AppRoutes.encyclopedia) ||
           isCurrentRoute(AppRoutes.profile) ||
           isCurrentRoute(AppRoutes.settings);
  }
}