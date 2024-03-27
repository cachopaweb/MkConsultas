// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cometa/Models/Cliente.dart';

class ClienteDetail extends StatelessWidget {
  final ResumoModel resumoModel;
  final formatCurr =
      NumberFormat.currency(locale: 'pt_BR', decimalDigits: 2, symbol: '');

  ClienteDetail({required this.resumoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Cliente"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Card(
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Campos(
                nomeCampo: 'Faturado (+):',
                valorCampo: formatCurr.format(resumoModel.SubTotalFat)),
            Campos(
              nomeCampo: 'Não Faturado (+):',
              valorCampo: formatCurr.format(resumoModel.SubTotalNFat),
            ),
            Campos(
              nomeCampo: 'Fat + Não Fat (=):',
              valorCampo: formatCurr.format(resumoModel.SubTotalGeral),
            ),
            Campos(
              nomeCampo: 'Cheques (-):',
              valorCampo: formatCurr.format(resumoModel.Cheques),
              cor: Colors.red,
            ),
            Campos(
              nomeCampo: 'SubTotal (=):',
              valorCampo: formatCurr
                  .format(resumoModel.SubTotalGeral - resumoModel.Cheques),
              cor: Colors.blue,
            ),
            Campos(
              nomeCampo: 'Juros (+):',
              valorCampo: formatCurr.format(resumoModel.Juros),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Campos(
              nomeCampo: 'Total Geral:',
              valorCampo: formatCurr.format(resumoModel.TotalGeral),
            ),
          ],
        ),
      ),
    );
  }
}

class Campos extends StatelessWidget {
  final String valorCampo;
  final String nomeCampo;
  final Color cor;

  Campos({
    Key? key,
    required this.valorCampo,
    required this.nomeCampo,
    this.cor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nomeCampo,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          valorCampo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: cor,
          ),
        ),
      ],
    );
  }
}
