import 'package:flutter/material.dart';
import '../widgets/game_bottom_navigation.dart';
import '../widgets/game_header.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key, this.embedded = false});
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final content = ListView(padding: const EdgeInsets.all(20), children: [
      _item('Starter Coins', '500 coins', Icons.monetization_on, '₩1,100'),
      _item('Energy Pack', '10 energy', Icons.bolt, '₩2,200'),
      _item('Remove Ads', 'Permanent', Icons.block, '₩4,400'),
    ]);
    return embedded ? content : Scaffold(appBar: const GameHeader(titleKey: 'shop'), body: content, bottomNavigationBar: const GameBottomNavigation(currentIndex: 2));
  }

  Widget _item(String title, String description, IconData icon, String price) => Card(child: ListTile(leading: CircleAvatar(child: Icon(icon)), title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(description), trailing: OutlinedButton(onPressed: () {}, child: Text(price))));
}
