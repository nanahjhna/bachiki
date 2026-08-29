import 'dart:async';
import 'package:flutter/material.dart';
import 'pause_overlay.dart';
import '../utils/app_texts.dart';

class GamePlayView extends StatefulWidget {
  const GamePlayView({super.key});
  @override
  State<GamePlayView> createState() => _GamePlayViewState();
}

class _GamePlayViewState extends State<GamePlayView> {
  int _timeLeft = 30;
  int _bossHp = 100;
  Timer? _timer;

  @override
  void didChangeDependencies() { super.didChangeDependencies(); _timer ??= _newTimer(); }
  Timer _newTimer() => Timer.periodic(const Duration(seconds: 1), (_) { if (!mounted || _timeLeft <= 0) { _finish(false); } else { setState(() => _timeLeft--); } });
  void _startTimer() { _timer?.cancel(); _timer = _newTimer(); }
  void _attack() { if (_bossHp <= 0) return; setState(() => _bossHp = (_bossHp - 10).clamp(0, 100)); if (_bossHp == 0) _finish(true); }
  void _finish(bool victory) { _timer?.cancel(); if (mounted) Navigator.pushReplacementNamed(context, '/result', arguments: {'victory': victory, 'stage': ModalRoute.of(context)?.settings.arguments ?? 1}); }
  @override
  void dispose() { _timer?.cancel(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final stage = ModalRoute.of(context)?.settings.arguments as int? ?? 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('STAGE $stage'),
        actions: [
          // 상단 앱바에 일시정지 버튼 배치
          IconButton(
            icon: const Icon(Icons.pause),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => PauseOverlay(onPause: () => _timer?.cancel(), onResume: _startTimer),
              );
            },
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(24), child: Column(children: [
        Text('$_timeLeft', style: const TextStyle(fontSize: 42, fontWeight: FontWeight.w900, color: Color(0xFFFFD166))),
        const SizedBox(height: 12), const Text('BOSS', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8), LinearProgressIndicator(value: _bossHp / 100, minHeight: 16, borderRadius: const BorderRadius.all(Radius.circular(10)), color: Colors.red),
        const SizedBox(height: 6), Text('HP $_bossHp / 100'), const Spacer(),
        const Text('Tap ATTACK repeatedly before time runs out.'), const SizedBox(height: 14),
        SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: _attack, icon: const Icon(Icons.touch_app), label: Text('${AppTexts.get('play')} ATTACK', style: const TextStyle(fontSize: 18)))),
      ])),
    );
  }
}
