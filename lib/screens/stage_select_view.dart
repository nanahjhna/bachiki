import 'package:flutter/material.dart';
import '../utils/app_texts.dart';
import '../models/stage_model.dart';       // 추가
import '../services/stage_generator.dart';  // 추가

class StageSelectView extends StatefulWidget {
  const StageSelectView({super.key});

  @override
  State<StageSelectView> createState() => _StageSelectViewState();
}

class _StageSelectViewState extends State<StageSelectView> {
  final int _userMaxStage = 5;
  final int _virtualInfiniteCount = 999999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppTexts.get('selectStage'))),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _virtualInfiniteCount,
        itemBuilder: (context, index) {
          final stageNum = index + 1;
          final stageData = StageGenerator.generateStage(stageNum, _userMaxStage);

          return _stageCard(context, stageData);
        },
      ),
    );
  }

  Widget _stageCard(BuildContext context, StageModel stage) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      clipBehavior: Clip.antiAlias,
      child: Opacity(
        opacity: stage.isUnlocked ? 1 : .45,
        child: InkWell(
          onTap: stage.isUnlocked
              ? () => Navigator.pushNamed(context, '/gamePlay', arguments: stage.stageNumber)
              : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 76,
                  height: 76,
                  color: Colors.black26,
                  child: const Icon(Icons.pest_control, size: 40, color: Colors.amber),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('STAGE ${stage.stageNumber}', style: const TextStyle(color: Color(0xFFFFD166), fontWeight: FontWeight.bold)),
                      Text(stage.bossName, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 8),
                      Text('${AppTexts.get('recommendedPower')}: ${stage.recommendedPower}'),
                      Text('${AppTexts.get('reward')}: ${stage.rewardCoins} ${AppTexts.get('coins')}'),
                    ],
                  ),
                ),
                Icon(stage.isUnlocked ? Icons.chevron_right : Icons.lock, size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}