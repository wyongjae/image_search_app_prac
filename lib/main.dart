import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/app_providers.dart';
import 'package:image_search_app_prac/presentation/pages.dart';

void main() {
  runApp(
    const AppProviders(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const Pages(),
    );
  }
}
