// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_triple/flutter_triple.dart';

import 'package:cometa/Models/Produto.dart';
import 'package:cometa/Services/service_contracts.dart';

class ProdutoStore extends Store<List<ProdutoModel>> {
  final IProdutoService serviceProdutos;

  ProdutoStore(
    this.serviceProdutos,
  ) : super([]);

  Future<void> fetchProdutos(String search, TTipoBusca tipoBusca) async {
    execute(() => serviceProdutos.fetchProdutos(search, tipoBusca));
  }
}
