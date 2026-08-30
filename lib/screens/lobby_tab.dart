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
            const SizedBox(height: 24),
            const SizedBox(height: 10),
            const Text('BOSS RUSH', style: TextStyle(letterSpacing: 5, color: Color(0xFFFFD166), fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            Container(width: double.infinity, padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white30)), child: const Column(children: [
              Text('STAGE 1', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFFFFD166))),
              SizedBox(height: 4), Text('Forest Guardian', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 10), LinearProgressIndicator(value: .35, minHeight: 8, borderRadius: BorderRadius.all(Radius.circular(8))),
            ])),
            const SizedBox(height: 20),
            SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () => Navigator.pushNamed(context, '/stageSelect'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD166), foregroundColor: Colors.black), icon: const Icon(Icons.play_arrow_rounded, size: 28), label: Text(AppTexts.get('stageBattle'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: OutlinedButton.icon(onPressed: () => Navigator.pushNamed(context, '/character'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white30)), icon: const Icon(Icons.person), label: Text(AppTexts.get('character')))),
              const SizedBox(width: 12),
              Expanded(child: OutlinedButton.icon(onPressed: () => Navigator.pushNamed(context, '/stageSelect'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white30)), icon: const Icon(Icons.map), label: Text(AppTexts.get('stageSelect')))),
            ]),
            const SizedBox(height: 18),
            Wrap(spacing: 8, runSpacing: 8, alignment: WrapAlignment.center, children: [
              _shortcut(context, Icons.assignment, 'Quest', '/quest'), _shortcut(context, Icons.emoji_events, 'Notice', '/notice'), _shortcut(context, Icons.inventory_2, 'Inventory', '/inventory'),
            ]),
          ]),
        ),
      ),
    ],
  );
}

Widget _shortcut(BuildContext context, IconData icon, String label, String route) => OutlinedButton.icon(onPressed: () => Navigator.pushNamed(context, route), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white30)), icon: Icon(icon), label: Text(label));

class _Currency extends StatelessWidget {
  const _Currency({required this.icon, required this.value});
  final IconData icon;
  final String value;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white12)), child: Row(children: [Icon(icon, color: const Color(0xFFFFD166), size: 18), const SizedBox(width: 5), Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))]));
}