import '../Models/Cliente.dart';
import '../Models/Produto.dart';

abstract class IClienteService {
  Future<List<ClienteModel>> fetchClientes(String search);
}

abstract class IProdutoService {
  Future<List<ProdutoModel>> fetchProdutos(String search, TTipoBusca tipoBusca);
}
