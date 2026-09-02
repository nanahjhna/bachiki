import 'package:flutter/material.dart';
import '../services/user_session.dart';
import '../utils/app_texts.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: const Color(0xA8151329)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BOSS RUSH',
                  style: TextStyle(
                    letterSpacing: 6,
                    color: Color(0xFFFFD166),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final provider = await UserSession.loginProvider();
                    if (!context.mounted) return;
                    Navigator.pushReplacementNamed(
                      context,
                      provider == null ? '/login' : '/main',
                    );
                  },
                  child: Text(AppTexts.get('tapToStart')),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Text(
              'v1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }
}
