import 'package:flutter/material.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key, this.embedded = false});
  final bool embedded;

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> with SingleTickerProviderStateMixin {
  late final TabController _tab = TabController(length: 3, vsync: this);

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      children: [
        TabBar(
          controller: _tab,
          tabs: const [
            Tab(text: '전체'),
            Tab(text: '장비'),
            Tab(text: '소모품'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tab,
            children: List.generate(
              3,
                  (_) => GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: .78,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, i) => InkWell(
                  onTap: () => _detail(i),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          i.isEven ? Icons.shield : Icons.healing,
                          color: const Color(0xFFFFD166),
                        ),
                        Text(
                          'Item ${i + 1}',
                          style: const TextStyle(fontSize: 11),
                        ),
                        const Text(
                          'x1',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

    return widget.embedded
        ? content
        : Scaffold(
      appBar: AppBar(title: const Text('INVENTORY')),
      body: content,
    );
  }

  void _detail(int i) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Item ${i + 1}'),
      content: const Text('모험에 도움이 되는 아이템입니다.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('판매'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('사용'),
        ),
      ],
    ),
  );
}