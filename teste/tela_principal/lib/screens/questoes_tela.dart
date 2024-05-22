import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestoesTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botões com Links'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _launchURL('https://www.mesalva.com/app/conteudos/enem2020mat165?contexto=exercicios-e-provas%2Fexercicios-matematica&lista=KGEF4F9Hb2cD8YYWvGrVXjvP&modulo=GhMmi1tF416quoh8QyYEk9zg');
              },
              child: Column(
                children: [
                  Image.asset(
                    'images/fotos_questoes/matematica.png', // Substitua pelo caminho da sua imagem de matemática
                    width: 200, // Ajuste conforme necessário
                    height: 200, // Ajuste conforme necessário
                  ),
                  SizedBox(height: 400),
                  Text('Matemática'),
                ],
              ),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                _launchURL('https://www.mesalva.com/app/exercicios-e-provas/exercicios-biologia');
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/biologia_icon.png', // Substitua pelo caminho da sua imagem de biologia
                    width: 100, // Ajuste conforme necessário
                    height: 100, // Ajuste conforme necessário
                  ),
                  SizedBox(height: 10),
                  Text('Biologia'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }
}