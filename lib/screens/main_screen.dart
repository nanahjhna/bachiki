import 'package:flutter/material.dart';
import 'lobby_tab.dart';
import 'shop_view.dart';
import 'settings_view.dart';
import 'inventory_view.dart';
import 'character_view.dart';
import '../utils/app_texts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const LobbyTab(),
    const InventoryView(embedded: true),
    const ShopView(),
    const CharacterView(embedded: true),
    const SettingsView(embedded: true),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.get('mainTitle')),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: _showLanguageDialog,
            tooltip: AppTexts.get('language'),
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _tabs),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF1B183B), // 배경색을 어두운 테마와 맞추어 통일
        type: BottomNavigationBarType.fixed, // 아이템이 4개 이상일 때 색상 유지를 위해 고정형 사용
        selectedItemColor: const Color(0xFFFFD166), // 선택된 아이콘/텍스트는 강조 노란색
        unselectedItemColor: Colors.white70, // 선택되지 않은 아이콘/텍스트는 잘 보이도록 밝은 흰색 계열로 지정
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: AppTexts.get('lobby')),
          const BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Inventory'),
          BottomNavigationBarItem(icon: const Icon(Icons.shopping_bag), label: AppTexts.get('shop')),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: AppTexts.get('character')),
          BottomNavigationBarItem(icon: const Icon(Icons.settings), label: AppTexts.get('settings')),
        ],
      ),
    );
  }
}