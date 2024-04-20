import 'dart:convert';

import 'package:app_emel_cm/models/tipo_parque.dart';
import 'package:app_emel_cm/pages/incidente_page.dart';
import 'package:app_emel_cm/pages/templates/parque_card.dart';
import 'package:app_emel_cm/repository/parque_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../models/parque.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Parque> parques = [];

  final parqueRepository = ParqueRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40.0,),
            buildDiaAtualWidget(context),
            Container (
              padding: const EdgeInsets.all(10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Meteorologia', style: TextStyle(fontSize: 20.0)),
                  Expanded (
                    child: Divider(
                      thickness: 3.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                  ),
                  Text('Sol', style: TextStyle(fontSize: 20.0)),
                  Icon(Icons.sunny),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Recomendamos', style: TextStyle(fontSize: 20.0)),
                  Expanded (
                    child: Divider(
                      thickness: 3.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                  ),
                  Text('Parques de superfície', style: TextStyle(fontSize: 20.0)),
                ],
              ),
            ),
            SizedBox(height: 50.0,),
            Expanded(
              child:
              buildList([TipoParque.SUPERFICIE, TipoParque.SUPERFICIE, TipoParque.SUPERFICIE]),
            ),
            SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text('REGISTRAR INCIDENTE', style: TextStyle(fontSize: 20.0)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder( // Shape of the button
                        borderRadius: BorderRadius.circular(10.0), // Square edges
                      ),
                      padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 20.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IncidentePage(parque: Parque.empty(),)));
                    },
                  ),
                ],
              ),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }

  Widget buildDiaAtualWidget(BuildContext context) {
    //weekday & month structure
    DateFormat dateFormat = DateFormat(
        "EEEE", Localizations.localeOf(context).toString());
    String weekday = dateFormat.format(DateTime.now());

    String locale = Localizations.localeOf(context).toString();
    DateFormat monthFormat = DateFormat("MMMM", locale);
    String month = monthFormat.format(DateTime.now());

    DateTime now = DateTime.now();
    return Text('$weekday, ${now.day} de $month de ${now.year}',
        style: TextStyle(fontSize: 20.0));
  }

  Widget buildList(List<TipoParque> tiposParque) {
    List<Parque> parques = [];
    // Aggregate parks from each type into a single list
    for (var tipo in tiposParque) {
      parques.addAll(parqueRepository.getParquesEstrutura(tipo)!);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (_, index) => ParqueCard(parque: parques[index]),
      itemCount: parques.length,
    );
  }

}


class Meteorologia {
  String weatherCondition = 'sunny';

  get http => null; // Vamos supor que isto venha de uma API

  Future<bool> fetchWeatherForecast() async {
    final link = await http.get(Uri.parse('https://www.ipma.pt/pt/otempo'
        '/prev.localidade.hora/#Lisboa&Lisboa'));

    if (link.statusCode == 200) {
      final weatherData = json.decode(link.body);
      final weatherToday = weatherData['data'][0];
      return weatherToday['idWeatherType'] == 1;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}




