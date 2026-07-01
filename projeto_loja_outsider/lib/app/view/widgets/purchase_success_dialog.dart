import 'package:flutter/material.dart';

class PurchaseSuccessDialog extends StatelessWidget {
  final double totalValue;

  const PurchaseSuccessDialog({super.key, required this.totalValue});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 28),
          const SizedBox(width: 10),
          // SOLUÇÃO DO OVERFLOW: Expanded limita o espaço horizontal do texto e força a quebra de linha
          Expanded(
            child: const Text(
              'Compra Concluída!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Seu pedido foi processado com sucesso pela loja Outsider.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          Text(
            'Valor Total: R\$ ${totalValue.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
