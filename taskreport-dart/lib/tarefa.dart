import 'atividade.dart';

class Tarefa extends Atividade {
  String responsavel;
  String status;
  String prioridade;

  double _valor;
  int _horas;

  Tarefa({
    required int id,
    required String titulo,
    required this.responsavel,
    required this.status,
    required this.prioridade,
    required double valor,
    required int horas,
  })  : _valor = valor >= 0 ? valor : 0.0,
        _horas = horas >= 0 ? horas : 0,
        super(id: id, titulo: titulo);

  double get valor => _valor;
  int get horas => _horas;

  set valor(double novoValor) {
    if (novoValor >= 0) _valor = novoValor;
  }

  set horas(int novasHoras) {
    if (novasHoras >= 0) _horas = novasHoras;
  }

  @override
  void mostrarResumo() {
    print("Tarefa #$id - ${titulo.padRight(32)} | Responsável: ${responsavel.padRight(14)} | Status: ${status.padRight(13)} | Valor: R\$ ${_valor.toStringAsFixed(2).padLeft(6)} | Horas: ${_horas}h");
  }
}