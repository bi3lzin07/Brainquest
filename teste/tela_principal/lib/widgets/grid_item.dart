import 'package:flutter/material.dart';
import 'package:tela_principal/screens/metodo_estudo_tela.dart';

// ignore: must_be_immutable
class GridItem extends StatelessWidget {
  final String? name;
  String? image;
  final IconData? icon;
  double width;
  double height;

  GridItem({required this.name, this.image, this.icon, this.width = 200, this.height = 200});
  @override
  Widget build(BuildContext context) {
    List<Widget> myWidgets = [];

    // Icon(icon),
    //           const SizedBox(height: 8),
    //           Text(
    //             name,
    //             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //           ),

    if (image != null) {
      myWidgets.add(Image.asset(image!));
    }
    if (icon != null) {
      myWidgets.add(Icon(icon));
    }
    if (name != null && image == null) {
      myWidgets.add(
        Text(
          name!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }

    return Card(
      child: InkWell(
        onTap: () {
          switch (name) {
            case 'Métodos de Estudo':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MetodoEstudoTela()),
              );
              break;
            case 'Cronômetro':
              Navigator.pushNamed(context, '/timer');
              break;
            case 'Aulão do ENEM':
              Navigator.pushNamed(context, '/enemLessons');
              break;
            case 'Provas ENEM':
              Navigator.pushNamed(context, '/enemTests');
              break;
            case 'Cronograma de Estudos':
              Navigator.pushNamed(context, '/schedule');
              break;
            case 'Redação':
              Navigator.pushNamed(context, '/redacao');
              break;
            case 'Aplicativos':
              Navigator.pushNamed(context, '/apps');
              break;
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: myWidgets,
        ),
      ),
    );
  }
}
