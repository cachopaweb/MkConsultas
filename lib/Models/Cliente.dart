// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResumoModel {
  final double Cheques;
  final double Juros;
  final double SubTotalFat;
  final double SubTotalGeral;
  final double SubTotalNFat;
  final double TotalGeral;
  final double ValorVencer;
  final double ValorVencido;

  ResumoModel({
    required this.Cheques,
    required this.Juros,
    required this.SubTotalFat,
    required this.SubTotalGeral,
    required this.SubTotalNFat,
    required this.TotalGeral,
    required this.ValorVencer,
    required this.ValorVencido,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Cheques': Cheques,
      'Juros': Juros,
      'SubTotalFat': SubTotalFat,
      'SubTotalGeral': SubTotalGeral,
      'SubTotalNFat': SubTotalNFat,
      'TotalGeral': TotalGeral,
      'ValorVencer': ValorVencer,
      'ValorVencido': ValorVencido,
    };
  }

  factory ResumoModel.fromMap(Map<String, dynamic> map) {
    return ResumoModel(
      Cheques: map['Cheques'] / 100 * 100 as double,
      Juros: map['Juros'] / 100 * 100 as double,
      SubTotalFat: map['SubTotalFat'] / 100 * 100 as double,
      SubTotalGeral: map['SubTotalGeral'] / 100 * 100 as double,
      SubTotalNFat: map['SubTotalNFat'] / 100 * 100 as double,
      TotalGeral: map['TotalGeral'] / 100 * 100 as double,
      ValorVencer: map['ValorVencer'] / 100 * 100 as double,
      ValorVencido: map['ValorVencido'] / 100 * 100 as double,
    );
  }

  factory ResumoModel.Empty() {
    return ResumoModel(
      Cheques: 0,
      Juros: 0,
      SubTotalFat: 0,
      SubTotalGeral: 0,
      SubTotalNFat: 0,
      TotalGeral: 0,
      ValorVencer: 0,
      ValorVencido: 0,
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
