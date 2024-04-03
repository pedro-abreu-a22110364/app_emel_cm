import 'package:app_emel_cm/model/tipo_parque.dart';
import 'package:flutter/material.dart';

import 'templates/parque_card.dart';
import '../model/parque.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<Parque> parques = [
    Parque(idParque: 1, nome: "Campo Grande", lotacaoReal: 100, lotacaoMax: 200, tipoParque: TipoParque.SUPERFICIE),
    Parque(idParque: 2, nome: "Entrecampos", lotacaoReal: 2, lotacaoMax: 50, tipoParque: TipoParque.ESTRUTURA),
    Parque(idParque: 3, nome: "Campo Pequeno", lotacaoReal: 75, lotacaoMax: 75, tipoParque: TipoParque.ESTRUTURA)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: parques.map((parque) => ParqueCard(parque: parque)).toList(),
      )
    );
  }
}