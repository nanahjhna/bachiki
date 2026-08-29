import 'package:flutter/material.dart';

class PauseOverlay extends StatelessWidget {
  const PauseOverlay({super.key, this.onResume, this.onPause});
  final VoidCallback? onResume;
  final VoidCallback? onPause;

  @override
  Widget build(BuildContext context) {
    onPause?.call();
    return Dialog(
      backgroundColor: Colors.black54,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300,
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PAUSED',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // 팝업 닫기 (게임 재개)
                Navigator.pop(context); onResume?.call();
              },
              child: const Text('게임 계속하기'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // 팝업을 닫고 설정 화면으로 이동
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text('설정 (Settings)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                // 모든 화면을 비우고 로비(메인)로 강제 복귀
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/main',
                      (route) => false,
                );
              },
              child: const Text('포기하고 로비로', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
