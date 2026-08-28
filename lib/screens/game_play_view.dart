import 'package:flutter/material.dart';
import 'pause_overlay.dart'; // 일시정지 오버레이 임포트 추가

class GamePlayView extends StatelessWidget {
  const GamePlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('8. GamePlayView'),
        actions: [
          // 상단 앱바에 일시정지 버튼 배치
          IconButton(
            icon: const Icon(Icons.pause),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const PauseOverlay(),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('인게임 보스전 진행 중...', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/result');
              },
              child: const Text('게임 승리/패배 발생 (9. ResultView로 이동)'),
            ),
          ], // <-- children 리스트 마감 위치
        ),
      ),
    );
  }
}