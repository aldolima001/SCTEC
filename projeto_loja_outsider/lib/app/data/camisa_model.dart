// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CamisaModel {
  final double precoBase;
  final double valorPresente;
  final int maxParcelas;
  final double jurosPorParcela;
  final List<String> tamanhosDisponiveis;
  final List<Map<String, dynamic>> modelos;
  CamisaModel({
    required this.precoBase,
    required this.valorPresente,
    required this.maxParcelas,
    required this.jurosPorParcela,
    required this.tamanhosDisponiveis,
    required this.modelos,
  });

  factory CamisaModel.fromMap(Map<String, dynamic> map) {
    return CamisaModel(
      precoBase: map['precoBase'] as double,
      valorPresente: map['valorPresente'] as double,
      maxParcelas: map['maxParcelas'] as int,
      jurosPorParcela: map['jurosPorParcela'] as double,
      tamanhosDisponiveis: List.from(map['tamanhosDisponiveis']),
      modelos: List.from(map['modelos']),
    );
  }

  factory CamisaModel.fromJson(String source) =>
      CamisaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
