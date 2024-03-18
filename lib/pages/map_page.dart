import 'package:app_emel_cm/pages/pages.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[0].title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(pages[0].icon, size: 100),
            Text(pages[0].title, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}