import 'package:flutter/material.dart';
import 'package:image_search_app_prac/presentation/components/loading.dart';
import 'package:image_search_app_prac/presentation/components/theme/my_themes.dart';
import 'package:image_search_app_prac/presentation/pages.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Loading()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: const Pages(),
      ),
    );
  }
}
