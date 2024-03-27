import 'package:cometa/Consts/ConstsApp.dart';
import 'package:cometa/Models/Cliente.dart';
import 'package:cometa/Services/service_contracts.dart';
import 'package:dio/dio.dart';

class ClienteServiceCache extends IClienteService {
  var listaClientes = <ClienteModel>[];
  var listaFiltrada = <ClienteModel>[];

  List<ClienteModel> _filtrar(String busca) {
    listaFiltrada = listaClientes
        .where((e) => e.nome.toUpperCase().contains(busca.toUpperCase()))
        .toList();
    if (listaFiltrada.isEmpty) {
      listaFiltrada = listaClientes;
    }
    return listaFiltrada;
  }

  Future<List<ClienteModel>> fetchClientes(String search) async {
    BaseOptions options = new BaseOptions(
      baseUrl: ConstsApp.baseURL,
      connectTimeout: Duration(milliseconds: 50000),
      receiveTimeout: Duration(milliseconds: 50000),
    );

    Dio dio = new Dio(options);
    try {
      String url = '/cli/clientes.json';
      if (listaFiltrada.isEmpty) {
        var lista = <ClienteModel>[];
        final response = await dio.get(url);
        if (response.data is Map) {
          final map = response.data as Map<String, dynamic>;
          map.forEach((key, value) {
            lista.add(ClienteModel.fromMap(value as Map<String, dynamic>));
          });
        } else {
          if (response.data != null) {
            final listaAux = response.data as List;
            lista = listaAux.map((e) => ClienteModel.fromMap(e)).toList();
          }
        }
        listaFiltrada = listaClientes = lista;
        return listaFiltrada;
      } else {
        return _filtrar(search);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
