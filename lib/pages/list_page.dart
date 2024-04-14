import 'package:flutter/material.dart';
import '../repository/parque_repository.dart';
import 'templates/parque_card.dart';
import '../models/parque.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Parque> parques = [];

  final parqueRepository = ParqueRepository();

  @override
  Widget build(BuildContext context) {
    parques = parqueRepository.getParques();

    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: parques.length,
        itemBuilder: (context, index) {
          return ParqueCard(parque: parques[index]);
        },
      ),
    );
  }
}
