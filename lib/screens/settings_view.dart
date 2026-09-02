import 'package:flutter/material.dart';
import '../services/user_session.dart';
import '../widgets/game_bottom_navigation.dart';
import '../widgets/game_header.dart';
import '../utils/app_texts.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key, this.embedded = false});
  final bool embedded;
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String? _provider;
  @override
  void initState() {
    super.initState();
    _loadProvider();
  }

  Future<void> _loadProvider() async {
    final value = await UserSession.loginProvider();
    if (mounted) setState(() => _provider = value);
  }

  Future<void> _logout() async {
    await UserSession.logout();
    if (mounted) Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      top: widget.embedded,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: ListTile(
              title: Text(AppTexts.get('bgmVolume')),
              subtitle: const Slider(value: .7, onChanged: null),
              leading: const Icon(Icons.music_note),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(AppTexts.get('sfxVolume')),
              subtitle: const Slider(value: .8, onChanged: null),
              leading: const Icon(Icons.volume_up),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => Navigator.pushNamed(context, '/accountLink'),
              title: Text(AppTexts.get('account')),
              subtitle: Text(_provider ?? AppTexts.get('checkingLogin')),
              leading: const Icon(Icons.link),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          if (_provider == 'guest')
            Card(
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, '/accountLink'),
                title: Text(AppTexts.get('linkGoogle')),
                subtitle: Text(AppTexts.get('currentGuest')),
                leading: const Icon(Icons.g_mobiledata),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          if (_provider == 'google')
            Card(
              child: ListTile(
                onTap: _logout,
                title: Text(AppTexts.get('logout')),
                subtitle: Text(AppTexts.get('logoutGuide')),
                leading: const Icon(Icons.logout),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          const SizedBox(height: 20),
          Text(
            'v1.0.0',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
          ),
        ],
      ),
    );
    return widget.embedded
        ? content
        : Scaffold(
            appBar: const GameHeader(titleKey: 'settings'),
            body: content,
            bottomNavigationBar: const GameBottomNavigation(currentIndex: 4),
          );
  }
}
