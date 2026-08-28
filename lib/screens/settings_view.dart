import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('5. Settings')),
      body: const Center(
        child: Text('옵션 / 사운드 설정 화면', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}