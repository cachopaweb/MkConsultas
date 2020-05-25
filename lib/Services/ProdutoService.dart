import 'package:MkConsultas/Consts/ConstsApp.dart';
import 'package:MkConsultas/Models/Produto.dart';
import 'package:dio/dio.dart';

Future<List<Produto>> fetchProdutos(String baseUrl) async {  
  BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
  );

  Dio dio = new Dio(options);
  final response = await dio.get<List>('/Produtos');
   final resultado = response.data.map((json) => Produto.fromJson(json)).toList();
  return resultado;
}