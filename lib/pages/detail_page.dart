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
        title: Text(widget.parque.nome),
      ),
      body: Center(
        child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0,),
              Text('Distância'),
              Text('${widget.parque.distancia}'),
              Expanded (
                  child: Divider(
                    thickness: 3.0,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
              ),
              Text('Tipo de parque'),
              Text('${widget.parque.tipoParque.name}'),
              Expanded (
                child: Divider(
                  thickness: 3.0,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
              ),
              Text('Lotação'),
              Text('${widget.parque.estadoParque}'),
              Expanded (
                child: Divider(
                  thickness: 3.0,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
              ),
              Text('Horário de pagamento'),
              Text('2º a 6º - 7h00 às 24h00'),
              Expanded (
                child: Divider(
                  thickness: 3.0,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
              ),
              Text('Preço'),
              Text('${widget.parque.preco}'),
              SizedBox(height: 5,),
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
                      print('click me');
                      //Apagar mais tarde
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
}
