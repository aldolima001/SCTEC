import 'tarefa.dart';
import 'tratamento_dados_api.dart';

class RelatorioOperacional {
  static void exibir(List<Tarefa> tarefas) {
    double totalDinheiroConcluidas = 0.0;
    int qtdConcluidas = 0;

    double totalDinheiroPendentes = 0.0;
    int qtdPendentes = 0;

    Map<String, int> horasPorStatus = {};

    for (var t in tarefas) {
      if (horasPorStatus.containsKey(t.status)) {
        horasPorStatus[t.status] = horasPorStatus[t.status]! + t.horas;
      } else {
        horasPorStatus[t.status] = t.horas;
      }

      if (t.status == "concluida") {
        totalDinheiroConcluidas += t.valor;
        qtdConcluidas++;
      } else if (t.status == "pendente") {
        totalDinheiroPendentes += t.valor;
        qtdPendentes++;
      }
    }

    double mediaConcluidas = qtdConcluidas == 0 ? 0.0 : totalDinheiroConcluidas / qtdConcluidas;
    double mediaPendentes = qtdPendentes == 0 ? 0.0 : totalDinheiroPendentes / qtdPendentes;

    // Pega as horas direto do mapa de forma segura
    int horasConcluidas = horasPorStatus['concluida'] ?? 0;
    int horasEmAndamento = horasPorStatus['em andamento'] ?? 0;
    int horasPendentes = horasPorStatus['pendente'] ?? 0;
    int horasCanceladas = horasPorStatus['cancelada'] ?? 0;

    print('=============================================================================================================');
    print('                                           TASKREPORT DART - SISTEMA DE TAREFAS                              ');
    print('=============================================================================================================');

    print('\n--> LISTA DE TAREFAS:');
    for (var t in tarefas) {
      t.mostrarResumo();
    }

    print('\n-------------------------------------------------------------------------------------------------------------');
    print('--> CUSTO FASES E HORAS UTILIZADAS:');
    print('Soma das Tarefas Concluídas  | Horas: ${horasConcluidas.toString().padLeft(2)}h       : R\$ ${totalDinheiroConcluidas.toStringAsFixed(2)}');
    print('Média das Tarefas Concluídas | Horas: ${horasEmAndamento.toString().padLeft(2)}h       : R\$ ${mediaConcluidas.toStringAsFixed(2)}');
    print('Soma das Tarefas Pendentes   | Horas: ${horasPendentes.toString().padLeft(2)}h       : R\$ ${totalDinheiroPendentes.toStringAsFixed(2)}');
    print('Média das Tarefas Pendentes  | Horas: ${horasCanceladas.toString().padLeft(2)}h       : R\$ ${mediaPendentes.toStringAsFixed(2)}');

    print('\n-------------------------------------------------------------------------------------------------------------');
    print('--> AVISOS DE ERROS ENCONTRADOS:');
    if (TratamentoDadosAPI.idsComInconsistencia.isEmpty) {
      print('Tudo certo! Nenhum erro encontrado nos dados da API.');
    } else {
      print('Aviso: Encontramos campos nulos ou errados na lista que veio da API.');
      print('Os erros foram corrigidos e os IDs com problema foram guardados no Set para não repetir:');
      print('IDs Corrigidos: ${TratamentoDadosAPI.idsComInconsistencia.toString()}');
    }
    print('================================================================================================\n');
  }
}