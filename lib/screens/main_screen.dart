import 'package:flutter/material.dart';
import 'lobby_tab.dart';
import 'shop_view.dart';
import 'settings_view.dart';
import 'inventory_view.dart';
import 'character_view.dart';
import '../utils/app_texts.dart';
import '../widgets/game_header.dart';
import '../widgets/game_bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List<Widget> get _tabs => const [
    LobbyTab(), InventoryView(embedded: true), ShopView(embedded: true), CharacterView(embedded: true), SettingsView(embedded: true),
  ];

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF283593),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          '${AppTexts.get('language')} / Language',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLangButton(ctx, '한국어'),
            const SizedBox(height: 8),
            _buildLangButton(ctx, 'English'),
            const SizedBox(height: 8),
            _buildLangButton(ctx, '日本語'),
          ],
        ),
      ),
    );
  }

  Widget _buildLangButton(BuildContext ctx, String langName) {
    bool isSelected = AppTexts.currentLang == langName;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.amber : Colors.white.withOpacity(0.1),
          foregroundColor: isSelected ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        onPressed: () async {
          await AppTexts.setLanguage(langName);
          setState(() {});
          Navigator.pop(ctx);
        },
        child: Text(
          langName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppTexts.languageNotifier,
      builder: (context, _, __) => Scaffold(
      appBar: const GameHeader(titleKey: 'mainTitle'),
      body: KeyedSubtree(key: ValueKey(AppTexts.currentLang), child: IndexedStack(index: _currentIndex, children: _tabs)),
      bottomNavigationBar: GameBottomNavigation(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      ),
    );
  }
}
