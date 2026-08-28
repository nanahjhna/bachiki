import 'package:flutter/material.dart';

class LobbyTab extends StatelessWidget {
  const LobbyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('3. Lobby', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/character');
            },
            child: const Text('캐릭터 / 퍽 변경 (6. CharacterView)'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/stageSelect');
            },
            child: const Text('STAGE BATTLE (7. StageSelectView)'),
          ),
        ],
      ),
    );
  }
}