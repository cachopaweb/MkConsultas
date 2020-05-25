class Produto {
  int codigo;
  String nome;
  String quantidade;
  String valorv;

  Produto({this.codigo, this.nome, this.quantidade, this.valorv});
  
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      codigo: json['codigo'] as int,
      nome: json['nome'] as String,
      quantidade: json['quantidade'] as String,
      valorv: json['valorv'] as String,
    );
  }
}