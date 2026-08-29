import 'package:flutter/material.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({super.key, this.embedded = false});
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('Blue Striker', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          const Text('Lv. 3  •  Power 120'),
          const SizedBox(height: 24),
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
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('캐릭터와 퍽이 저장되었습니다.')),
                );
              },
              child: const Text('CONFIRM'),
            ),
          ),
        ],
      ),
    );

    return embedded
        ? content
        : Scaffold(
      appBar: AppBar(title: const Text('CHARACTER')),
      body: content,
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