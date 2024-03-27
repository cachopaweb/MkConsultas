import 'dart:async';

import 'package:cometa/Consts/ConstsApp.dart';
import 'package:cometa/Models/Produto.dart';
import 'package:dio/dio.dart';

class ProdutoBloc {
  final String baseUrl = ConstsApp.baseURL;

  final StreamController<String> _streamController = StreamController<String>();
  Sink<String> get input => _streamController.sink;
  Stream<List<ProdutoModel>> get output => _streamController.stream
      .where((event) => event.length > 3)
      .asyncMap((event) => fetchProdutos(event));

  Future<List<ProdutoModel>> fetchProdutos(String pesquisa) async {
    BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: 50000),
      receiveTimeout: Duration(milliseconds: 5000),
    );

    Dio dio = new Dio(options);
    try {
      final response = await dio
          .get('/produtos.json?orderBy="proDescricao"&limitToFirst=50');
      // final response = await dio.get('/produtos.json');
      final lista = response.data as List;
      final resultado = lista
          .map((e) => ProdutoModel.fromMap(e as Map<String, dynamic>))
          .toList();
      return resultado;
    } catch (e) {
      throw Exception(e);
    }
  }

  close() {
    _streamController.close();
  }
}
