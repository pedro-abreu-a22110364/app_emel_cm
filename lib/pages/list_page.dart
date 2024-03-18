import 'package:app_emel_cm/pages/pages.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[2].title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(pages[2].icon, size: 100),
            Text(pages[2].title, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}