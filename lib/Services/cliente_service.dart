import 'package:cometa/Consts/ConstsApp.dart';
import 'package:cometa/Models/Cliente.dart';
import 'package:cometa/Services/service_contracts.dart';
import 'package:dio/dio.dart';

class ClienteService extends IClienteService {
  Future<List<ClienteModel>> fetchClientes(String search) async {
    BaseOptions options = new BaseOptions(
      baseUrl: ConstsApp.baseURL,
      connectTimeout: Duration(milliseconds: 50000),
      receiveTimeout: Duration(milliseconds: 50000),
    );

    Dio dio = new Dio(options);
    try {
      String url =
          '/cli/clientes.json?orderBy="nome"&limitToFirst=20&startAt="${search.toUpperCase()}"&endAt="${search.toUpperCase()}\uf8ff"&print=pretty';
      final response = await dio.get(url);
      if (response.data is Map) {
        final map = response.data as Map<String, dynamic>;
        var lista = <ClienteModel>[];
        map.forEach((key, value) {
          lista.add(ClienteModel.fromMap(value as Map<String, dynamic>));
        });
        return lista;
      } else {
        if (response.data != null) {
          final lista = response.data as List;
          final resultado = lista.map((e) => ClienteModel.fromMap(e)).toList();
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
