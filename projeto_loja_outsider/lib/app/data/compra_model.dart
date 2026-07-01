class CompraModel {
  final String cor;
  final String tamanho;
  final int quantidade;
  final bool paraPresente;
  final int parcelas;
  final double valorTotal;

  CompraModel({
    required this.cor,
    required this.tamanho,
    required this.quantidade,
    required this.paraPresente,
    required this.parcelas,
    required this.valorTotal,
  });

  @override
  String toString() {
    return '''
====================================
      NOVO PEDIDO GERADO
====================================
Produto: Camiseta
Cor Selecionada: $cor
Tamanho Selecionado: $tamanho
Quantidade: $quantidade
Embalagem para Presente: ${paraPresente ? 'Sim' : 'Não'}
Forma de Pagamento: $parcelas x
Valor Total do Pedido: R\$ ${valorTotal.toStringAsFixed(2)}
====================================
''';
  }
}