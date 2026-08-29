import 'package:flutter/material.dart';

class LoadingView extends StatefulWidget { const LoadingView({super.key}); @override State<LoadingView> createState() => _LoadingViewState(); }
class _LoadingViewState extends State<LoadingView> {
  @override void initState() { super.initState(); Future.delayed(const Duration(milliseconds: 900), () { if (mounted) Navigator.pushReplacementNamed(context, '/'); }); }
  @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [CircularProgressIndicator(), SizedBox(height: 18), Text('데이터를 불러오는 중입니다...')])));
}
