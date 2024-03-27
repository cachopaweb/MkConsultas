// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_triple/flutter_triple.dart';

import 'package:cometa/Models/Cliente.dart';
import 'package:cometa/Services/service_contracts.dart';

class ClienteStore extends Store<List<ClienteModel>> {
  final IClienteService serviceClientes;

  ClienteStore(
    this.serviceClientes,
  ) : super([]);

  Future<void> fetchClientes(String search) async {
    execute(() => serviceClientes.fetchClientes(search));
  }
}
