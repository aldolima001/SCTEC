import 'tarefa.dart';
import 'utilitarios/formatador_texto.dart';
import 'utilitarios/formatador_monetario.dart';

class TratamentoDadosAPI {
  static final Set<int> idsComInconsistencia = {};

  static List<Tarefa> paraListaDeTarefas(List<Map<String, dynamic>> dadosBrutos) {
    List<Tarefa> tarefasProntas = [];

    for (var registro in dadosBrutos) {
      int id = registro['id'] ?? 0;

      if (registro['titulo'] == null || 
          registro['responsavel'] == null || 
          registro['valor'] == null || 
          registro['horas'] == null) {
        idsComInconsistencia.add(id);
      }

      String tituloLimpo = FormatadorTexto.removerEspacos(registro['titulo']);
      String responsavelLimpo = FormatadorTexto.removerEspacos(registro['responsavel']);
      
      String tituloTratado = tituloLimpo.isEmpty ? "Sem Título" : tituloLimpo;
      String responsavelTratado = responsavelLimpo.isEmpty ? "Não Atribuído" : responsavelLimpo;

      String statusTratado = FormatadorTexto.removerEspacos(registro['status']).toLowerCase();
      String prioridadeTratada = FormatadorTexto.removerEspacos(registro['prioridade']).toLowerCase();

      double valorTratado = FormatadorMonetario.paraDouble(registro['valor']);
      int horasTratadas = FormatadorMonetario.paraInteiro(registro['horas']);

      tarefasProntas.add(
        Tarefa(
          id: id,
          titulo: tituloTratado,
          responsavel: responsavelTratado,
          status: statusTratado.isEmpty ? "pendente" : statusTratado,
          prioridade: prioridadeTratada.isEmpty ? "baixa" : prioridadeTratada,
          valor: valorTratado,
          horas: horasTratadas,
        ),
      );
    }

    return tarefasProntas;
  }
}