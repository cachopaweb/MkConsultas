import 'package:MkConsultas/Models/Cliente.dart';
import 'package:dio/dio.dart';

Future<List<Cliente>> fetchClientes(String baseUrl) async {
   BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
  );
  Dio dio = new Dio(options);
  final response = await dio.get<List>("/Clientes");
  final resultado = response.data.map((json) => Cliente.fromJson(json)).toList();
  return resultado;
}

Future<Cliente> fetchCliente(int id, String baseUrl) async{
  BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
  );
  Dio dio = new Dio(options);
  final response = await dio.get("/Clientes/${id}");
  return Cliente.fromJson(response.data);
}