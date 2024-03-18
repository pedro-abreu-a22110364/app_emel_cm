import 'package:app_emel_cm/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
    return MaterialApp(
      title: 'Rexiga',
      theme: ThemeData(
          colorScheme: colorScheme,
          useMaterial3: true,
          appBarTheme: ThemeData.from(colorScheme: colorScheme).appBarTheme.copyWith(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.background,
          )
      ),
      home: MainPage(),
    );
  }
}