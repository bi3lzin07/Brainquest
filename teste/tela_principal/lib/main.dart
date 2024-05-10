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
        '/timer': (context) => PlaceholderPage(title: 'Cronômetro'),
        '/enemLessons': (context) => PlaceholderPage(title: 'Aulão do ENEM'),
        '/enemTests': (context) => PlaceholderPage(title: 'Provas ENEM'),
        '/questions': (context) => PlaceholderPage(title: 'Questões'),
        '/schedule': (context) => PlaceholderPage(title: 'Cronograma de Estudos'),
        '/redacao': (context) => PlaceholderPage(title: 'Redação'),
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
                color: Color.fromARGB(255, 101, 247, 159),
              ),
            ),
            ListTile(
              title: Text('Métodos de Estudo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudyMethodsScreen()),
                );
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
              title: Text('Redação'),
              onTap: () {
                Navigator.pushNamed(context, '/redacao');
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
          GridItem(
            name: 'Métodos de Estudo',
            icon: Icons.book,
          ),
          GridItem(
            name: 'Cronômetro',
            icon: Icons.timer,
          ),
          GridItem(
            name: 'Aulão do ENEM',
            icon: Icons.school,
          ),
          GridItem(
            name: 'Provas ENEM',
            icon: Icons.assignment,
          ),
          GridItem(
            name: 'Questões',
            icon: Icons.help,
          ),
          GridItem(
            name: 'Cronograma de Estudos',
            icon: Icons.event,
          ),
           GridItem(
            name: 'Redação',
            icon: Icons.reduce_capacity_outlined,
          ),
          GridItem(
            name: 'Aplicativos',
            icon: Icons.apps,
          ),
        ],
      ),
    );
  }
}

//pagina inicial
class GridItem extends StatelessWidget {
  final String name;
  final IconData icon;

  GridItem({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          switch (name) {
            case 'Métodos de Estudo':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudyMethodsScreen()),
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
            case 'Questões':
              Navigator.pushNamed(context, '/questions');
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
          children: <Widget>[
            Icon(icon),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
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

//Abas dentro do metodo de estudos
class StudyMethodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, // número de abas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Métodos de Estudo'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            GridItem(
              name: 'Técnica de Pomodoro',
              icon: Icons.timer,
            ),
            GridItem(
              name: 'Kumon',
              icon: Icons.school,
            ),
            GridItem(
              name: 'Método EPL2R',
              icon: Icons.assignment,
            ),
            GridItem(
              name: 'Questões',
              icon: Icons.help,
            ),
            GridItem(
              name: 'Mapas Mentais',
              icon: Icons.event,
            ),
            GridItem(
              name: 'Testes Práticos',
              icon: Icons.apps,
            ),
            GridItem(
              name: 'Flashcards',
              icon: Icons.apps,
            ),
          ],
        ),
      ),
    );
  }
}
