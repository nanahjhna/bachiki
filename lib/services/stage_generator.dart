import '../models/stage_model.dart'; // 추가

class StageGenerator {
  static final List<String> _bossTitles = [
    'Forest Guardian',
    'Goblin King',
    'Shadow Assassin',
    'Flame Dragon',
    'Void Behemoth',
  ];

  static StageModel generateStage(int stageNum, int currentMaxStage) {
    final power = 100 + (stageNum * 150) + (stageNum * stageNum * 10);
    final reward = 50 + (stageNum * 40);
    final boss = _bossTitles[(stageNum - 1) % _bossTitles.length];
    final unlocked = stageNum <= currentMaxStage + 1;

    return StageModel(
      stageNumber: stageNum,
      bossName: '$boss (Lv.$stageNum)',
      imagePath: 'assets/images/boss_placeholder.png',
      recommendedPower: power,
      rewardCoins: reward,
      isUnlocked: unlocked,
    );
  }
}