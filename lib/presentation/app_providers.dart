import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/theme/my_themes.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  const AppProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Loading()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: child,
    );
  }
}
