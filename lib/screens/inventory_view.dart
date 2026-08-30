import 'package:flutter/material.dart';
import '../widgets/game_bottom_navigation.dart';
import '../widgets/game_header.dart';
import '../utils/app_texts.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key, this.embedded = false});
  final bool embedded;

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  int _category = 0;
  int? _selected;
  final _equipped = <int>{0, 2};

  @override
  Widget build(BuildContext context) {
    final content = Column(children: [
      Padding(padding: const EdgeInsets.all(12), child: SegmentedButton<int>(segments: [ButtonSegment(value: 0, label: Text(AppTexts.get('all'))), ButtonSegment(value: 1, label: Text(AppTexts.get('equipment'))), ButtonSegment(value: 2, label: Text(AppTexts.get('consumable')))], selected: {_category}, onSelectionChanged: (v) => setState(() => _category = v.first))),
      Expanded(child: ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 16), itemCount: 8, itemBuilder: (_, i) => _item(i))),
      if (_selected != null) Padding(padding: const EdgeInsets.all(16), child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _action, child: Text(_equipped.contains(_selected) ? AppTexts.get('unequip') : AppTexts.get('useItem'))))),
    ]);

    return widget.embedded
        ? content
        : Scaffold(
      appBar: const GameHeader(titleKey: 'inventory'),
      body: content,
      bottomNavigationBar: const GameBottomNavigation(currentIndex: 2), // 인벤토리 탭 인덱스 2로 맞춤
    );
  }
  Widget _item(int i) { final equipped = _equipped.contains(i); return Card(child: CheckboxListTile(value: _selected == i, onChanged: (_) => setState(() => _selected = _selected == i ? null : i), secondary: CircleAvatar(child: Icon(i.isEven ? Icons.shield : Icons.healing)), title: Text('${AppTexts.get('inventory')} ${i + 1}'), subtitle: Text(equipped ? '${AppTexts.get('equipped')} · +${(i + 1) * 5}' : AppTexts.get('notEquipped')), controlAffinity: ListTileControlAffinity.trailing)); }
  void _action() { final item = _selected!; setState(() { _equipped.contains(item) ? _equipped.remove(item) : _equipped.add(item); }); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_equipped.contains(item) ? '아이템을 착용했습니다.' : '아이템을 해제했습니다.'))); }
}