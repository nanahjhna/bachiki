import 'package:flutter/material.dart';
import '../services/user_session.dart';
import '../widgets/game_bottom_navigation.dart';
import '../widgets/game_header.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key, this.embedded = false});
  final bool embedded;
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String? _provider;
  @override
  void initState() { super.initState(); _loadProvider(); }
  Future<void> _loadProvider() async { final value = await UserSession.loginProvider(); if (mounted) setState(() => _provider = value); }
  Future<void> _logout() async { await UserSession.logout(); if (mounted) Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false); }
  @override
  Widget build(BuildContext context) {
    final content = ListView(padding: const EdgeInsets.all(20), children: [
      const Card(child: ListTile(title: Text('BGM Volume'), subtitle: Slider(value: .7, onChanged: null), leading: Icon(Icons.music_note))),
      const Card(child: ListTile(title: Text('SFX Volume'), subtitle: Slider(value: .8, onChanged: null), leading: Icon(Icons.volume_up))),
      Card(child: ListTile(onTap: () => Navigator.pushNamed(context, '/accountLink'), title: const Text('Account Link'), subtitle: Text(_provider ?? '로그인 정보 확인 중'), leading: const Icon(Icons.link), trailing: const Icon(Icons.chevron_right))),
      if (_provider == 'guest') Card(child: ListTile(onTap: () => Navigator.pushNamed(context, '/accountLink'), title: const Text('Google 계정으로 연동'), subtitle: const Text('현재 게스트 계정'), leading: const Icon(Icons.g_mobiledata), trailing: const Icon(Icons.chevron_right))),
      if (_provider == 'google') Card(child: ListTile(onTap: _logout, title: const Text('로그아웃'), subtitle: const Text('Google 계정에서 로그아웃합니다.'), leading: const Icon(Icons.logout), trailing: const Icon(Icons.chevron_right))),
      const SizedBox(height: 20), Text('v1.0.0', textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(.55))),
    ]);
    return widget.embedded ? content : Scaffold(appBar: const GameHeader(titleKey: 'settings'), body: content, bottomNavigationBar: const GameBottomNavigation(currentIndex: 4));
  }
}
