import 'package:app_emel_cm/models/estado_parque.dart';
import 'package:app_emel_cm/models/tipo_parque.dart';
import 'package:app_emel_cm/models/incidente.dart';

class Parque {
  int? idParque;
  String? nome;
  int? lotacaoReal;
  int? lotacaoMax;
  DateTime? data;
  int? distancia;
  double? preco;
  TipoParque? tipoParque;
  EstadoParque? estadoParque;
  List<Incidente>? incidentes;


  Parque.empty();

  Parque(
      {
        required this.idParque,
        required this.nome,
        required this.lotacaoReal,
        required this.lotacaoMax,
        required this.tipoParque,
        required this.distancia,
        required this.preco
      });

  EstadoParque calculaEstadoParque() {
    if (lotacaoReal! - lotacaoMax! == 0) {
      return EstadoParque.LOTADO;
    } else if ((lotacaoReal! * 100) / lotacaoMax! >= 50) {
      return EstadoParque.PARCIALMENTE_LOTADO;
    } else {
      return EstadoParque.LIVRE;
    }
  }
}
