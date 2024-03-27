import 'dart:convert';

import 'package:cometa/Models/Cliente.dart';
import 'package:cometa/Models/Produto.dart';
import 'package:flutter/services.dart';

import 'service_contracts.dart';

class ClienteServiceJson extends IClienteService {
  @override
  Future<List<ClienteModel>> fetchClientes(String search) async {
    try {
      final response = await rootBundle.loadString('assets/clientes.json');
      final decoded = jsonDecode(response);
      final list = decoded as List;
      return list.map((e) => ClienteModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

class ProdutoServiceJson extends IProdutoService {
  @override
  Future<List<ProdutoModel>> fetchProdutos(
      String search, TTipoBusca tipoBusca) async {
    try {
      final response = await rootBundle.loadString('assets/produtos.json');
      final decoded = jsonDecode(response);
      final list = decoded as List;
      return list.map((e) => ProdutoModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
