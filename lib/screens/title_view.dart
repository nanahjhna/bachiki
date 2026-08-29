import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [

        Container(color: const Color(0xA8151329)),
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text('BOSS RUSH', style: TextStyle(letterSpacing: 6, color: Color(0xFFFFD166), fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
              child: const Text('TAP TO START'),
            ),
            const SizedBox(height: 10),
            TextButton.icon(onPressed: () => Navigator.pushNamed(context, '/login'), icon: const Icon(Icons.person_outline), label: const Text('LOGIN / ACCOUNT')),
            TextButton.icon(onPressed: () => Navigator.pushNamed(context, '/settings'), icon: const Icon(Icons.settings), label: const Text('SETTINGS')),
            TextButton.icon(onPressed: () => Navigator.pushNamed(context, '/shop'), icon: const Icon(Icons.shopping_bag_outlined), label: const Text('SHOP')),
          ],
        )),
        const Positioned(bottom: 24, left: 0, right: 0, child: Text('v1.0.0', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54))),
      ]),
    );
  }
}
