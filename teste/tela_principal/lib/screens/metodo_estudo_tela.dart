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
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            GridItem(name: 'Técnica de Pomodoro', icon: Icons.timer),
            GridItem(name: 'Kumon', icon: Icons.school),
            GridItem(name: 'Método EPL2R', icon: Icons.assignment),
            GridItem(name: 'Mapas Mentais', icon: Icons.event),
            GridItem(name: 'Testes Práticos', icon: Icons.apps),
            GridItem(name: 'Flashcards', icon: Icons.apps),
          ],
        ),
      ),
    );
  }
}