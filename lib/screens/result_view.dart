import 'package:flutter/material.dart';
import '../utils/app_texts.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final data = ModalRoute.of(context)?.settings.arguments as Map? ?? {'victory': false, 'stage': 1};
          final won = data['victory'] == true;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  won ? Icons.emoji_events : Icons.heart_broken,
                  size: 90,
                  color: won ? const Color(0xFFFFD166) : Colors.redAccent,
                ),
                Text(
                  won ? AppTexts.get('victory') : AppTexts.get('defeat'),
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 8),
                Text('${AppTexts.get('stage')} ${data['stage']}'),
                if (won)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      '+100 ${AppTexts.get('coins')}',
                      style: const TextStyle(fontSize: 20, color: Color(0xFFFFD166), fontWeight: FontWeight.bold),
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/gamePlay', arguments: data['stage']),
                  child: Text(AppTexts.get('retry')),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false),
                  child: Text(AppTexts.get('lobby')),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}