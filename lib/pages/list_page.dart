import 'package:app_emel_cm/model/tipo_parque.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'templates/parque_card.dart';
import '../model/parque.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Parque> parques = [
    Parque(idParque: 1, nome: "Campo Grande", lotacaoReal: 100, lotacaoMax: 200, tipoParque: TipoParque.SUPERFICIE, distancia: 600, preco: 1.10),
    Parque(idParque: 2, nome: "Entrecampos", lotacaoReal: 2, lotacaoMax: 50, tipoParque: TipoParque.ESTRUTURA, distancia: 1000, preco: 1.20),
    Parque(idParque: 3, nome: "Campo Pequeno", lotacaoReal: 75, lotacaoMax: 75, tipoParque: TipoParque.ESTRUTURA, distancia: 300, preco: 1.15)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
      children: parques.map((parque) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => DetailPage(parque: parque),
              ),
            );
          },
          child: ParqueCard(parque: parque),
        );
      }).toList(),
    ),
    );
  }
}

class ParquesRepositorio extends State<ListPage>{
  List<Parque> parques = [
      Parque(idParque: 1, nome: "Campo Grande", lotacaoReal: 100, lotacaoMax: 200, tipoParque: TipoParque.SUPERFICIE, distancia: 600, preco: 1.10, ),
      Parque(idParque: 2, nome: "Entrecampos", lotacaoReal: 2, lotacaoMax: 50, tipoParque: TipoParque.ESTRUTURA, distancia: 1000, preco: 1.20, ),
      Parque(idParque: 3, nome: "Campo Pequeno", lotacaoReal: 75, lotacaoMax: 75, tipoParque: TipoParque.ESTRUTURA, distancia: 300, preco: 1.15)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          children: parques.map((parque) => ParqueCard(parque: parque))
              .toList(),
        )
    );
  }
}
