import 'package:flutter/material.dart';
import '../utils/app_texts.dart';

class StageSelectView extends StatelessWidget {
  const StageSelectView({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(AppTexts.get('selectStage'))), body: ListView(padding: const EdgeInsets.all(20), children: [

  ]));

  Widget _stageCard(BuildContext context, int stage, String boss, String image, bool unlocked, int power, int reward) => Card(margin: const EdgeInsets.only(bottom: 14), clipBehavior: Clip.antiAlias, child: Opacity(opacity: unlocked ? 1 : .45, child: InkWell(onTap: unlocked ? () => Navigator.pushNamed(context, '/gamePlay', arguments: stage) : null, child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
    Image.asset(image, height: 76, width: 76), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('STAGE $stage', style: const TextStyle(color: Color(0xFFFFD166), fontWeight: FontWeight.bold)), Text(boss, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800)), const SizedBox(height: 8), Text('${AppTexts.get('recommendedPower')}: $power'), Text('${AppTexts.get('reward')}: $reward ${AppTexts.get('coins')}'),
    ])), Icon(unlocked ? Icons.chevron_right : Icons.lock, size: 30),
  ])))));
}
