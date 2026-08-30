import 'package:flutter/material.dart';
import '../utils/app_texts.dart';

class GameHeader extends StatelessWidget implements PreferredSizeWidget {
  const GameHeader({super.key, required this.titleKey});
  final String titleKey;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    title: const SizedBox.shrink(),
    actions: [
      IconButton(icon: const Icon(Icons.language), tooltip: AppTexts.get('language'), onPressed: () => _showLanguageDialog(context)),
    ],
  );

  void _showLanguageDialog(BuildContext context) => showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text('${AppTexts.get('language')} / Language', textAlign: TextAlign.center),
      content: Column(mainAxisSize: MainAxisSize.min, children: ['한국어', 'English', '日本語'].map((lang) => SizedBox(width: double.infinity, child: TextButton(onPressed: () async { await AppTexts.setLanguage(lang); if (dialogContext.mounted) Navigator.pop(dialogContext); }, child: Text(lang, style: TextStyle(fontWeight: AppTexts.currentLang == lang ? FontWeight.bold : FontWeight.normal))))).toList()),
    ),
  );
}
