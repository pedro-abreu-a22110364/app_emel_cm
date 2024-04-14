import 'package:app_emel_cm/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../../models/parque.dart';

class ParqueCard extends StatelessWidget {
  late Parque parque;

  ParqueCard({super.key, required this.parque});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(parque: parque)));
      },
      child: Card(
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
          )),
    );
  }
}
