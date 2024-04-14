import '../models/parque.dart';
import '../models/tipo_parque.dart';

class ParqueRepository {

  List<Parque> getParques() {
    return [
      Parque(idParque: 1, nome: "Campo Grande", lotacaoReal: 100, lotacaoMax: 200, tipoParque: TipoParque.SUPERFICIE, distancia: 600, preco: 1.10),
      Parque(idParque: 2, nome: "Entrecampos", lotacaoReal: 2, lotacaoMax: 50, tipoParque: TipoParque.ESTRUTURA, distancia: 1000, preco: 1.20),
      Parque(idParque: 3, nome: "Campo Pequeno", lotacaoReal: 75, lotacaoMax: 75, tipoParque: TipoParque.ESTRUTURA, distancia: 300, preco: 1.15)
    ];
  }

  List<Parque>? getParquesEstrutura(TipoParque tipoParque) {
    List<Parque> parques = getParques();

    List<Parque> filteredList = [for (var obj in parques) if (obj.tipoParque == tipoParque) obj];

    if (filteredList.length < 3) {
      return filteredList;
    }
    return filteredList.take(3).toList();
  }

  List<String>? getNomeParques() {
    List<Parque> parques = getParques();

    List<String> nomesParqueList = parques.map((parque) => parque.nome!).toList();

    return nomesParqueList;
  }

  Parque? getParque (int id) {
    List<Parque> parques = getParques();

    for (int i = 0; i < parques.length; i++) {
      if (parques[i].idParque == id) {
        return parques[i];
      }
    }
    return null;
  }

}