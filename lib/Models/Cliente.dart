// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResumoModel {
  final double cheques;
  final double juros;
  final double subTotalFat;
  final double subTotalGeral;
  final double subTotalNFat;
  final double totalGeral;
  final double valorVencer;
  final double valorVencido;

  ResumoModel({
    required this.cheques,
    required this.juros,
    required this.subTotalFat,
    required this.subTotalGeral,
    required this.subTotalNFat,
    required this.totalGeral,
    required this.valorVencer,
    required this.valorVencido,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cheques': cheques,
      'juros': juros,
      'subTotalFat': subTotalFat,
      'subTotalGeral': subTotalGeral,
      'subTotalNFat': subTotalNFat,
      'totalGeral': totalGeral,
      'valorVencer': valorVencer,
      'valorVencido': valorVencido,
    };
  }

  factory ResumoModel.fromMap(Map<String, dynamic> map) {
    return ResumoModel(
      cheques: map['cheques'] / 100 * 100 as double,
      juros: map['juros'] / 100 * 100 as double,
      subTotalFat: map['subTotalFat'] / 100 * 100 as double,
      subTotalGeral: map['subTotalGeral'] / 100 * 100 as double,
      subTotalNFat: map['subTotalNFat'] / 100 * 100 as double,
      totalGeral: map['totalGeral'] / 100 * 100 as double,
      valorVencer: map['valorVencer'] / 100 * 100 as double,
      valorVencido: map['valorVencido'] / 100 * 100 as double,
    );
  }

  factory ResumoModel.Empty() {
    return ResumoModel(
      cheques: 0,
      juros: 0,
      subTotalFat: 0,
      subTotalGeral: 0,
      subTotalNFat: 0,
      totalGeral: 0,
      valorVencer: 0,
      valorVencido: 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResumoModel.fromJson(String source) =>
      ResumoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ClienteModel {
  final int codigo;
  final String nome;
  final ResumoModel? resumo;

  ClienteModel({required this.codigo, required this.nome, this.resumo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
      'resumo': resumo?.toMap(),
    };
  }

  factory ClienteModel.fromMap(Map<String, dynamic> map) {
    return ClienteModel(
      codigo: map['codigo'] as int,
      nome: map['nome'] as String,
      resumo: map['resumo'] != null && map['resumo'].toString() != "{}"
          ? ResumoModel.fromMap(map['resumo'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClienteModel.fromJson(String source) =>
      ClienteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
