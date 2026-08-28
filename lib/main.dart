import 'dart:io'; // 📌 플랫폼 확인용 패키지 추가
import 'package:flutter/foundation.dart'; // 📌 웹 환경 체크용 패키지 추가
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'; // 📌 광고 패키지 추가

import 'screens/title_view.dart';
import 'screens/main_screen.dart';
import 'screens/shop_view.dart';
import 'screens/settings_view.dart';
import 'screens/character_view.dart';
import 'screens/stage_select_view.dart';
import 'screens/game_play_view.dart';
import 'screens/result_view.dart';

void main() async { // 📌 비동기 처리를 위해 async 추가
  WidgetsFlutterBinding.ensureInitialized();

  // 📌 안드로이드 및 iOS 모바일 환경에서만 광고 SDK 초기화
  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
    await MobileAds.instance.initialize();
  }

  runApp(const BachikiGameApp());
}

class BachikiGameApp extends StatelessWidget {
  const BachikiGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boss Game Flow',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const TitleView(),
        '/main': (context) => const MainScreen(),
        '/shop': (context) => const ShopView(),
        '/settings': (context) => const SettingsView(),
        '/character': (context) => const CharacterView(),
        '/stageSelect': (context) => const StageSelectView(),
        '/gamePlay': (context) => const GamePlayView(),
        '/result': (context) => const ResultView(),
      },
    );
  }
}