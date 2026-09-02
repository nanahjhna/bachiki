import 'package:flutter/material.dart';
import '../utils/app_texts.dart';
import '../widgets/game_bottom_navigation.dart';
import '../widgets/game_header.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({super.key, this.embedded = false});
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      top: embedded,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),
            const Icon(Icons.person, size: 150, color: Color(0xFF69B8FF)),
            Text(
              AppTexts.get('characterName'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 6),
            Text('${AppTexts.get('level')} 3  •  ${AppTexts.get('power')} 120'),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppTexts.get('characterIntro'),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 6),
            Text(AppTexts.get('characterDesc')),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${AppTexts.get('skill')}: ${AppTexts.get('quickStrike')} · ${AppTexts.get('statAtk')} 120 · ${AppTexts.get('statDef')} 80 · ${AppTexts.get('statSpd')} 95',
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppTexts.get('equippedPerks'),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _Perk(icon: Icons.flash_on, name: AppTexts.get('quickStrike'))),
                const SizedBox(width: 10),
                Expanded(child: _Perk(icon: Icons.favorite, name: AppTexts.get('vitality'))),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/inventory'),
                child: Text(AppTexts.get('inventory')),
              ),
            ),
          ],
        ),
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
