import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
enum TTipoBusca { Codigo, Descricao, Nome }

class ProdutoModel {
  final int proCodigo;
  final String proAbc;
  final String proAbcAnalitico;
  final double proQuantidade;
  final String proLocal;
  final String proDescricao;
  final String proNome;
  final double proValorc;
  final double proValorcm;
  final double proValorf;
  final double proValorl;
  final double proValorv;
  final String proDataua;
  final String proDatauc;
  final String forNome;

  ProdutoModel({
    required this.proCodigo,
    required this.proAbc,
    required this.proAbcAnalitico,
    required this.proQuantidade,
    required this.proLocal,
    required this.proDescricao,
    required this.proNome,
    required this.proValorc,
    required this.proValorcm,
    required this.proValorf,
    required this.proValorl,
    required this.proValorv,
    required this.proDataua,
    required this.proDatauc,
    required this.forNome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'proCodigo': proCodigo,
      'proAbc': proAbc,
      'proAbcAnalitico': proAbcAnalitico,
      'proQuantidade': proQuantidade,
      'proLocal': proLocal,
      'proDescricao': proDescricao,
      'proNome': proNome,
      'proValorc': proValorc,
      'proValorcm': proValorcm,
      'proValorf': proValorf,
      'proValorl': proValorl,
      'proValorv': proValorv,
      'proDataua': proDataua,
      'proDatauc': proDatauc,
      'forNome': forNome,
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      proCodigo: map['proCodigo'] as int,
      proAbc: (map['proAbc'] ?? '') as String,
      proAbcAnalitico: (map['proAbcAnalitico'] ?? '') as String,
      proQuantidade: (map['proQuantidade'] / 100 * 100 ?? 0.0) as double,
      proLocal: (map['proLocal'] ?? '') as String,
      proDescricao: (map['proDescricao'] ?? '') as String,
      proNome: (map['proNome'] ?? '') as String,
      proValorc: (map['proValorc'] / 100 * 100 ?? 0.0) as double,
      proValorcm: (map['proValorcm'] / 100 * 100 ?? 0.0) as double,
      proValorf: (map['proValorf'] / 100 * 100 ?? 0.0) as double,
      proValorl: (map['proValorl'] / 100 * 100 ?? 0.0) as double,
      proValorv: (map['proValorv'] / 100 * 100 ?? 0.0) as double,
      proDataua: (map['proDataua'] ?? '') as String,
      proDatauc: (map['proDatauc'] ?? '') as String,
      forNome: (map['forNome'] ?? '') as String,
    );
  }

  factory ProdutoModel.Empty() {
    return ProdutoModel(
      proCodigo: 0,
      proAbc: '',
      proAbcAnalitico: '',
      proQuantidade: 0,
      proLocal: '',
      proDescricao: '',
      proNome: '',
      proValorc: 0,
      proValorcm: 0,
      proValorf: 0,
      proValorl: 0,
      proValorv: 0,
      proDataua: '',
      proDatauc: '',
      forNome: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
