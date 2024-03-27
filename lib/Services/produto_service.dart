import 'package:cometa/Consts/ConstsApp.dart';
import 'package:cometa/Models/Produto.dart';
import 'package:cometa/Services/service_contracts.dart';
import 'package:dio/dio.dart';

class ProdutoService extends IProdutoService {
  Future<List<ProdutoModel>> fetchProdutos(
      String search, TTipoBusca tipoBusca) async {
    BaseOptions options = new BaseOptions(
      baseUrl: ConstsApp.baseURL,
      connectTimeout: Duration(milliseconds: 50000),
      receiveTimeout: Duration(milliseconds: 50000),
    );

    Dio dio = new Dio(options);
    try {
      String url = '/prod/produtos.json';
      switch (tipoBusca) {
        case TTipoBusca.Codigo:
          {
            if (search.isEmpty) {
              url += '?orderBy="proCodigo"&limitToFirst=10&print=pretty';
            } else {
              url +=
                  '?orderBy="proCodigo"&limitToFirst=10&startAt=$search&print=pretty';
            }
            break;
          }
        case TTipoBusca.Descricao:
          {
            url +=
                '?orderBy="proDescricao"&limitToFirst=10&startAt="${search.toUpperCase()}"&endAt="${search.toUpperCase()}\uf8ff"&print=pretty';
            break;
          }
        case TTipoBusca.Nome:
          {
            url +=
                '?orderBy="proNome"&limitToFirst=10&startAt="${search.toUpperCase()}"&endAt="${search.toUpperCase()}\uf8ff"&print=pretty';
            break;
          }
      }
      final response = await dio.get(url);
      if (response.data is Map) {
        final map = response.data as Map<String, dynamic>;
        var lista = <ProdutoModel>[];
        map.forEach((key, value) {
          lista.add(ProdutoModel.fromMap(value as Map<String, dynamic>));
        });
        return lista;
      } else {
        if (response.data != null) {
          final lista = response.data as List;
          final resultado = lista.map((e) => ProdutoModel.fromMap(e)).toList();
          return resultado;
        } else {
          return [];
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
