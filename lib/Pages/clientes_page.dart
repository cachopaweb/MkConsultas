import 'package:cometa/Models/Cliente.dart';
import 'package:cometa/stores/cliente_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../Services/cliente_service_cache.dart';

class ClientesPage extends StatefulWidget {
  final String baseUrl;

  ClientesPage({required this.baseUrl});

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  bool isSearching = false;
  String search = '';
  final storeCliente = ClienteStore(ClienteServiceCache());

  @override
  void initState() {
    super.initState();
  }

  void _searchClientes(String value) {
    setState(() {
      search = value;
    });
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

  _buildSuccess(List<ClienteModel> listaClientes) {
    return ListView.builder(
      itemCount: listaClientes.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListaClientes(listaClientes[index]);
      },
    );
  }

  Widget _buildListaClientes(ClienteModel clienteModel) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/clientes_detalhes', arguments: clienteModel);
      },
      child: Card(
        elevation: 5,
        child: ListTile(
          key: Key(clienteModel.codigo.toString()),
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Código",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                clienteModel.codigo.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Nome"),
              Text(
                clienteModel.nome,
                style: TextStyle(fontWeight: FontWeight.bold),
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
        title: !isSearching
            ? Text('Lista de Clientes')
            : TextField(
                style: TextStyle(color: Colors.white),
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Pesquise aqui',
                    hintStyle: TextStyle(color: Colors.white)),
                onChanged: (value) {
                  _searchClientes(value);
                },
              ),
        actions: <Widget>[
          IconButton(
              icon: !isSearching ? Icon(Icons.search) : Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              })
        ],
      ),
      body: ScopedBuilder<ClienteStore, List<ClienteModel>>(
        store: storeCliente..fetchClientes(search),
        onError: (context, error) => _buildError(context, error.toString()),
        onLoading: (context) => _buildLoading(),
        onState: (context, state) {
          return state.length > 0 ? _buildSuccess(state) : _buildListaVazia();
        },
      ),
    );
  }
}
