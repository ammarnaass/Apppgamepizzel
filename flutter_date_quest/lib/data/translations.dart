import 'package:get/get.dart';

class TranslationsService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar_SA': _arabic,
    'en_US': _english,
    'fr_FR': _french,
  };

  Future<void> init() async {
    // Initialize any data loading if needed
  }

  // Arabic translations (العربية)
  static const Map<String, String> _arabic = {
    // App Title
    'app_name': 'لعبة أحجيات التمر',
    'tagline': 'تعلم التمور أثناء اللعب',
    
    // Navigation
    'home': 'الرئيسية',
    'encyclopedia': 'موسوعة التمور',
    'profile': 'الملف الشخصي',
    'settings': 'الإعدادات',
    
    // Splash Screen
    'loading': 'جاري التحميل...',
    'welcome_msg': 'مرحباً بك في عالم التمور',
    'mascot_say_hello': 'أهلاً وسهلاً! أنا حبة التمر الذكية وأنا هنا لأعلمك عن عجائب التمور!',
    
    // Onboarding
    'onboarding_skip': 'تخطي',
    'onboarding_next': 'التالي',
    'onboarding_prev': 'السابق',
    'onboarding_done': 'ابدأ اللعب',
    
    // Onboarding Slides
    'onboarding_slide1_title': 'مرحباً بك في عالم التمور! 🌴',
    'onboarding_slide1_subtitle': 'اكتشف أنواع التمور المختلفة وأصنافها من خلال ألعاب ممتعة وتفاعلية',
    
    'onboarding_slide2_title': 'تعلم بلا حدود 📚',
    'onboarding_slide2_subtitle': 'اكتشف معلومات مفيدة عن التمور: مصادرها، فوائدها، وأنواعها المختلفة',
    
    'onboarding_slide3_title': 'استمتع باللعب 🎮',
    'onboarding_slide3_subtitle': 'اختبر ذاكرتك ومعرفتك من خلال ألعاب متنوعة ومسلية',
    
    // Home Screen
    'greeting': 'مرحباً، {}',
    'total_score': 'إجمالي النقاط',
    'completed_levels': 'المستويات المكتملة',
    'achievements': 'الإنجازات',
    'play_now': 'ابدأ اللعب',
    'encyclopedia_title': 'موسوعة التمور',
    'encyclopedia_subtitle': 'اكتشف عالم التمور',
    'profile_title': 'الملف الشخصي',
    'profile_subtitle': 'إحصائياتك وإنجازاتك',
    'settings_title': 'الإعدادات',
    'settings_subtitle': 'تخصيص التطبيق',
    
    // Levels
    'select_level': 'اختر المستوى',
    'level_number': 'المستوى {}',
    'stars_earned': 'النجوم المحققة',
    'completed': 'مكتمل',
    'locked': 'مقفل',
    'next_level': 'المستوى التالي',
    'retry_level': 'إعادة المحاولة',
    'back_to_home': 'العودة للرئيسية',
    
    // Game Types
    'matching_game': 'لعبة المطابقة',
    'memory_game': 'لعبة الذاكرة',
    'guess_game': 'لعبة التخمين',
    'arrange_game': 'لعبة الترتيب',
    
    // Game Instructions
    'matching_instructions': 'اسحب وأسقط حبة التمر مع اسمها الصحيح',
    'memory_instructions': 'انقر على البطاقات لكشفها وابحث عن المطابقات',
    'guess_instructions': 'شاهد صورة حبة التمر واختر اسمها الصحيح',
    'arrange_instructions': 'رتب خطوات إنتاج التمر في التسلسل الصحيح',
    
    // Encyclopedia
    'encyclopedia_header': 'موسوعة التمور',
    'encyclopedia_subheader': 'اكتشف أنواع التمور المختلفة',
    'all': 'الكل',
    'search_hint': 'ابحث عن نوع من التمر...',
    'origin': 'المنشأ',
    'taste': 'الطعم',
    'uses': 'الاستخدامات',
    'nutrition': 'القيمة الغذائية',
    'taste_sweet': 'حلو',
    'taste_dry': 'جاف',
    'taste_soft': 'لين',
    'taste_caramel': 'كراميل',
    'uses_snacks': 'وجبات خفيفة',
    'uses_cooking': 'الطبخ',
    'uses_desserts': 'الحلويات',
    'uses_traditional': 'استخدامات تقليدية',
    'vitamin_a': 'فيتامين A',
    'vitamin_b': 'فيتامين B',
    'iron': 'الحديد',
    'fiber': 'الألياف',
    'energy': 'الطاقة',
    
    // Profile
    'my_profile': 'ملفي الشخصي',
    'player_level': 'مستوى اللاعب',
    'experience_points': 'نقاط الخبرة',
    'coins_earned': 'النقاط المجمعة',
    'games_played': 'الألعاب المُلعبة',
    'accuracy_rate': 'معدل الدقة',
    'achievements_unlocked': 'الإنجازات المُلحة',
    'achievements_locked': 'الإنجازات المغلقة',
    
    // Settings
    'app_settings': 'إعدادات التطبيق',
    'language': 'اللغة',
    'language_arabic': 'العربية',
    'language_english': 'English',
    'language_french': 'Français',
    'sound_effects': 'التأثيرات الصوتية',
    'background_music': 'الموسيقى الخلفية',
    'notifications': 'التنبيهات',
    'theme': 'المظهر',
    'theme_light': 'فاتح',
    'theme_dark': 'غامق',
    'theme_system': 'حسب النظام',
    'privacy_policy': 'سياسة الخصوصية',
    'help_support': 'المساعدة والدعم',
    'about_app': 'حول التطبيق',
    
    // Common Actions
    'back': 'رجوع',
    'next': 'التالي',
    'previous': 'السابق',
    'continue': 'متابعة',
    'cancel': 'إلغاء',
    'confirm': 'تأكيد',
    'retry': 'إعادة المحاولة',
    'ok': 'حسناً',
    'yes': 'نعم',
    'no': 'لا',
    'save': 'حفظ',
    'edit': 'تعديل',
    'delete': 'حذف',
    'share': 'مشاركة',
    'rate': 'تقييم',
    
    // Results & Feedback
    'excellent': 'ممتاز!',
    'great_job': 'عمل رائع!',
    'good_try': 'محاولة جيدة!',
    'try_again': 'حاول مرة أخرى',
    'congratulations': 'تهانينا!',
    'game_won': 'لقد فزت!',
    'game_lost': 'لقد خسرت!',
    'perfect_score': 'درجة مثالية!',
    'star_rating': '{} من 3 نجوم',
    
    // Mascot Messages
    'mascot_happy_1': 'رائع! استمر هكذا! 🌟',
    'mascot_happy_2': 'أحسنت! أنت تتعلم بسرعة! 🎉',
    'mascot_happy_3': 'ممتاز! هذا صحيح! 👏',
    'mascot_thinking_1': 'فكر جيداً... 🤔',
    'mascot_thinking_2': 'هيا، يمكنك فعلها! 💪',
    'mascot_thinking_3': 'أعطني فرصة أخرى! 😅',
    'mascot_wrong_1': 'حاول مرة أخرى! ليس بالضبط 😅',
    'mascot_wrong_2': 'لا تستسلم! التعلم يحتاج وقت! 💪',
    'mascot_wrong_3': 'الخطأ فرصة للتعلم! جرب مرة أخرى! 📚',
    'mascot_excited_1': 'واو! انتظر، المزيد من المرح! 🎈',
    'mascot_excited_2': 'هذا مذهل! أنا فخور بك! 🏆',
    'mascot_excited_3': 'استمر في التعلم! 🌱',
    
    // Date Types (These will be filled with actual data)
    'date_ajwa_name': 'العجوة',
    'date_ajwa_origin': 'المدينة المنورة، السعودية',
    'date_ajwa_taste': 'حلو وطرية',
    'date_ajwa_description': 'تُعتبر العجوة من أجود أنواع التمور، وهي ذات طعم حلو مميز وتُعرف بفوائدها الصحية الكثيرة.',
    
    'date_medjool_name': 'المجدول',
    'date_medjool_origin': 'الصحراء المغربية',
    'date_medjool_taste': 'حلو غني',
    'date_medjool_description': 'المجدول من أكبر أنواع التمور حجماً، ذو طعم حلو غني ومركز، ويتميز بلحمه الطري.',
    
    'date_sukkari_name': 'السكري',
    'date_sukkari_origin': 'نجد، السعودية',
    'date_sukkari_taste': 'حلو جداً',
    'date_sukkari_description': 'السكري من أشهر أنواع التمور السعودية، يمتاز بحلاوته العالية ونكهته المميزة.',
    
    'date_khalas_name': 'خلاص',
    'date_khalas_origin': 'الخليج العربي',
    'date_khalas_taste': 'متوازن',
    'date_khalas_description': 'خلاص من التمور التقليدية المنتشرة في منطقة الخليج، بمذاق متوازن وقوام متوسط.',
    
    'date_deri_name': 'الدرعي',
    'date_deri_origin': 'فارس، إيران',
    'date_deri_taste': 'لذيذ وعطر',
    'date_deri_description': 'الدرعي من التمور الإيرانية المشهورة، يمتاز بنكهته العطرة وقوامه اللذيذ.',
  };

  // English translations
  static const Map<String, String> _english = {
    // App Title
    'app_name': 'Date Quest Game',
    'tagline': 'Learn dates while playing',
    
    // Navigation
    'home': 'Home',
    'encyclopedia': 'Date Encyclopedia',
    'profile': 'Profile',
    'settings': 'Settings',
    
    // Splash Screen
    'loading': 'Loading...',
    'welcome_msg': 'Welcome to the world of dates',
    'mascot_say_hello': 'Hello! I\'m the smart date and I\'m here to teach you about the wonders of dates!',
    
    // Onboarding
    'onboarding_skip': 'Skip',
    'onboarding_next': 'Next',
    'onboarding_prev': 'Previous',
    'onboarding_done': 'Start Playing',
    
    // Onboarding Slides
    'onboarding_slide1_title': 'Welcome to the world of dates! 🌴',
    'onboarding_slide1_subtitle': 'Discover different types and varieties of dates through fun and interactive games',
    
    'onboarding_slide2_title': 'Learn without limits 📚',
    'onboarding_slide2_subtitle': 'Discover useful information about dates: their sources, benefits, and different types',
    
    'onboarding_slide3_title': 'Enjoy playing 🎮',
    'onboarding_slide3_subtitle': 'Test your memory and knowledge through various fun games',
    
    // Home Screen
    'greeting': 'Hello, {}',
    'total_score': 'Total Score',
    'completed_levels': 'Completed Levels',
    'achievements': 'Achievements',
    'play_now': 'Play Now',
    'encyclopedia_title': 'Date Encyclopedia',
    'encyclopedia_subtitle': 'Discover the world of dates',
    'profile_title': 'Profile',
    'profile_subtitle': 'Your stats and achievements',
    'settings_title': 'Settings',
    'settings_subtitle': 'Customize the app',
    
    // Levels
    'select_level': 'Select Level',
    'level_number': 'Level {}',
    'stars_earned': 'Stars Earned',
    'completed': 'Completed',
    'locked': 'Locked',
    'next_level': 'Next Level',
    'retry_level': 'Retry Level',
    'back_to_home': 'Back to Home',
    
    // Game Types
    'matching_game': 'Matching Game',
    'memory_game': 'Memory Game',
    'guess_game': 'Guess Game',
    'arrange_game': 'Arrange Game',
    
    // Game Instructions
    'matching_instructions': 'Drag and drop the date with its correct name',
    'memory_instructions': 'Click on cards to flip them and find matches',
    'guess_instructions': 'Look at the date image and choose its correct name',
    'arrange_instructions': 'Arrange the date production steps in the correct sequence',
    
    // Encyclopedia
    'encyclopedia_header': 'Date Encyclopedia',
    'encyclopedia_subheader': 'Discover different types of dates',
    'all': 'All',
    'search_hint': 'Search for a date type...',
    'origin': 'Origin',
    'taste': 'Taste',
    'uses': 'Uses',
    'nutrition': 'Nutrition',
    'taste_sweet': 'Sweet',
    'taste_dry': 'Dry',
    'taste_soft': 'Soft',
    'taste_caramel': 'Caramel',
    'uses_snacks': 'Snacks',
    'uses_cooking': 'Cooking',
    'uses_desserts': 'Desserts',
    'uses_traditional': 'Traditional Uses',
    'vitamin_a': 'Vitamin A',
    'vitamin_b': 'Vitamin B',
    'iron': 'Iron',
    'fiber': 'Fiber',
    'energy': 'Energy',
    
    // Profile
    'my_profile': 'My Profile',
    'player_level': 'Player Level',
    'experience_points': 'Experience Points',
    'coins_earned': 'Coins Earned',
    'games_played': 'Games Played',
    'accuracy_rate': 'Accuracy Rate',
    'achievements_unlocked': 'Unlocked Achievements',
    'achievements_locked': 'Locked Achievements',
    
    // Settings
    'app_settings': 'App Settings',
    'language': 'Language',
    'language_arabic': 'العربية',
    'language_english': 'English',
    'language_french': 'Français',
    'sound_effects': 'Sound Effects',
    'background_music': 'Background Music',
    'notifications': 'Notifications',
    'theme': 'Theme',
    'theme_light': 'Light',
    'theme_dark': 'Dark',
    'theme_system': 'System',
    'privacy_policy': 'Privacy Policy',
    'help_support': 'Help & Support',
    'about_app': 'About App',
    
    // Common Actions
    'back': 'Back',
    'next': 'Next',
    'previous': 'Previous',
    'continue': 'Continue',
    'cancel': 'Cancel',
    'confirm': 'Confirm',
    'retry': 'Retry',
    'ok': 'OK',
    'yes': 'Yes',
    'no': 'No',
    'save': 'Save',
    'edit': 'Edit',
    'delete': 'Delete',
    'share': 'Share',
    'rate': 'Rate',
    
    // Results & Feedback
    'excellent': 'Excellent!',
    'great_job': 'Great job!',
    'good_try': 'Good try!',
    'try_again': 'Try again',
    'congratulations': 'Congratulations!',
    'game_won': 'You won!',
    'game_lost': 'You lost!',
    'perfect_score': 'Perfect score!',
    'star_rating': '{} out of 3 stars',
    
    // Mascot Messages
    'mascot_happy_1': 'Great! Keep it up! 🌟',
    'mascot_happy_2': 'Well done! You\'re learning fast! 🎉',
    'mascot_happy_3': 'Excellent! That\'s correct! 👏',
    'mascot_thinking_1': 'Think carefully... 🤔',
    'mascot_thinking_2': 'Come on, you can do it! 💪',
    'mascot_thinking_3': 'Give me another chance! 😅',
    'mascot_wrong_1': 'Try again! Not quite 😅',
    'mascot_wrong_2': 'Don\'t give up! Learning takes time! 💪',
    'mascot_wrong_3': 'Mistakes are learning opportunities! Try again! 📚',
    'mascot_excited_1': 'Wow! Wait, more fun ahead! 🎈',
    'mascot_excited_2': 'This is amazing! I\'m proud of you! 🏆',
    'mascot_excited_3': 'Keep learning! 🌱',
    
    // Date Types
    'date_ajwa_name': 'Ajwa',
    'date_ajwa_origin': 'Medina, Saudi Arabia',
    'date_ajwa_taste': 'Sweet and soft',
    'date_ajwa_description': 'Ajwa is considered one of the finest types of dates, with a distinctive sweet taste and known for its many health benefits.',
    
    'date_medjool_name': 'Medjool',
    'date_medjool_origin': 'Moroccan Desert',
    'date_medjool_taste': 'Rich sweet',
    'date_medjool_description': 'Medjool is one of the largest types of dates, with a rich, concentrated sweet taste and soft flesh.',
    
    'date_sukkari_name': 'Sukkari',
    'date_sukkari_origin': 'Najd, Saudi Arabia',
    'date_sukkari_taste': 'Very sweet',
    'date_sukkari_description': 'Sukkari is one of the most famous Saudi date varieties, distinguished by its high sweetness and distinctive flavor.',
    
    'date_khalas_name': 'Khalas',
    'date_khalas_origin': 'Arabian Gulf',
    'date_khalas_taste': 'Balanced',
    'date_khalas_description': 'Khalas is one of the traditional dates spread in the Gulf region, with a balanced taste and medium texture.',
    
    'date_deri_name': 'Deri',
    'date_deri_origin': 'Fars, Iran',
    'date_deri_taste': 'Delicious and aromatic',
    'date_deri_description': 'Deri is one of the famous Iranian dates, distinguished by its aromatic flavor and delicious texture.',
  };

  // French translations
  static const Map<String, String> _french = {
    // App Title
    'app_name': 'Jeu Date Quest',
    'tagline': 'Apprenez les dattes en jouant',
    
    // Navigation
    'home': 'Accueil',
    'encyclopedia': 'Encyclopédie des Dattes',
    'profile': 'Profil',
    'settings': 'Paramètres',
    
    // Splash Screen
    'loading': 'Chargement...',
    'welcome_msg': 'Bienvenue dans le monde des dattes',
    'mascot_say_hello': 'Salut! Je suis la datte intelligente et je suis ici pour vous apprendre les merveilles des dattes!',
    
    // Onboarding
    'onboarding_skip': 'Passer',
    'onboarding_next': 'Suivant',
    'onboarding_prev': 'Précédent',
    'onboarding_done': 'Commencer à Jouer',
    
    // Onboarding Slides
    'onboarding_slide1_title': 'Bienvenue dans le monde des dattes! 🌴',
    'onboarding_slide1_subtitle': 'Découvrez différents types et variétés de dattes à travers des jeux amusants et interactifs',
    
    'onboarding_slide2_title': 'Apprendre sans limites 📚',
    'onboarding_slide2_subtitle': 'Découvrez des informations utiles sur les dattes: leurs sources, leurs bénéfices et leurs différents types',
    
    'onboarding_slide3_title': 'Profitez du jeu 🎮',
    'onboarding_slide3_subtitle': 'Testez votre mémoire et vos connaissances à travers divers jeux amusants',
    
    // Home Screen
    'greeting': 'Bonjour, {}',
    'total_score': 'Score Total',
    'completed_levels': 'Niveaux Complétés',
    'achievements': 'Réalisations',
    'play_now': 'Jouer Maintenant',
    'encyclopedia_title': 'Encyclopédie des Dattes',
    'encyclopedia_subtitle': 'Découvrez le monde des dattes',
    'profile_title': 'Profil',
    'profile_subtitle': 'Vos statistiques et réalisations',
    'settings_title': 'Paramètres',
    'settings_subtitle': 'Personnaliser l\'app',
    
    // Levels
    'select_level': 'Sélectionner le Niveau',
    'level_number': 'Niveau {}',
    'stars_earned': 'Étoiles Gagnées',
    'completed': 'Complété',
    'locked': 'Verrouillé',
    'next_level': 'Niveau Suivant',
    'retry_level': 'Réessayer le Niveau',
    'back_to_home': 'Retour à l\'Accueil',
    
    // Game Types
    'matching_game': 'Jeu de Correspondance',
    'memory_game': 'Jeu de Mémoire',
    'guess_game': 'Jeu de Devinette',
    'arrange_game': 'Jeu d\'Arrangement',
    
    // Game Instructions
    'matching_instructions': 'Glissez et déposez la datte avec son nom correct',
    'memory_instructions': 'Cliquez sur les cartes pour les retourner et trouver les correspondances',
    'guess_instructions': 'Regardez l\'image de la datte et choisissez son nom correct',
    'arrange_instructions': 'Arrangez les étapes de production des dattes dans la séquence correcte',
    
    // Encyclopedia
    'encyclopedia_header': 'Encyclopédie des Dattes',
    'encyclopedia_subheader': 'Découvrez différents types de dattes',
    'all': 'Tous',
    'search_hint': 'Rechercher un type de datte...',
    'origin': 'Origine',
    'taste': 'Goût',
    'uses': 'Utilisations',
    'nutrition': 'Nutrition',
    'taste_sweet': 'Sucré',
    'taste_dry': 'Sec',
    'taste_soft': 'Moelleux',
    'taste_caramel': 'Caramel',
    'uses_snacks': 'Collations',
    'uses_cooking': 'Cuisson',
    'uses_desserts': 'Desserts',
    'uses_traditional': 'Utilisations Traditionnelles',
    'vitamin_a': 'Vitamine A',
    'vitamin_b': 'Vitamine B',
    'iron': 'Fer',
    'fiber': 'Fibre',
    'energy': 'Énergie',
    
    // Profile
    'my_profile': 'Mon Profil',
    'player_level': 'Niveau du Joueur',
    'experience_points': 'Points d\'Expérience',
    'coins_earned': 'Pièces Gagnées',
    'games_played': 'Jeux Joués',
    'accuracy_rate': 'Taux de Précision',
    'achievements_unlocked': 'Réalisations Débloquées',
    'achievements_locked': 'Réalisations Verrouillées',
    
    // Settings
    'app_settings': 'Paramètres de l\'App',
    'language': 'Langue',
    'language_arabic': 'العربية',
    'language_english': 'English',
    'language_french': 'Français',
    'sound_effects': 'Effets Sonores',
    'background_music': 'Musique de Fond',
    'notifications': 'Notifications',
    'theme': 'Thème',
    'theme_light': 'Clair',
    'theme_dark': 'Sombre',
    'theme_system': 'Système',
    'privacy_policy': 'Politique de Confidentialité',
    'help_support': 'Aide et Support',
    'about_app': 'À Propos de l\'App',
    
    // Common Actions
    'back': 'Retour',
    'next': 'Suivant',
    'previous': 'Précédent',
    'continue': 'Continuer',
    'cancel': 'Annuler',
    'confirm': 'Confirmer',
    'retry': 'Réessayer',
    'ok': 'OK',
    'yes': 'Oui',
    'no': 'Non',
    'save': 'Sauvegarder',
    'edit': 'Modifier',
    'delete': 'Supprimer',
    'share': 'Partager',
    'rate': 'Évaluer',
    
    // Results & Feedback
    'excellent': 'Excellent!',
    'great_job': 'Bon travail!',
    'good_try': 'Bonne tentative!',
    'try_again': 'Réessayer',
    'congratulations': 'Félicitations!',
    'game_won': 'Vous avez gagné!',
    'game_lost': 'Vous avez perdu!',
    'perfect_score': 'Score parfait!',
    'star_rating': '{} sur 3 étoiles',
    
    // Mascot Messages
    'mascot_happy_1': 'Super! Continuez ainsi! 🌟',
    'mascot_happy_2': 'Bien joué! Vous apprenez vite! 🎉',
    'mascot_happy_3': 'Excellent! C\'est correct! 👏',
    'mascot_thinking_1': 'Réfléchissez bien... 🤔',
    'mascot_thinking_2': 'Allez, vous pouvez y arriver! 💪',
    'mascot_thinking_3': 'Donnez-moi une autre chance! 😅',
    'mascot_wrong_1': 'Réessayez! Pas tout à fait 😅',
    'mascot_wrong_2': 'N\'abandonnez pas! Apprendre prend du temps! 💪',
    'mascot_wrong_3': 'Les erreurs sont des opportunités d\'apprentissage! Réessayez! 📚',
    'mascot_excited_1': 'Waouh! Attendez, plus de diversión à venir! 🎈',
    'mascot_excited_2': 'C\'est incroyable! Je suis fier de vous! 🏆',
    'mascot_excited_3': 'Continuez à apprendre! 🌱',
    
    // Date Types
    'date_ajwa_name': 'Ajwa',
    'date_ajwa_origin': 'Médine, Arabie Saoudite',
    'date_ajwa_taste': 'Sucré et tendre',
    'date_ajwa_description': 'L\'Ajwa est considéré comme l\'un des meilleurs types de dattes, avec un goût sucré distinctif et connu pour ses nombreux bénéfices pour la santé.',
    
    'date_medjool_name': 'Medjool',
    'date_medjool_origin': 'Désert Marocain',
    'date_medjool_taste': 'Sucré riche',
    'date_medjool_description': 'La Medjool est l\'un des plus grands types de dattes, avec un goût sucré riche et concentré et une chair tendre.',
    
    'date_sukkari_name': 'Sukkari',
    'date_sukkari_origin': 'Najd, Arabie Saoudite',
    'date_sukkari_taste': 'Très sucré',
    'date_sukkari_description': 'La Sukkari est l\'une des variétés de dattes saoudiennes les plus célèbres, distinguée par sa douceur élevée et sa saveur distinctive.',
    
    'date_khalas_name': 'Khalas',
    'date_khalas_origin': 'Golfe Arabique',
    'date_khalas_taste': 'Équilibré',
    'date_khalas_description': 'La Khalas est l\'une des dattes traditionnelles répandues dans la région du Golfe, avec un goût équilibré et une texture moyenne.',
    
    'date_deri_name': 'Deri',
    'date_deri_origin': 'Fars, Iran',
    'date_deri_taste': 'Délicieux et aromatique',
    'date_deri_description': 'La Deri est l\'une des dattes iraniennes célèbres, distinguée par sa saveur aromatique et sa texture délicieux.',
  };
}