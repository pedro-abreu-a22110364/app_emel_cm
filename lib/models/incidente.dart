class Incidente {
  String? nome;
  DateTime? data;
  String? descricao;
  int? gravidade;

  Incidente.empty();

  Incidente({
    required this.nome,
    required this.data,
    required this.descricao,
    required this.gravidade
  });

}