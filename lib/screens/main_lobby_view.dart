import 'package:flutter/material.dart';

class MainLobbyView extends StatelessWidget {
  const MainLobbyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bachiki LOBBY'), backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.sports_hockey, size: 80, color: Colors.tealAccent),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              onPressed: () => Navigator.pushNamed(context, '/stage_select'),
              child: const Text('STAGE BATTLE', style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}