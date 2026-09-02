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

  // 📌 화면별 다국어 텍스트 데이터 맵
  static final Map<String, Map<String, String>> _texts = {
    '한국어': {
      // 공통 / 헤더 / 네비게이션
      'mainTitle': '바치키',
      'lobby': '로비',
      'inventory': '인벤토리',
      'shop': '상점',
      'character': '캐릭터',
      'settings': '설정',
      'language': '언어',
      'sound': '사운드',
      'coins': '코인',
      'energy': '에너지',
      'close': '닫기',
      'loading': '데이터를 불러오는 중입니다...',
      'tapToStart': 'TAP TO START',
      'home': '홈으로',
      'back': '뒤로',

      // 로그인 / 계정
      'login': '로그인',
      'guest': '게스트로 시작',
      'googleLogin': 'Google 로그인',
      'appleLogin': 'Apple 로그인',
      'loginGuide': '게임 데이터를 안전하게 보관하세요.',
      'loginSuccess': '로그인되었습니다.',
      'account': '계정 연동',
      'logout': '로그아웃',
      'logoutGuide': 'Google 계정에서 로그아웃합니다.',
      'linkGoogle': 'Google 계정으로 연동',
      'currentGuest': '현재 게스트 계정',
      'guestPlaying': '현재 게스트 계정으로 플레이 중',
      'checkingLogin': '로그인 정보 확인 중',
      'linkAccount': '계정 연동',
      'link': '연동',
      'linkStarted': '연동 흐름을 시작합니다.',
      'accountLinkDesc': '계정을 연동하면 기기를 변경해도 데이터를 유지할 수 있습니다.',

      // 스테이지 & 전투
      'stageBattle': '스테이지 전투',
      'selectStage': '스테이지 선택',
      'startBattle': '전투 시작',
      'stage': '스테이지',
      'boss': '보스',
      'recommendedPower': '권장 전투력',
      'reward': '보상',
      'locked': '잠김',
      'pause': '일시정지',
      'resume': '게임 계속하기',
      'quitToLobby': '포기하고 로비로',
      'victory': '승리!',
      'defeat': '패배',
      'retry': '다시 도전',
      'nextStage': '다음 스테이지',
      'timeLeft': '남은 시간',
      'attack': '공격',
      'attackGuide': '제한 시간 내에 공격 버튼을 연타하세요!',
      'play': '플레이',

      // 인벤토리 & 캐릭터
      'all': '전체',
      'equipment': '장비',
      'consumable': '소모품',
      'item': '아이템',
      'useItem': '선택 아이템 사용',
      'unequip': '장비 해제',
      'equipped': '착용 중',
      'notEquipped': '미착용',
      'itemEquipped': '아이템을 착용했습니다.',
      'itemUnequipped': '아이템을 해제했습니다.',
      'characterIntro': '캐릭터 소개',
      'characterName': '블루 스트라이커',
      'characterDesc': '빠른 연속 공격으로 보스의 빈틈을 파고드는 근접 전사입니다.',
      'skill': '스킬',
      'stats': '능력치',
      'level': 'Lv.',
      'power': '전투력',
      'statAtk': '공격력',
      'statDef': '방어력',
      'statSpd': '속도',
      'equippedPerks': '장착된 퍽',
      'quickStrike': 'Quick Strike',
      'vitality': 'Vitality',

      // 상점
      'starterCoins': '스타터 코인 팩',
      'starterCoinsDesc': '500 코인',
      'energyPack': '에너지 팩',
      'energyPackDesc': '10 에너지',
      'removeAds': '광고 제거',
      'removeAdsDesc': '영구 적용',

      // 퀘스트 & 공지 / 출석
      'quest': '퀘스트',
      'dailyQuest': '일일 퀘스트',
      'achievement': '업적',
      'dailyMission': '일일 미션',
      'achievementMission': '업적 미션',
      'claimReward': '보상 받기',
      'claimed': '수령 완료',
      'notice': '공지사항',
      'attendance': '출석 이벤트',
      'attendance7Days': '7일 출석 보상',
      'dayUnit': '일',
      'claimTodayReward': '오늘 보상 받기',
      'noticeEvent1': '정식 출시 기념 이벤트',
      'noticeUpdate1': '8월 업데이트 안내',
      'termsOfService': '서비스 이용 약관',
      'noticeContent': '바치키를 플레이해주셔서 감사합니다. 새로운 이벤트와 보상을 확인하세요.',

      // 설정 & 사운드
      'bgmVolume': 'BGM 볼륨',
      'sfxVolume': '효과음 볼륨',
      'soundEffects': '효과음',
    },
    'English': {
      // Common / Header / Navigation
      'mainTitle': 'Bachiki',
      'lobby': 'Lobby',
      'inventory': 'Inventory',
      'shop': 'Shop',
      'character': 'Character',
      'settings': 'Settings',
      'language': 'Language',
      'sound': 'Sound',
      'coins': 'Coins',
      'energy': 'Energy',
      'close': 'Close',
      'loading': 'Loading data...',
      'tapToStart': 'TAP TO START',
      'home': 'Home',
      'back': 'Back',

      // Login / Account
      'login': 'Login',
      'guest': 'Continue as Guest',
      'googleLogin': 'Sign in with Google',
      'appleLogin': 'Sign in with Apple',
      'loginGuide': 'Keep your game data safe.',
      'loginSuccess': 'Logged in successfully.',
      'account': 'Account Link',
      'logout': 'Log Out',
      'logoutGuide': 'Log out of your Google account.',
      'linkGoogle': 'Link Google Account',
      'currentGuest': 'Guest Account',
      'guestPlaying': 'Currently playing as Guest',
      'checkingLogin': 'Checking login info...',
      'linkAccount': 'Link Account',
      'link': 'Link',
      'linkStarted': 'Starting account link flow.',
      'accountLinkDesc': 'Link your account to keep your data safe across devices.',

      // Stage & Battle
      'stageBattle': 'Stage Battle',
      'selectStage': 'Select Stage',
      'startBattle': 'Start Battle',
      'stage': 'Stage',
      'boss': 'Boss',
      'recommendedPower': 'Recommended Power',
      'reward': 'Reward',
      'locked': 'Locked',
      'pause': 'Paused',
      'resume': 'Resume Game',
      'quitToLobby': 'Quit to Lobby',
      'victory': 'Victory!',
      'defeat': 'Defeat',
      'retry': 'Try Again',
      'nextStage': 'Next Stage',
      'timeLeft': 'Time Left',
      'attack': 'Attack',
      'attackGuide': 'Tap ATTACK repeatedly before time runs out!',
      'play': 'Play',

      // Inventory & Character
      'all': 'All',
      'equipment': 'Equipment',
      'consumable': 'Consumables',
      'item': 'Item',
      'useItem': 'Use Selected Item',
      'unequip': 'Unequip',
      'equipped': 'Equipped',
      'notEquipped': 'Not equipped',
      'itemEquipped': 'Item equipped.',
      'itemUnequipped': 'Item unequipped.',
      'characterIntro': 'Character Info',
      'characterName': 'Blue Striker',
      'characterDesc': 'A melee warrior who exploits boss weaknesses with rapid strikes.',
      'skill': 'Skill',
      'stats': 'Stats',
      'level': 'Lv.',
      'power': 'Power',
      'statAtk': 'ATK',
      'statDef': 'DEF',
      'statSpd': 'SPD',
      'equippedPerks': 'EQUIPPED PERKS',
      'quickStrike': 'Quick Strike',
      'vitality': 'Vitality',

      // Shop
      'starterCoins': 'Starter Coins',
      'starterCoinsDesc': '500 coins',
      'energyPack': 'Energy Pack',
      'energyPackDesc': '10 energy',
      'removeAds': 'Remove Ads',
      'removeAdsDesc': 'Permanent',

      // Quest & Notice / Attendance
      'quest': 'Quest',
      'dailyQuest': 'Daily Quest',
      'achievement': 'Achievements',
      'dailyMission': 'Daily Mission',
      'achievementMission': 'Achievement Mission',
      'claimReward': 'Claim Reward',
      'claimed': 'Claimed',
      'notice': 'Notice',
      'attendance': 'Attendance Event',
      'attendance7Days': '7-Day Attendance Reward',
      'dayUnit': ' Day',
      'claimTodayReward': 'Claim Today\'s Reward',
      'noticeEvent1': 'Official Launch Event',
      'noticeUpdate1': 'August Update Notice',
      'termsOfService': 'Terms of Service',
      'noticeContent': 'Thank you for playing Bachiki. Check out new events and rewards!',

      // Settings & Sound
      'bgmVolume': 'BGM Volume',
      'sfxVolume': 'SFX Volume',
      'soundEffects': 'Sound Effects',
    },
    '日本語': {
      // 共通 / ヘッダー / ナビゲーション
      'mainTitle': 'バチキ',
      'lobby': 'ロビー',
      'inventory': 'インベントリ',
      'shop': 'ショップ',
      'character': 'キャラクター',
      'settings': '設定',
      'language': '言語',
      'sound': 'サウンド',
      'coins': 'コイン',
      'energy': 'エネルギー',
      'close': '閉じる',
      'loading': 'データを読み込み中...',
      'tapToStart': 'TAP TO START',
      'home': 'ホームへ',
      'back': '戻る',

      // ログイン / アカウント
      'login': 'ログイン',
      'guest': 'ゲストで始める',
      'googleLogin': 'Googleでログイン',
      'appleLogin': 'Appleでログイン',
      'loginGuide': 'ゲームデータを安全に保管します。',
      'loginSuccess': 'ログインしました。',
      'account': 'アカウント連携',
      'logout': 'ログアウト',
      'logoutGuide': 'Googleアカウントからログアウトします。',
      'linkGoogle': 'Googleアカウントと連携',
      'currentGuest': '現在ゲストアカウント',
      'guestPlaying': '現在ゲストアカウントでプレイ中',
      'checkingLogin': 'ログイン情報確認中',
      'linkAccount': 'アカウント連携',
      'link': '連携',
      'linkStarted': 'アカウント連携を開始します。',
      'accountLinkDesc': 'アカウントを連携すると端末を変更してもデータを保持できます。',

      // ステージ & バトル
      'stageBattle': 'ステージバトル',
      'selectStage': 'ステージ選択',
      'startBattle': 'バトル開始',
      'stage': 'ステージ',
      'boss': 'ボス',
      'recommendedPower': '推奨戦力',
      'reward': '報酬',
      'locked': 'ロック中',
      'pause': '一時停止',
      'resume': 'ゲームを続ける',
      'quitToLobby': 'ロビーへ戻る',
      'victory': '勝利！',
      'defeat': '敗北',
      'retry': 'もう一度',
      'nextStage': '次のステージ',
      'timeLeft': '残り時間',
      'attack': '攻撃',
      'attackGuide': '制限時間内に攻撃ボタンを連打してください！',
      'play': 'プレイ',

      // インベントリ & キャラクター
      'all': 'すべて',
      'equipment': '装備',
      'consumable': '消耗品',
      'item': 'アイテム',
      'useItem': '選択アイテムを使用',
      'unequip': '装備を外す',
      'equipped': '装備中',
      'notEquipped': '未装備',
      'itemEquipped': 'アイテムを装備しました。',
      'itemUnequipped': 'アイテムを外しました。',
      'characterIntro': 'キャラクター紹介',
      'characterName': 'ブルーストライカー',
      'characterDesc': '素早い連続攻撃でボスの隙を突く近接戦士です。',
      'skill': 'スキル',
      'stats': '能力値',
      'level': 'Lv.',
      'power': '戦力',
      'statAtk': '攻撃力',
      'statDef': '防御力',
      'statSpd': '速度',
      'equippedPerks': '装備中のパーク',
      'quickStrike': 'Quick Strike',
      'vitality': 'Vitality',

      // ショップ
      'starterCoins': 'スターターコインパック',
      'starterCoinsDesc': '500コイン',
      'energyPack': 'エネルギーパック',
      'energyPackDesc': '10エネルギー',
      'removeAds': '広告削除',
      'removeAdsDesc': '永久適用',

      // クエスト & お知らせ / 出席
      'quest': 'クエスト',
      'dailyQuest': 'デイリークエスト',
      'achievement': '実績',
      'dailyMission': 'デイリーミッション',
      'achievementMission': '実績ミッション',
      'claimReward': '報酬を受け取る',
      'claimed': '受取済み',
      'notice': 'お知らせ',
      'attendance': '出席イベント',
      'attendance7Days': '7日出席報酬',
      'dayUnit': '日目',
      'claimTodayReward': '今日の報酬を受け取る',
      'noticeEvent1': '正式リリース記念イベント',
      'noticeUpdate1': '8월アップデート案内',
      'termsOfService': '利用規約',
      'noticeContent': 'バチキをプレイしていただきありがとうございます。新しいイベントと報酬をご確認ください。',

      // 設定 & サウンド
      'bgmVolume': 'BGM音量',
      'sfxVolume': '効果音音量',
      'soundEffects': '効果音',
    },
  };

  // 📌 텍스트를 가져오는 함수
  static String get(String key) {
    return _texts[_currentLang]?[key] ?? _texts['한국어']?[key] ?? key;
  }

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
