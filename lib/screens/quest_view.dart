import 'package:flutter/material.dart';
import '../widgets/game_bottom_navigation.dart';
import '../widgets/game_header.dart';

class QuestView extends StatefulWidget {
  const QuestView({super.key});

  @override
  State<QuestView> createState() => _QuestViewState();
}

class _QuestViewState extends State<QuestView> with SingleTickerProviderStateMixin {
  late final TabController _tab = TabController(length: 2, vsync: this);
  final claimed = <int>{};

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const GameHeader(titleKey: 'quest'),
    body: Column(
      children: [
        TabBar(
          controller: _tab,
          tabs: const [
            Tab(text: '일일 퀘스트'),
            Tab(text: '업적'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tab,
            children: [
              _list('일일', 3),
              _list('업적', 5),
            ],
          ),
        ),
      ],
    ),
    bottomNavigationBar: const GameBottomNavigation(),
  );

  Widget _list(String type, int done) => ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: 4,
    itemBuilder: (_, i) {
      final ready = i < 2;
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$type 미션 ${i + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              LinearProgressIndicator(value: ready ? 1 : .4),
              const SizedBox(height: 4),
              Text(ready ? '$done / $done' : '2 / 5'),
              Align(
                alignment: Alignment.centerRight,
                child: claimed.contains(i)
                    ? const Text('수령 완료')
                    : ElevatedButton(
                  onPressed: ready ? () => setState(() => claimed.add(i)) : null,
                  child: const Text('보상 받기'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
