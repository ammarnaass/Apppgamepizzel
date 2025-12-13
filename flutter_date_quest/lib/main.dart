import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'data/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize app dependencies
  await Get.putAsync(() => TranslationsService().init());
  
  runApp(DateQuestApp());
}