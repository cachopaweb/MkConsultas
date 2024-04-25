import 'package:cometa/Consts/ConstsApp.dart';
import 'package:cometa/Models/Produto.dart';
import 'package:cometa/Services/service_contracts.dart';
import 'package:dio/dio.dart';

class ProdutoServiceCache extends IProdutoService {
  var listaFiltrada = <ProdutoModel>[];
  var listaProdutos = <ProdutoModel>[];

  List<ProdutoModel> _filtrar(TTipoBusca tipoBusca, String busca) {
    switch (tipoBusca) {
      case TTipoBusca.Codigo:
        listaFiltrada = listaProdutos
            .where((e) => e.proCodigo.toString().contains(busca))
            .toList();
        break;
      case TTipoBusca.Descricao:
        listaFiltrada = listaProdutos
            .where((e) =>
                e.proDescricao.toUpperCase().contains(busca.toUpperCase()))
            .toList();
        break;
      case TTipoBusca.Nome:
        listaFiltrada = listaProdutos
            .where((e) => e.proNome.toUpperCase().contains(busca.toUpperCase()))
            .toList();
        break;
    }
    if (listaFiltrada.isEmpty) {
      listaFiltrada = listaProdutos;
    }
    return listaFiltrada;
  }

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
      if (listaFiltrada.isEmpty) {
        var lista = <ProdutoModel>[];
        final response = await dio.get(url);
        if (response.data is Map) {
          final map = response.data as Map<String, dynamic>;
          map.forEach((key, value) {
            lista.add(ProdutoModel.fromMap(value as Map<String, dynamic>));
          });
          return lista;
        } else {
          if (response.data != null) {
            final auxLista = response.data as List;
            lista = auxLista.map((e) => ProdutoModel.fromMap(e)).toList();
          }
        }
        listaFiltrada = listaProdutos = lista;
        return listaFiltrada;
      } else {
        return _filtrar(tipoBusca, search);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
