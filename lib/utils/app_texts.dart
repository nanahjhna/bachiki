import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTexts {
  static String _currentLang = '한국어';
  static final ValueNotifier<String> languageNotifier = ValueNotifier(_currentLang);

  // 📌 저장된 언어 불러오기 (앱이 켜질 때 호출)
  static Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    _currentLang = prefs.getString('selected_language') ?? '한국어';
    languageNotifier.value = _currentLang;
  }

  // 📌 언어 변경 및 저장하기
  static Future<void> setLanguage(String lang) async {
    _currentLang = lang;
    languageNotifier.value = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', lang);
  }

  static String get currentLang => _currentLang;

  // 📌 화면별 텍스트 데이터 맵 (다른 화면의 텍스트도 여기에 계속 추가하면 됩니다)
  static final Map<String, Map<String, String>> _texts = {
    '한국어': {
      'gameStart': '게임 시작',
      'recordView': '기록 보기',
      'settings': '설정',
      'gameMethod': '게임 방법',
      'puzzleGame': '🎮 퍼즐 게임',
      'readyMessage': '각 색깔의 행을 일치시켜주세요.',
      'newRecord': '👑 신기록!',
      'success': '🎉 성공!',
      'elapsedTime': '소요 시간',
      'home': '홈으로',
      'playAgain': '다시 하기',
      'settingsTitle': '⚙️ 설정',
      'goToMain': '메인으로 이동',
      'restartGame': '게임 다시하기',
      'soundEffects': '효과음',
      'close': '닫기',
      // 📌 RecordScreen & SettingsScreen 추가 키값
      'homeTooltip': '홈으로 이동',
      'recordScreenTitle': '🏆 게임 기록',
      'bestRecord': '최고 기록',
      'totalPlays': '플레이 횟수',
      'playsUnit': '회',
      'totalTime': '누적 플레이 시간',
      'minutesUnit': '분',
      'averageTime': '평균 클리어 타임',
      'privacyPolicy': '개인정보처리방침',
      'mainTitle': '바치키',
      'lobby': '로비',
      'shop': '상점',
      'play': '플레이',
      'character': '캐릭터',
      'stageSelect': '스테이지',
      'settings': '설정',
      'language': '언어',
      'sound': '사운드',
      'stageBattle': '스테이지 전투',
      'selectStage': '스테이지 선택',
      'startBattle': '전투 시작',
      'recommendedPower': '권장 전투력',
      'reward': '보상',
      'locked': '잠김',
      'pause': '일시정지',
      'resume': '계속하기',
      'quitToLobby': '포기하고 로비로',
      'victory': '승리!',
      'defeat': '패배',
      'retry': '다시 도전',
      'nextStage': '다음 스테이지',
      'coins': '코인',
      'inventory': '인벤토리',
      'quest': '퀘스트',
      'notice': '공지사항',
      'account': '계정 연동',
    },
    'English': {
      'gameStart': 'Start Game',
      'recordView': 'View Records',
      'settings': 'Settings',
      'gameMethod': 'How to Play',
      'puzzleGame': '🎮 Puzzle Game',
      'readyMessage': 'Please align the rows of each color.',
      'newRecord': '👑 New Record!',
      'success': '🎉 Success!',
      'elapsedTime': 'Time',
      'home': 'Home',
      'playAgain': 'Play Again',
      'settingsTitle': '⚙️ Settings',
      'goToMain': 'Go to Main',
      'restartGame': 'Restart Game',
      'soundEffects': 'Sound Effects',
      'close': 'Close',
      // 📌 RecordScreen & SettingsScreen 추가 키값
      'homeTooltip': 'Go to Home',
      'recordScreenTitle': '🏆 Game Records',
      'bestRecord': 'Best Record',
      'totalPlays': 'Total Plays',
      'playsUnit': 'times',
      'totalTime': 'Total Time',
      'minutesUnit': 'min',
      'averageTime': 'Average Time',
      'privacyPolicy': 'Privacy Policy',
      'mainTitle': 'Bachiki',
      'lobby': 'Lobby',
      'shop': 'Shop',
      'play': 'Play',
      'character': 'Character',
      'stageSelect': 'Stages',
      'settings': 'Settings',
      'language': 'Language',
      'sound': 'Sound',
      'stageBattle': 'Stage Battle',
      'selectStage': 'Select Stage',
      'startBattle': 'Start Battle',
      'recommendedPower': 'Recommended Power',
      'reward': 'Reward',
      'locked': 'Locked',
      'pause': 'Paused',
      'resume': 'Resume',
      'quitToLobby': 'Quit to Lobby',
      'victory': 'Victory!',
      'defeat': 'Defeat',
      'retry': 'Try Again',
      'nextStage': 'Next Stage',
      'coins': 'Coins',
      'inventory': 'Inventory',
      'quest': 'Quest',
      'notice': 'Notice',
      'account': 'Account Link',
    },
    '日本語': {
      'gameStart': 'ゲーム開始',
      'recordView': '記録を見る',
      'settings': '設定',
      'gameMethod': '遊び方',
      'puzzleGame': '🎮 パズルゲーム',
      'readyMessage': 'それぞれの色の行を合わせてください。',
      'newRecord': '👑 新記録！',
      'success': '🎉 成功！',
      'elapsedTime': '所要時間',
      'home': 'ホームへ',
      'playAgain': 'もう一度',
      'settingsTitle': '⚙️ 設定',
      'goToMain': 'メインへ移動',
      'restartGame': 'ゲームやり直し',
      'soundEffects': '効果音',
      'close': '閉じる',
      // 📌 RecordScreen & SettingsScreen 추가 키값
      'homeTooltip': 'ホームへ移動',
      'recordScreenTitle': '🏆 ゲーム記録',
      'bestRecord': '最高記録',
      'totalPlays': 'プレイ回数',
      'playsUnit': '回',
      'totalTime': '累計プレイ時間',
      'minutesUnit': '分',
      'averageTime': '平均クリアタイム',
      'privacyPolicy': 'プライバシーポリシー',
      'mainTitle': 'バチキ',
      'lobby': 'ロビー',
      'shop': 'ショップ',
      'play': 'プレイ',
      'character': 'キャラクター',
      'stageSelect': 'ステージ',
      'settings': '設定',
      'language': '言語',
      'sound': 'サウンド',
      'stageBattle': 'ステージバトル',
      'selectStage': 'ステージ選択',
      'startBattle': 'バトル開始',
      'recommendedPower': '推奨戦力',
      'reward': '報酬',
      'locked': 'ロック中',
      'pause': '一時停止',
      'resume': '続ける',
      'quitToLobby': 'ロビーへ戻る',
      'victory': '勝利！',
      'defeat': '敗北',
      'retry': 'もう一度',
      'nextStage': '次のステージ',
      'coins': 'コイン',
      'inventory': 'インベントリ',
      'quest': 'クエスト',
      'notice': 'お知らせ',
      'account': 'アカウント連携',
    },
  };

  // 📌 텍스트를 가져오는 함수
  static String get(String key) {
    return _additionalTexts[_currentLang]?[key] ?? _texts[_currentLang]?[key] ?? _additionalTexts['한국어']?[key] ?? _texts['한국어']?[key] ?? key;
  }

  static const Map<String, Map<String, String>> _additionalTexts = {
    '한국어': {'login': '로그인', 'guest': '게스트로 시작', 'googleLogin': 'Google 로그인', 'appleLogin': 'Apple 로그인', 'loginGuide': '게임 데이터를 안전하게 보관하세요.', 'stage': '스테이지', 'boss': '보스', 'timeLeft': '남은 시간', 'attack': '공격', 'inventory': '인벤토리', 'all': '전체', 'equipment': '장비', 'consumable': '소모품', 'useItem': '선택 아이템 사용', 'unequip': '장비 해제', 'equipped': '현재 착용 중', 'notEquipped': '미착용', 'characterIntro': '캐릭터 소개', 'skill': '스킬', 'stats': '능력치', 'quest': '퀘스트', 'dailyQuest': '일일 퀘스트', 'achievement': '업적', 'claimReward': '보상 받기', 'claimed': '수령 완료', 'notice': '공지사항', 'attendance': '출석 이벤트', 'account': '계정 연동', 'logout': '로그아웃', 'linkGoogle': 'Google 계정으로 연동', 'loading': '데이터를 불러오는 중입니다...', 'settings': '설정', 'soundEffects': '효과음', 'bgmVolume': 'BGM 볼륨', 'sfxVolume': '효과음 볼륨', 'stageBattle': '스테이지 전투', 'shop': '상점'},
    'English': {'login': 'Login', 'guest': 'Continue as Guest', 'googleLogin': 'Sign in with Google', 'appleLogin': 'Sign in with Apple', 'loginGuide': 'Keep your game data safe.', 'stage': 'Stage', 'boss': 'Boss', 'timeLeft': 'Time Left', 'attack': 'Attack', 'inventory': 'Inventory', 'all': 'All', 'equipment': 'Equipment', 'consumable': 'Consumables', 'useItem': 'Use Selected Item', 'unequip': 'Unequip', 'equipped': 'Equipped', 'notEquipped': 'Not equipped', 'characterIntro': 'Character Info', 'skill': 'Skill', 'stats': 'Stats', 'quest': 'Quest', 'dailyQuest': 'Daily Quest', 'achievement': 'Achievements', 'claimReward': 'Claim Reward', 'claimed': 'Claimed', 'notice': 'Notice', 'attendance': 'Attendance Event', 'account': 'Account Link', 'logout': 'Log Out', 'linkGoogle': 'Link Google Account', 'loading': 'Loading data...', 'settings': 'Settings', 'soundEffects': 'Sound Effects', 'bgmVolume': 'BGM Volume', 'sfxVolume': 'SFX Volume', 'stageBattle': 'Stage Battle', 'shop': 'Shop'},
    '日本語': {'login': 'ログイン', 'guest': 'ゲストで始める', 'googleLogin': 'Googleでログイン', 'appleLogin': 'Appleでログイン', 'loginGuide': 'ゲームデータを安全に保管します。', 'stage': 'ステージ', 'boss': 'ボス', 'timeLeft': '残り時間', 'attack': '攻撃', 'inventory': 'インベントリ', 'all': 'すべて', 'equipment': '装備', 'consumable': '消耗品', 'useItem': '選択アイテムを使う', 'unequip': '装備を外す', 'equipped': '装備中', 'notEquipped': '未装備', 'characterIntro': 'キャラクター紹介', 'skill': 'スキル', 'stats': '能力値', 'quest': 'クエスト', 'dailyQuest': 'デイリークエスト', 'achievement': '実績', 'claimReward': '報酬を受け取る', 'claimed': '受取済み', 'notice': 'お知らせ', 'attendance': '出席イベント', 'account': 'アカウント連携', 'logout': 'ログアウト', 'linkGoogle': 'Googleアカウントと連携', 'loading': 'データを読み込み中...', 'settings': '設定', 'soundEffects': '効果音', 'bgmVolume': 'BGM音量', 'sfxVolume': '効果音音量', 'stageBattle': 'ステージバトル', 'shop': 'ショップ'},
  };

  // 📌 초 단위 시간 포맷 (예: 12.34초 / 12.34s / 12.34秒)
  static String formatTimeSec(int seconds, int centiseconds) {
    String csStr = centiseconds.toString().padLeft(2, '0');
    if (_currentLang == 'English') {
      return '$seconds.$csStr s';
    } else if (_currentLang == '日本語') {
      return '$seconds.$csStr秒';
    } else {
      return '$seconds.$csStr초';
    }
  }

  // 📌 분/초 단위 시간 포맷 (예: 1분 12.34초 / 1m 12.34s / 1分 12.34秒)
  static String formatTimeMinSec(int minutes, int seconds, int centiseconds) {
    String csStr = centiseconds.toString().padLeft(2, '0');
    if (_currentLang == 'English') {
      return '$minutes m $seconds.$csStr s';
    } else if (_currentLang == '日本語') {
      return '$minutes分 $seconds.$csStr秒';
    } else {
      return '$minutes분 $seconds.$csStr초';
    }
  }
}
