import 'package:flutter/material.dart';
import 'package:tela_principal/widgets/grid_item.dart';

class MetodoEstudoTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Métodos de Estudo'),
        ),
        body: Center(
        child: GridView.count( 
          mainAxisSpacing: 10,
          crossAxisSpacing: 100,
          crossAxisCount: 4,
          children: <Widget>[
            GridItem(
              name: 'Técnica de Pomodoro',
              image: '../images/fotos_metodo/pomodoro.png',
              route: '/metodos',
            ),
            GridItem(
              name: 'Kumon',
              image: '../images/fotos_metodo/kumon.png',
              route: '/metodos',
            ),
            GridItem(
              name: 'Método EPL2R',
              image: '../images/fotos_metodo/metodo.png',
              route: '/metodos',
            ),
            GridItem(
              name: 'Mapa Mentais',
              image: '../images/fotos_metodo/mapa.png',
              route: '/metodos',
            ),
            GridItem(
              name: 'Teste Práticos',
              image: '../images/fotos_metodo/teste.png',
              route: '/metodos',
            ),
            GridItem(
              name: 'Flashcards',
              image: '../images/fotos_metodo/flashcads.png',
              route: '/metodos',
            ),
          ],
        ),
      ),
      )
    );
  }
}