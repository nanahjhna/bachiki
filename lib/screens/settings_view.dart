import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, this.embedded = false});
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final content = ListView(padding: const EdgeInsets.all(20), children: [
      const Text('SETTINGS', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
      const SizedBox(height: 16),
      const Card(child: ListTile(title: Text('BGM Volume'), subtitle: Slider(value: .7, onChanged: null), leading: Icon(Icons.music_note))),
      const Card(child: ListTile(title: Text('SFX Volume'), subtitle: Slider(value: .8, onChanged: null), leading: Icon(Icons.volume_up))),
      const Card(child: SwitchListTile(value: true, onChanged: null, title: Text('Sound Effects'), secondary: Icon(Icons.volume_up))),
      const Card(child: ListTile(title: Text('Privacy Policy'), leading: Icon(Icons.privacy_tip), trailing: Icon(Icons.chevron_right))),
      Card(child: ListTile(onTap: () => Navigator.pushNamed(context, '/accountLink'), title: const Text('Account Link'), leading: const Icon(Icons.link), trailing: const Icon(Icons.chevron_right))),
      Card(child: ListTile(onTap: () => _coupon(context), title: const Text('Enter Coupon'), leading: const Icon(Icons.confirmation_number), trailing: const Icon(Icons.chevron_right))),
      const SizedBox(height: 20), Text('v1.0.0', textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(.55))),
    ]);
    return embedded ? content : Scaffold(appBar: AppBar(title: const Text('SETTINGS')), body: content);
  }
  void _coupon(BuildContext context) { showDialog(context: context, builder: (context) => AlertDialog(title: const Text('쿠폰 입력'), content: const TextField(decoration: InputDecoration(hintText: 'COUPON CODE')), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')), ElevatedButton(onPressed: () { Navigator.pop(context); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('쿠폰이 적용되었습니다.'))); }, child: const Text('확인'))])); }
}
