# Projeto TaskReport Dart - Simulador de Tarefas

Este é o meu projeto avaliativo de Dart Puro para a SCTEC (Módulo 01 - Semana 07). O objetivo do programa é simular o dia a dia de um desenvolvedor mobile que recebe uma lista de tarefas "suja" de uma API (com dados nulos, textos com espaços a mais e valores misturados) e precisa limpar tudo antes de mostrar na tela.

## 🔗 Links do Meu Trabalho
* **Meu Quadro no Trello:** [Clique aqui para ver o meu Trello](https://trello.com/invite/b/6a1c5427c362534a960f88b7/ATTIe751f88637f1c6cac7f3ddb8d3bb0b7f41FB01BF/taskreport-dart-sctec)
* **Vídeo Explicando o Código:** [Clique aqui para ver o meu vídeo](https://drive.google.com/file/d/1FLACCu8WouHxNHB5pnWu1MONd2i6w2if/view?usp=sharing)

---

## 🛠️ O que usei neste projeto (Matérias das Aulas)

Fiz o código de forma simples e direta, usando o que aprendemos ao longo do módulo:
* **Loops e Condições:** Usei o loop `for` tradicional para passar por cada item da lista e a estrutura `if / else` para fazer as validações.
* **Classes e Herança (POO):** Criei a classe base `Atividade` (que serve de molde com ID e título) e a classe filha `Tarefa`, que herda essa base e adiciona o responsável, status, prioridade, valor e horas.
* **Dados Protegidos (Encapsulamento):** Deixei o valor e as horas como privados (`_valor` e `_horas`) para garantir que o sistema não aceite números negativos.
* **Uso de List, Map e Set:** - `List` para guardar as tarefas organizadas.
    - `Map` para conseguir somar e agrupar as horas de cada status.
    - `Set` para guardar os IDs das tarefas que tinham erros na API, garantindo que nenhum ID apareça repetido na lista de alertas.

---

## 📂 Como organizei as minhas pastas

Coloquei os arquivos dentro da pasta `lib/` para ficar organizado e separei os formatadores para que possam ser reaproveitados em outras partes do sistema no futuro:

```text
taskreport-dart/
│
├── bin/
│   └── main.dart                 # Arquivo principal que executa o projeto
│
├── lib/                          # Onde ficam as minhas classes
│   ├── utilitarios/              # Pasta com as funções de limpar dados
│   │   ├── formatador_texto.dart # Remove espaços em branco de strings
│   │   └── formatador_monetario.dart # Transforma o texto "R$" em número double e trata as horas
│   │
│   ├── atividade.dart            # Classe base molde
│   ├── tarefa.dart               # Classe filha com os dados da tarefa
│   ├── tratamento_dados_api.dart # Lê a lista da API e corrige os erros
│   └── relatorio_operacional.dart# Faz as contas matemáticas e mostra o relatório final
│
└── tarefas-kanban.md