import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrainQuest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Login(),
      routes: {
        '/home': (context) => HomePage(),
        '/timer': (context) => PlaceholderPage(title: 'Cronômetro'),
        '/questions': (context) => PlaceholderPage(title: 'Questões'),
        '/schedule': (context) =>
            PlaceholderPage(title: 'Cronograma de Estudos'),
        '/redacao': (context) => PlaceholderPage(title: 'Redação'),
        '/apps': (context) => PlaceholderPage(title: 'Aplicativos'),
      },
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  void _login(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _register(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Conectar-se com:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SocialButton(icon: Icons.facebook, color: Colors.blue),
                  SocialButton(icon: Icons.g_mobiledata, color: Colors.red),
                  SocialButton(icon: Icons.apple, color: Colors.black),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _login(context),
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () => _register(context),
                child: const Text('Não tem uma conta? Cadastrar-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialButton({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      onPressed: () {},
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BrainQuest'),
      ),
            drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 101, 247, 159),
              ),
            ),
            ListTile(
              leading: Icon(Icons.menu_book), // Adicione o ícone aqui
              title: const Text('Métodos de Estudo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudyMethodsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.timer), // Adicione o ícone aqui
              title: const Text('Cronômetro'),
              onTap: () {
                Navigator.pushNamed(context, '/timer');
              },
            ),
            ListTile(
              leading: Icon(Icons.school), // Adicione o ícone aqui
              title: const Text('Aulão do ENEM'),
              onTap: () {
                Navigator.pushNamed(context, '/enemLessons');
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment), // Adicione o ícone aqui
              title: const Text('Provas ENEM'),
              onTap: () {
                Navigator.pushNamed(context, '/enemTests');
              },
            ),
            ListTile(
              leading: Icon(Icons.help), // Adicione o ícone aqui
              title: const Text('Questões'),
              onTap: () {
                Navigator.pushNamed(context, '/questions');
              },
            ),
            ListTile(
              leading: Icon(Icons.event), // Adicione o ícone aqui
              title: const Text('Cronograma de Estudos'),
              onTap: () {
                Navigator.pushNamed(context, '/schedule');
              },
            ),
            ListTile(
              leading: Icon(Icons.reduce_capacity_outlined), // Adicione o ícone aqui
              title: const Text('Redação'),
              onTap: () {
                Navigator.pushNamed(context, '/redacao');
              },
            ),
            ListTile(
              leading: Icon(Icons.apps), // Adicione o ícone aqui
              title: const Text('Aplicativos'),
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
          GridItem(name: 'Métodos de Estudo'), //image: 'images/test.jpg',
          GridItem(name: 'Cronômetro', icon: Icons.timer),
          GridItem(name: 'Aulão do ENEM', icon: Icons.school),
          GridItem(name: 'Provas ENEM', icon: Icons.assignment),
          GridItem(name: 'Questões', icon: Icons.help),
          GridItem(name: 'Cronograma de Estudos', icon: Icons.event),
          GridItem(name: 'Redação', icon: Icons.reduce_capacity_outlined),
          GridItem(name: 'Aplicativos', icon: Icons.apps),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String name;
  final String? image;
  final IconData? icon;

  const GridItem({required this.name, this.image, this.icon});
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
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({required this.title});

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

class StudyMethodsScreen extends StatelessWidget {
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

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  void _navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NextPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Número',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToNextPage(context);
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
        backgroundColor: Colors.purple,
      ),
      body: const Center(
        child: Text('This is the next page'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Número',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToNextPage(context);
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  class _navigateToNextPage {
  _navigateToNextPage(BuildContext context);
  }

