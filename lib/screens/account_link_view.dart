import 'package:flutter/material.dart';

class AccountLinkView extends StatelessWidget { const AccountLinkView({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('ACCOUNT LINK')), body: ListView(padding: const EdgeInsets.all(20), children: [const Card(child: ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text('Guest #1024'), subtitle: Text('현재 게스트 계정으로 플레이 중'))), const SizedBox(height: 16), _link(context, 'Google', Icons.g_mobiledata), _link(context, 'Apple', Icons.apple), const SizedBox(height: 20), const Text('계정을 연동하면 기기를 변경해도 데이터를 유지할 수 있습니다.', textAlign: TextAlign.center)]));
  Widget _link(BuildContext context, String service, IconData icon) => Card(child: ListTile(leading: Icon(icon), title: Text('$service 계정 연동'), trailing: OutlinedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$service 연동 흐름을 시작합니다.'))), child: const Text('연동'))));
}
