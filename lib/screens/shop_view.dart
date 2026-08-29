import 'package:flutter/material.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(20), children: [
      const Text('SHOP', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
      const SizedBox(height: 16),
      _item('Starter Coins', '500 coins', Icons.monetization_on, '₩1,100'),
      _item('Energy Pack', '10 energy', Icons.bolt, '₩2,200'),
      _item('Remove Ads', 'Permanent', Icons.block, '₩4,400'),
    ]);
  }

  Widget _item(String title, String description, IconData icon, String price) => Card(child: ListTile(leading: CircleAvatar(child: Icon(icon)), title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(description), trailing: OutlinedButton(onPressed: () {}, child: Text(price))));
}
