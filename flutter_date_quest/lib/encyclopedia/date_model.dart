import 'package:flutter/material.dart';

class DateVariety {
  final int id;
  final String nameAr;
  final String nameEn;
  final String nameFr;
  final String origin;
  final String taste;
  final Color color;
  final String descriptionAr;
  final String descriptionEn;
  final String descriptionFr;
  final String imagePath;
  final List<String> uses;
  final Map<String, String> nutrition;
  final List<String> facts;
  final int difficultyLevel;

  const DateVariety({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.nameFr,
    required this.origin,
    required this.taste,
    required this.color,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.descriptionFr,
    required this.imagePath,
    required this.uses,
    required this.nutrition,
    required this.facts,
    required this.difficultyLevel,
  });

  factory DateVariety.fromJson(Map<String, dynamic> json) {
    return DateVariety(
      id: json['id'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
      nameFr: json['nameFr'],
      origin: json['origin'],
      taste: json['taste'],
      color: Color(int.parse(json['color'].replaceAll('#', '0xFF'))),
      descriptionAr: json['descriptionAr'],
      descriptionEn: json['descriptionEn'],
      descriptionFr: json['descriptionFr'],
      imagePath: json['imagePath'],
      uses: List<String>.from(json['uses']),
      nutrition: Map<String, String>.from(json['nutrition']),
      facts: List<String>.from(json['facts']),
      difficultyLevel: json['difficultyLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameAr': nameAr,
      'nameEn': nameEn,
      'nameFr': nameFr,
      'origin': origin,
      'taste': taste,
      'color': color.value.toString(),
      'descriptionAr': descriptionAr,
      'descriptionEn': descriptionEn,
      'descriptionFr': descriptionFr,
      'imagePath': imagePath,
      'uses': uses,
      'nutrition': nutrition,
      'facts': facts,
      'difficultyLevel': difficultyLevel,
    };
  }

  String getName(String locale) {
    switch (locale) {
      case 'ar':
        return nameAr;
      case 'fr':
        return nameFr;
      default:
        return nameEn;
    }
  }

  String getDescription(String locale) {
    switch (locale) {
      case 'ar':
        return descriptionAr;
      case 'fr':
        return descriptionFr;
      default:
        return descriptionEn;
    }
  }
}

class DateVarieties {
  static const List<DateVariety> varieties = [
    DateVariety(
      id: 1,
      nameAr: 'العجوة',
      nameEn: 'Ajwa',
      nameFr: 'Ajwa',
      origin: 'Medina, Saudi Arabia',
      taste: 'Sweet and soft',
      color: Color(0xFF8B4513),
      descriptionAr: 'تُعتبر العجوة من أجود أنواع التمور، وهي ذات طعم حلو مميز وتُعرف بفوائدها الصحية الكثيرة. تنمو في المدينة المنورة ولها مكانة دينية خاصة.',
      descriptionEn: 'Ajwa is considered one of the finest types of dates, with a distinctive sweet taste and known for its many health benefits. It grows in Medina and has special religious significance.',
      descriptionFr: 'L\'Ajwa est considéré comme l\'un des meilleurs types de dattes, avec un goût sucré distinctif et connu pour ses nombreux bénéfices pour la santé. Il pousse à Médine et a une signification religieuse spéciale.',
      imagePath: 'assets/images/dates/ajwa.png',
      uses: ['Health benefits', 'Religious significance', 'Premium snacks'],
      nutrition: {
        'Calories': '277 kcal',
        'Carbs': '75g',
        'Fiber': '6g',
        'Potassium': '656mg',
        'Magnesium': '43mg',
        'Vitamin B6': '0.2mg'
      },
      facts: [
        'Grows only in Medina',
        'Mentioned in Islamic texts',
        'High antioxidant content',
        'Natural energy booster'
      ],
      difficultyLevel: 1,
    ),
    DateVariety(
      id: 2,
      nameAr: 'المجدول',
      nameEn: 'Medjool',
      nameFr: 'Medjool',
      origin: 'Moroccan Desert',
      taste: 'Rich sweet',
      color: Color(0xFFA0522D),
      descriptionAr: 'المجدول من أكبر أنواع التمور حجماً، ذو طعم حلو غني ومركز، ويتميز بلحمه الطري. يُعتبر ملك التمور.',
      descriptionEn: 'Medjool is one of the largest types of dates, with a rich, concentrated sweet taste and soft flesh. It\'s known as the king of dates.',
      descriptionFr: 'La Medjool est l\'un des plus grands types de dattes, avec un goût sucré riche et concentré et une chair tendre. Il est connu comme le roi des dattes.',
      imagePath: 'assets/images/dates/medjool.png',
      uses: ['Premium snacking', 'Baking', 'Natural sweetener'],
      nutrition: {
        'Calories': '282 kcal',
        'Carbs': '75g',
        'Fiber': '6g',
        'Potassium': '656mg',
        'Calcium': '39mg',
        'Iron': '1mg'
      },
      facts: [
        'Known as the "king of dates"',
        'Originated in Morocco',
        'Large size with soft texture',
        'High in natural sugars'
      ],
      difficultyLevel: 2,
    ),
    DateVariety(
      id: 3,
      nameAr: 'السكري',
      nameEn: 'Sukkari',
      nameFr: 'Sukkari',
      origin: 'Najd, Saudi Arabia',
      taste: 'Very sweet',
      color: Color(0xFFD2691E),
      descriptionAr: 'السكري من أشهر أنواع التمور السعودية، يمتاز بحلاوته العالية ونكهته المميزة. يتميز بلونه الذهبي الجميل.',
      descriptionEn: 'Sukkari is one of the most famous Saudi date varieties, distinguished by its high sweetness and distinctive flavor. It features a beautiful golden color.',
      descriptionFr: 'La Sukkari est l\'une des variétés de dattes saoudiennes les plus célèbres, distinguée par sa douceur élevée et sa saveur distinctive. Elle présente une belle couleur dorée.',
      imagePath: 'assets/images/dates/sukkari.png',
      uses: ['Traditional sweets', 'Honey substitute', 'Cultural ceremonies'],
      nutrition: {
        'Calories': '282 kcal',
        'Carbs': '75g',
        'Fiber': '6g',
        'Potassium': '656mg',
        'Magnesium': '43mg',
        'Vitamin B1': '0.1mg'
      },
      facts: [
        'Golden color when ripe',
        'Very high sugar content',
        'Traditional Saudi variety',
        'Used in traditional sweets'
      ],
      difficultyLevel: 1,
    ),
    DateVariety(
      id: 4,
      nameAr: 'خلاص',
      nameEn: 'Khalas',
      nameFr: 'Khalas',
      origin: 'Arabian Gulf',
      taste: 'Balanced',
      color: Color(0xFFCD853F),
      descriptionAr: 'خلاص من التمور التقليدية المنتشرة في منطقة الخليج، بمذاق متوازن وقوام متوسط. شائعة جداً في الإمارات والكويت.',
      descriptionEn: 'Khalas is one of the traditional dates spread in the Gulf region, with a balanced taste and medium texture. Very common in UAE and Kuwait.',
      descriptionFr: 'La Khalas est l\'une des dattes traditionnelles répandues dans la région du Golfe, avec un goût équilibré et une texture moyenne. Très commune aux EAU et au Koweït.',
      imagePath: 'assets/images/dates/khalas.png',
      uses: ['Daily consumption', 'Gulf cuisine', 'Local markets'],
      nutrition: {
        'Calories': '275 kcal',
        'Carbs': '73g',
        'Fiber': '5g',
        'Potassium': '650mg',
        'Calcium': '35mg',
        'Phosphorus': '45mg'
      },
      facts: [
        'Traditional Gulf variety',
        'Balanced sweetness',
        'Medium texture',
        'Widely available'
      ],
      difficultyLevel: 2,
    ),
    DateVariety(
      id: 5,
      nameAr: 'الدرعي',
      nameEn: 'Deri',
      nameFr: 'Deri',
      origin: 'Fars, Iran',
      taste: 'Delicious and aromatic',
      color: Color(0xFF8B4513),
      descriptionAr: 'الدرعي من التمور الإيرانية المشهورة، يمتاز بنكهته العطرة وقوامه اللذيذ. من أجود أنواع التمور الفارسية.',
      descriptionEn: 'Deri is one of the famous Iranian dates, distinguished by its aromatic flavor and delicious texture. One of the finest Persian date varieties.',
      descriptionFr: 'La Deri est l\'une des dattes iraniennes célèbres, distinguée par sa saveur aromatique et sa texture délicieux. L\'une des meilleures variétés de dattes persanes.',
      imagePath: 'assets/images/dates/deri.png',
      uses: ['Premium gifts', 'Traditional medicine', 'Luxury snacks'],
      nutrition: {
        'Calories': '280 kcal',
        'Carbs': '74g',
        'Fiber': '6g',
        'Potassium': '660mg',
        'Magnesium': '44mg',
        'Vitamin C': '2mg'
      },
      facts: [
        'Persian premium variety',
        'Distinctive aromatic flavor',
        'Medium-large size',
        'Traditional medicine uses'
      ],
      difficultyLevel: 3,
    ),
    DateVariety(
      id: 6,
      nameAr: 'الزغلول',
      nameEn: 'Zaghloul',
      nameFr: 'Zaghloul',
      origin: 'Egypt',
      taste: 'Caramel-like',
      color: Color(0xFFA0522D),
      descriptionAr: 'الزغلول من التمور المصرية الأصيلة، يمتاز بنكهة الكراميل المميزة وقوامه اللين. من أجود أنواع التمور المصرية.',
      descriptionEn: 'Zaghloul is an authentic Egyptian date variety, distinguished by its distinctive caramel flavor and soft texture. One of the finest Egyptian date varieties.',
      descriptionFr: 'La Zaghloul est une variété de datte égyptienne authentique, distinguée par sa saveur caramel distincte et sa texture tendre. L\'une des meilleures variétés de dattes égyptiennes.',
      imagePath: 'assets/images/dates/zaghloul.png',
      uses: ['Traditional Egyptian sweets', 'Caramel substitute', 'Special occasions'],
      nutrition: {
        'Calories': '278 kcal',
        'Carbs': '74g',
        'Fiber': '6g',
        'Potassium': '654mg',
        'Calcium': '38mg',
        'Vitamin A': '3μg'
      },
      facts: [
        'Egyptian premium variety',
        'Caramel-like flavor',
        'Soft, chewy texture',
        'Used in Egyptian sweets'
      ],
      difficultyLevel: 3,
    ),
  ];

  static List<DateVariety> getByDifficulty(int level) {
    return varieties.where((date) => date.difficultyLevel <= level).toList();
  }

  static DateVariety getById(int id) {
    return varieties.firstWhere((date) => date.id == id);
  }

  static List<DateVariety> search(String query) {
    return varieties.where((date) => 
      date.nameAr.toLowerCase().contains(query.toLowerCase()) ||
      date.nameEn.toLowerCase().contains(query.toLowerCase()) ||
      date.nameFr.toLowerCase().contains(query.toLowerCase()) ||
      date.origin.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}