import 'package:app_emel_cm/pages/pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[1].title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(pages[1].icon, size: 100),
            Text(pages[1].title, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}