import 'package:app_emel_cm/models/incidente.dart';
import 'package:app_emel_cm/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../models/parque.dart';
import '../repository/parque_repository.dart';

class IncidentePage extends StatefulWidget {
  final Parque parque;

  const IncidentePage({super.key, required this.parque});

  @override
  State<IncidentePage> createState() => _IncidentePageState();
}

class _IncidentePageState extends State<IncidentePage> {
  final parqueRepository = ParqueRepository();
  final _formKey = GlobalKey<FormState>();

  String? _nome;
  DateTime? _data;
  String? _descricao;
  int? _gravidade;

  @override
  Widget build(BuildContext context) {
    final List<String>? itemsList = parqueRepository.getNomeParques();
    String? selectedValue = itemsList!.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registo de incidente'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButtonFormField(
                    items: itemsList
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.toString(),
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Nome do parque',
                      labelStyle: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'OpenSans',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Escolha um parque';
                      }
                      return null;
                    }),
                TextFormField(
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                      labelStyle: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'OpenSans',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Introduza uma descrição';
                      }
                      return null;
                    }),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final incidentModel = Incidente.empty();
                        incidentModel.nome = _nome;
                        incidentModel.data = _data;
                        incidentModel.descricao = _descricao;
                        incidentModel.gravidade = _gravidade;

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(parque: widget.parque)));
                      }
                    },
                    child: Text('Avançar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
