import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Consts/ConstsApp.dart';
import 'Models/Cliente.dart';
import 'Models/Produto.dart';
import 'Pages/cliente_datail.dart';
import 'Pages/clientes_page.dart';
import 'Pages/home_page.dart';
import 'Pages/produto_detail.dart';
import 'Pages/produtos_page.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cometa Consultas',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.lightBlue,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
          ),
          primarySwatch: Colors.lightBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          iconTheme: IconThemeData(color: Colors.white)),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/produtos': (context) => ProdutosPage(baseUrl: ConstsApp.baseURL),
        '/produto_detalhes': (context) {
          final produto =
              ModalRoute.of(context)!.settings.arguments as ProdutoModel;
          return ProdutoDetail(produto: produto);
        },
        '/clientes': (context) => ClientesPage(baseUrl: ConstsApp.baseURL),
        '/clientes_detalhes': (context) {
          final cliente =
              ModalRoute.of(context)!.settings.arguments as ClienteModel;
          return ClienteDetail(
              resumoModel: cliente.resumo ?? ResumoModel.Empty());
        },
      },
    );
  }
}
