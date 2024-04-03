import 'package:app_emel_cm/model/estado_parque.dart';
import 'package:app_emel_cm/model/tipo_parque.dart';
import 'package:app_emel_cm/model/incidente.dart';

class Parque {
  int idParque;
  String nome;
  int lotacaoReal;
  int lotacaoMax;
  DateTime? data;
  TipoParque tipoParque;
  EstadoParque? estadoParque;
  List<Incidente>? incidentes;

  Parque(
      {required this.idParque,
      required this.nome,
      required this.lotacaoReal,
      required this.lotacaoMax,
      required this.tipoParque
      });

  EstadoParque calculaEstadoParque() {
    if (lotacaoReal - lotacaoMax == 0) {
      return EstadoParque.LOTADO;
    } else if ((lotacaoReal * 100) / lotacaoMax >= 50) {
      return EstadoParque.PARCIALMENTE_LOTADO;
    } else {
      return EstadoParque.LIVRE;
    }
  }
}
