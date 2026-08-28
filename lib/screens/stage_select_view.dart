import 'package:flutter/material.dart';

class StageSelectView extends StatelessWidget {
  const StageSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('7. StageSelectView')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('보스 스테이지 선택', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/gamePlay');
              },
              child: const Text('스테이지 1 입장 (8. GamePlayView)'),
            ),
          ],
        ),
      ),
    );
  }
}