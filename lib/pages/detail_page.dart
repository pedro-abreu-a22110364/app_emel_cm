import 'package:flutter/material.dart';
import 'package:app_emel_cm/model/parque.dart';

class DetailPage extends StatefulWidget {
  final Parque parque;

  const DetailPage({super.key, required this.parque});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.parque.nome),
      ),
      body: Center(
        child: Text('Lotação atual: ${widget.parque.lotacaoReal}'),
      ),
    );
  }
}
