import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/components/theme/my_themes.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = context.read<ThemeProvider>();
          provider.toggleTheme(value);
        });
  }
}