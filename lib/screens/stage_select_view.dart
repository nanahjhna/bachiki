import 'package:flutter/material.dart';
import '../utils/app_texts.dart';
import '../models/stage_model.dart';
import '../services/stage_generator.dart';
import '../widgets/game_bottom_navigation.dart';
import '../widgets/game_header.dart';

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
      backgroundColor: const Color(0xFF1B183B), // 헤더와 동일한 배경색
      appBar: const GameHeader(titleKey: 'selectStage'),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _virtualInfiniteCount,
        itemBuilder: (context, index) {
          final stageNum = index + 1;
          final stageData = StageGenerator.generateStage(stageNum, _userMaxStage);

          return _stageCard(context, stageData);
        },
      ),
      bottomNavigationBar: const GameBottomNavigation(),
    );
  }

  Widget _stageCard(BuildContext context, StageModel stage) {
    return Card(
      color: const Color(0xFF25214D), // 본문 배경보다 살짝 밝은 남색 카드로 입체감 부여
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 14),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.white12),
      ),
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
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.pest_control, size: 40, color: Colors.amber),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('STAGE ${stage.stageNumber}', style: const TextStyle(color: Color(0xFFFFD166), fontWeight: FontWeight.bold)),
                      const SizedBox(height: 2),
                      Text(stage.bossName, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: Colors.white)),
                      const SizedBox(height: 8),
                      Text('${AppTexts.get('recommendedPower')}: ${stage.recommendedPower}', style: const TextStyle(color: Colors.white70)),
                      Text('${AppTexts.get('reward')}: ${stage.rewardCoins} ${AppTexts.get('coins')}', style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                Icon(stage.isUnlocked ? Icons.chevron_right : Icons.lock, size: 30, color: Colors.white70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}