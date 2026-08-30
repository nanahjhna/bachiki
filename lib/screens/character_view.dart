import 'package:flutter/material.dart';
import '../widgets/game_bottom_navigation.dart';
import '../widgets/game_header.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({super.key, this.embedded = false});
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Spacer(),
          const Icon(Icons.person, size: 150, color: Color(0xFF69B8FF)),
          const Text('Blue Striker', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          const Text('Lv. 3  •  Power 120'),
          const SizedBox(height: 16),
          const Align(alignment: Alignment.centerLeft, child: Text('캐릭터 소개', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
          const SizedBox(height: 6),
          const Text('빠른 연속 공격으로 보스의 빈틈을 파고드는 근접 전사입니다.'),
          const SizedBox(height: 12),
          const Align(alignment: Alignment.centerLeft, child: Text('스킬: Quick Strike · 공격력 120 · 방어력 80 · 속도 95')),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('EQUIPPED PERKS', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Expanded(child: _Perk(icon: Icons.flash_on, name: 'Quick Strike')),
              SizedBox(width: 10),
              Expanded(child: _Perk(icon: Icons.favorite, name: 'Vitality')),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/inventory'),
              child: const Text('INVENTORY'),
            ),
          ),
        ],
      ),
    );

    return embedded
        ? content
        : Scaffold(
      appBar: const GameHeader(titleKey: 'character'),
      body: content,
      bottomNavigationBar: const GameBottomNavigation(currentIndex: 3),
    );
  }
}

class _Perk extends StatelessWidget {
  const _Perk({required this.icon, required this.name});
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFFFD166)),
          const SizedBox(height: 8),
          Text(name),
        ],
      ),
    ),
  );
}
