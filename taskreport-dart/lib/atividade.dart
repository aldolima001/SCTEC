abstract class Atividade {
  int id;
  String titulo;

  Atividade({
    required this.id,
    required this.titulo,
  });

  void mostrarResumo() {
    print("Atividade #$id - Título: $titulo");
  }
}