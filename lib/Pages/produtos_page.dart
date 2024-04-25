import 'dart:async';
import 'package:cometa/Models/Produto.dart';
import 'package:cometa/stores/produto_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/produto_service_cache.dart';

class ProdutosPage extends StatefulWidget {
  final String baseUrl;

  ProdutosPage({required this.baseUrl});

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  var f = NumberFormat.currency(locale: 'pt_BR', decimalDigits: 2, symbol: '');
  final controllerSearchEdit = TextEditingController();
  String search = '';
  bool isSearching = false;
  bool isLoading = false;
  TTipoBusca tipoBusca = TTipoBusca.Descricao;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final storeProduto = ProdutoStore(ProdutoServiceCache());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('tipo_busca') ?? "");
    }).then(
      (value) => {
        setState(() {
          switch (value) {
            case 'codigo':
              tipoBusca = TTipoBusca.Codigo;
              break;
            case 'descricao':
              tipoBusca = TTipoBusca.Descricao;
              break;
            case 'nome':
              tipoBusca = TTipoBusca.Nome;
              break;
          }
        })
      },
    );
  }

  bool onlyNumber(String value) {
    bool result = false;
    result = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value);
    return result;
  }

  Widget _buildListaProdutos(ProdutoModel produto) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/produto_detalhes', arguments: produto)
            .then((value) {
          setState(() {
            search = '';
            controllerSearchEdit.clear();
          });
        });
      },
      child: Card(
        elevation: 5,
        child: ListTile(
          key: Key(produto.proCodigo.toString()),
          title: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Código"),
                  Text(
                    produto.proCodigo.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Descrição"),
                  Text(
                    produto.proDescricao
                        .toString()
                        .trim()
                        .padRight(13)
                        .substring(0, 13),
                    style: TextStyle(
                        fontFamily: 'Courier New', fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Qtd."),
                  Text(
                    produto.proQuantidade.toStringAsFixed(0),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Valor"),
                  Text(
                    '${f.format(produto.proValorv)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          subtitle: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Nome"),
                  Text(
                    produto.proNome
                        .toString()
                        .trimRight()
                        .padRight(27)
                        .substring(0, 27),
                    style: TextStyle(
                        fontFamily: 'Courier New', fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Local"),
                  Text(produto.proLocal.toString().padRight(9).substring(0, 9),
                      style: TextStyle(
                          fontFamily: 'Courier New',
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: !isSearching
            ? Text(
                'Produtos',
                style: TextStyle(color: Colors.white),
              )
            : TextField(
                style: TextStyle(color: Colors.white),
                autofocus: true,
                controller: controllerSearchEdit,
                keyboardType: tipoBusca == TTipoBusca.Codigo
                    ? TextInputType.number
                    : TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Pesquise aqui',
                    hintStyle: TextStyle(color: Colors.white)),
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
              ),
        actions: <Widget>[
          IconButton(
              icon: !isSearching
                  ? Icon(
                      Icons.looks_one,
                      color: Colors.white,
                    )
                  : SizedBox(
                      width: 1,
                    ),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  tipoBusca = TTipoBusca.Codigo;
                });
              }),
          IconButton(
              icon: !isSearching
                  ? Icon(
                      Icons.keyboard,
                      color: Colors.white,
                    )
                  : SizedBox(
                      width: 1,
                    ),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  tipoBusca = TTipoBusca.Descricao;
                });
              }),
          IconButton(
              icon: !isSearching
                  ? Icon(
                      Icons.brightness_auto,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  tipoBusca = TTipoBusca.Nome;
                });
              }),
        ],
      ),
      body: ScopedBuilder<ProdutoStore, List<ProdutoModel>>(
        store: storeProduto..fetchProdutos(search, tipoBusca),
        onError: (context, error) => _buildError(context, error.toString()),
        onLoading: (context) => _buildLoading(),
        onState: (context, state) {
          return state.length > 0 ? _buildSuccess(state) : _buildListaVazia();
        },
      ),
    );
  }

  _buildListaVazia() {
    return Center(
        child: Text(
      'Ainda nada por aqui!',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ));
  }

  Center _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _buildError(BuildContext context, String erro) {
    return Center(
      child: Text(
        erro,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  _buildSuccess(List<ProdutoModel> listaProduto) {
    return ListView.builder(
      itemCount: listaProduto.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListaProdutos(listaProduto[index]);
      },
    );
  }
}
