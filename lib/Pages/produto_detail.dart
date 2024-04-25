import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cometa/Models/Produto.dart';

class ProdutoDetail extends StatelessWidget {
  final ProdutoModel produto;
  const ProdutoDetail({
    Key? key,
    required this.produto,
  }) : super(key: key);

  Widget _buildBody() {
    final formataData = DateFormat('dd/MM/yyyy');
    final formataValor =
        NumberFormat.currency(locale: 'pt_BR', decimalDigits: 2, symbol: '');

    return Card(
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Campos(
                  title: 'Código',
                  value: produto.proCodigo.toString(),
                  negrito: true,
                ),
                SizedBox(
                  width: 0, //10,
                ),
                Campos(title: 'ABC', value: produto.proAbc),
                SizedBox(
                  width: 0, //10,
                ),
                Campos(title: 'ABC+', value: produto.proAbcAnalitico),
                SizedBox(
                  width: 0, //10,
                ),
                Campos(
                  title: 'Quant',
                  value: produto.proQuantidade.toStringAsFixed(0),
                  negrito: true,
                  vermelho: true,
                ),
                SizedBox(
                  width: 0, //10,
                ),
                Campos(title: 'Local', value: produto.proLocal),
              ],
            ),
            SizedBox(
              width: 0, //10,
            ),
            Campos(
              title: 'Descrição',
              value: produto.proDescricao,
              negrito: true,
            ),
            SizedBox(
              width: 0, //10,
            ),
            Campos(title: 'Nome', value: produto.proNome.trim()),
            SizedBox(
              width: 0, //10,
            ),
            Campos(title: 'Fornecedor', value: produto.forNome),
            SizedBox(
              width: 0, //10,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Campos(
                  title: 'Custo',
                  value: formataValor.format(produto.proValorc),
                ),
                SizedBox(
                  width: 0, //52,
                ),
                Campos(
                  title: 'Custo Méd.',
                  value: formataValor.format(produto.proValorcm),
                ),
                SizedBox(
                  width: 0, //40,
                ),
                Campos(
                  title: 'Custo Merc.',
                  value: formataValor.format(produto.proValorf),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Campos(
                  title: 'Custo Op.',
                  value: formataValor.format(produto.proValorl),
                  vermelho: true,
                  negrito: true,
                ),
                SizedBox(
                  width: 0, //33,
                ),
                Campos(
                  title: 'Preço Venda',
                  value: formataValor.format(produto.proValorv),
                  negrito: true,
                  vermelho: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Campos(
                  title: 'Data Ult Alt',
                  value: formataData.format(DateTime.parse(produto.proDataua)),
                ),
                SizedBox(
                  width: 0, //16,
                ),
                Campos(
                  title: 'Data Ult Compra',
                  value: formataData.format(DateTime.parse(produto.proDatauc)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: size.height * 0.75,
        width: size.width,
        child: _buildBody(),
      ),
    );
  }
}

class Campos extends StatelessWidget {
  final String title;
  final String value;
  final bool negrito;
  final bool vermelho;
  const Campos({
    Key? key,
    required this.title,
    required this.value,
    this.negrito = false,
    this.vermelho = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: negrito ? FontWeight.bold : null,
              fontSize: 18,
              color: vermelho ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
