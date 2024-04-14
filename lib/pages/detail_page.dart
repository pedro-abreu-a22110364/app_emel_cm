import 'package:app_emel_cm/pages/incidente_page.dart';
import 'package:flutter/material.dart';
import 'package:app_emel_cm/models/parque.dart';

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
        title: Text(widget.parque.nome!),
        centerTitle: true,
      ),
      body: Center(
        child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20.0,),
              const Text('Distância'),
              Text('${widget.parque.distancia}'),
              buildDivider(),
              const Text('Tipo de parque'),
              Text(widget.parque.tipoParque!.name),
              buildDivider(),
              const Text('Lotação'),
              Text(widget.parque.calculaEstadoParque().name),
              buildDivider(),
              const Text('Horário de pagamento'),
              const Text('2º a 6º - 7h00 às 24h00'),
              buildDivider(),
              const Text('Preço'),
              Text('${widget.parque.preco}'),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
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
                              builder: (context) => IncidentePage(parque: widget.parque)));
                    },
                    child: const Text('REGISTRAR INCIDENTE', style: TextStyle(fontSize: 20.0)),
                  ),
                ],
              ),
          ],

        ),

      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded (
                child: Divider(
                  thickness: 3.0,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
            );
  }
}
