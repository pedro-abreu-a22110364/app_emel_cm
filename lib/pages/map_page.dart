import 'package:app_emel_cm/pages/pages.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/emelmap.png'),
            fit: BoxFit.cover, // Apanhamos o ecran inteirinho
          ),
        ),
      ),
    );
  }
}