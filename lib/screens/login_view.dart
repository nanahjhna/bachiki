import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  // TODO: 실제 프로젝트에서는 SharedPreferences나 secure_storage 등을 사용하여 로그인 상태 및 제공자(Google, Apple, Guest)를 로컬에 저장하세요.
  // 예시: final prefs = await SharedPreferences.getInstance(); await prefs.setString('login_provider', label);

  void _handleLogin(BuildContext context, String label) {
    // 자동 로그인 상태 저장 로직 처리 구간

    Navigator.pushReplacementNamed(context, '/main');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label 되었습니다.')),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('LOGIN')),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(Icons.account_circle, size: 90),
          const SizedBox(height: 16),
          const Text('게임 데이터를 안전하게 보관하세요.', textAlign: TextAlign.center),
          const SizedBox(height: 30),
          _button(context, 'Google 로그인', Icons.g_mobiledata),
          _button(context, 'Apple 로그인', Icons.apple),
          _button(context, '게스트로 시작', Icons.person_outline),
          const Spacer(),
        ],
      ),
    ),
  );

  Widget _button(BuildContext context, String label, IconData icon) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: ElevatedButton.icon(
      onPressed: () => _handleLogin(context, label),
      icon: Icon(icon),
      label: Text(label),
    ),
  );
}