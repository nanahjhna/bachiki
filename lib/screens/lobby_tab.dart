import 'package:flutter/material.dart';
import '../utils/app_texts.dart';

class LobbyTab extends StatelessWidget {
  const LobbyTab({super.key});

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [

      Container(color: const Color(0xFF1B183B)),
      SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
              _Currency(icon: Icons.monetization_on_rounded, value: '1,250'),
              _Currency(icon: Icons.bolt_rounded, value: '12'),
            ]),
            const SizedBox(height: 300),
            SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () => Navigator.pushNamed(context, '/stageSelect'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD166), foregroundColor: Colors.black), icon: const Icon(Icons.play_arrow_rounded, size: 28), label: Text(AppTexts.get('stageBattle'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))),
            const SizedBox(height: 16),
          ]),
        ),
      ),
    Positioned(top: 82, right: 16, child: Column(children: [_miniShortcut(context, Icons.bolt, 'Quest', '/quest'), const SizedBox(height: 12), _miniShortcut(context, Icons.campaign, 'Notice', '/notice')])),
    ],
  );
}

Widget _miniShortcut(BuildContext context, IconData icon, String label, String route) => Tooltip(message: label, child: Material(color: const Color(0xFF2D2855), shape: const CircleBorder(), child: InkWell(customBorder: const CircleBorder(), onTap: () => Navigator.pushNamed(context, route), child: Padding(padding: const EdgeInsets.all(11), child: Icon(icon, color: const Color(0xFFFFD166))))));

class _Currency extends StatelessWidget {
  const _Currency({required this.icon, required this.value});
  final IconData icon;
  final String value;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white12)), child: Row(children: [Icon(icon, color: const Color(0xFFFFD166), size: 18), const SizedBox(width: 5), Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))]));
}
