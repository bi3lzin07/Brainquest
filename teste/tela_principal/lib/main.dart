import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrainQuest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        '/studyMethods': (context) => PlaceholderPage(title: 'Métodos de Estudo'),
        '/timer': (context) => PlaceholderPage(title: 'Cronômetro'),
        '/enemLessons': (context) => PlaceholderPage(title: 'Aulão do ENEM'),
        '/enemTests': (context) => PlaceholderPage(title: 'Provas ENEM'),
        '/questions': (context) => PlaceholderPage(title: 'Questões'),
        '/schedule': (context) => PlaceholderPage(title: 'Cronograma de Estudos'),
        '/apps': (context) => PlaceholderPage(title: 'Aplicativos'),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BrainQuest'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color:  Color.fromARGB(255, 101, 247, 159),
              ),
            ),
            ListTile(
              title: Text('Métodos de Estudo'),
              onTap: () {
                Navigator.pushNamed(context, '/studyMethods');
              },
            ),
            ListTile(
              title: Text('Cronômetro'),
              onTap: () {
                Navigator.pushNamed(context, '/timer');
              },
            ),
            ListTile(
              title: Text('Aulão do ENEM'),
              onTap: () {
                Navigator.pushNamed(context, '/enemLessons');
              },
            ),
            ListTile(
              title: Text('Provas ENEM'),
              onTap: () {
                Navigator.pushNamed(context, '/enemTests');
              },
            ),
            ListTile(
              title: Text('Questões'),
              onTap: () {
                Navigator.pushNamed(context, '/questions');
              },
            ),
            ListTile(
              title: Text('Cronograma de Estudos'),
              onTap: () {
                Navigator.pushNamed(context, '/schedule');
              },
            ),
            ListTile(
              title: Text('Aplicativos'),
              onTap: () {
                Navigator.pushNamed(context, '/apps');
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          GridItem(name: 'Métodos de Estudo'),
          GridItem(name: 'Cronômetro'),
          GridItem(name: 'Aulão do ENEM'),
          GridItem(name: 'Provas ENEM'),
          GridItem(name: 'Questões'),
          GridItem(name: 'Cronograma de Estudos'),
          GridItem(name: 'Aplicativos'),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String name;

  GridItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          switch (name) {
            case 'Métodos de Estudo':
              Navigator.pushNamed(context, '/studyMethods');
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
            case 'Questões':
              Navigator.pushNamed(context, '/questions');
              break;
            case 'Cronograma de Estudos':
              Navigator.pushNamed(context, '/schedule');
              break;
            case 'Aplicativos':
              Navigator.pushNamed(context, '/apps');
              break;
          }
        },
        child: Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Página em construção: $title'),
      ),
    );
  }
}