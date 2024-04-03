import 'package:flutter/material.dart';
import '../../model/parque.dart';

class ParqueCard extends StatelessWidget {

  late Parque parque;
  ParqueCard ({super.key, required this.parque});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                parque.nome,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                "${parque.lotacaoReal}/${parque.lotacaoMax}",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        )
    );
  }
}