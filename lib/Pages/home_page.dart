import 'package:flutter/material.dart';

import '../Consts/ConstsApp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Cometa Consultas',
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: <Widget>[],
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Opacity(
                child: Image.asset(ConstsApp.imgLogo),
                opacity: 0.5,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  BotaoProdutos(),
                  SizedBox(
                    height: 20,
                  ),
                  BotaoClientes(),
                ],
              ),
            ],
          ),
        ));
  }
}

class BotaoProdutos extends StatelessWidget {
  const BotaoProdutos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1],
              colors: [Colors.lightBlue, Colors.blue]),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: SizedBox.expand(
          child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/produtos');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.phonelink_setup,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Produtos',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class BotaoClientes extends StatelessWidget {
  const BotaoClientes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1],
              colors: [Colors.lightBlue, Colors.blue]),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: SizedBox.expand(
          child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/clientes');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Clientes',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      )),
    );
  }
}
