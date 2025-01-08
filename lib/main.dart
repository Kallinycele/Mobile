import 'package:flutter/material.dart';
import 'widgets/photo_card.dart';
import 'widgets/custom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Bottom Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1; // Índice do botão selecionado na BottomNavigationBar

  final List<Map<String, String>> photoData = [
    {
      "date": "04/12/2024",
      "photoCount": "120",
      "imagePath": "lib/assets/car.jpg"
    },
    {
      "date": "05/12/2024",
      "photoCount": "98",
      "imagePath": "lib/assets/car.jpg",
    },
    {
      "date": "06/12/2024",
      "photoCount": "150",
      "imagePath": "lib/assets/car.jpg",
    },
  ];

  // Função para mudar o índice selecionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(), // Corpo da tela dinâmico
      bottomNavigationBar: BottomAppBar(
        color: Colors.black, // Cor de fundo da barra
        shape: CircularNotchedRectangle(), // Cria o recorte circular
        notchMargin: 8.0, // Distância entre o botão e a barra
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Ícone 1: Relatório
            IconButton(
              icon: Icon(
                Icons.bar_chart,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            SizedBox(width: 48), // Espaço para o botão central
            // Ícone 2: Busca
            IconButton(
              icon: Icon(
                Icons.search,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, // Cor de fundo do botão
        onPressed: () {
          setState(() {
            _selectedIndex = 1; // Seleciona a página Home
          });
        },
        child: Icon(Icons.home, color: Colors.yellow), // Ícone em amarelo
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Corpo da tela baseado no índice da BottomNavigationBar
 Widget _buildBody() {
  if (_selectedIndex == 1) {
    return Column(
      children: [
         Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            'Road Guard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, ),
          ),
        ),
        // Seção de exportar imagens
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.upload, size: 50, color: Colors.black),
                SizedBox(height: 30),
                Text(
                  'Exportar imagens',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  'Escolha os dados que deseja expotar',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        // Título para análise de imagens
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Analisar Imagens',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        // Carrossel de fotos
        Expanded(
          child: PageView.builder(
            itemCount: photoData.length,
            itemBuilder: (context, index) {
              return PhotoCard(
                date: photoData[index]['date']!,
                photoCount: photoData[index]['photoCount']!,
                imagePath: photoData[index]['imagePath']!,
              );
            },
          ),
        ),
      ],
    );
  } else {
    return Center(
      child: Text(
        "Outra Página ${_selectedIndex + 1}",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

}

class CustomBottomNavigationScreen extends StatefulWidget {
  @override
  _CustomBottomNavigationScreenState createState() =>
      _CustomBottomNavigationScreenState();
}

class _CustomBottomNavigationScreenState
    extends State<CustomBottomNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Cria o recorte para o botão
        notchMargin: 8.0, // Margem entre o botão e a barra
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Primeiro ícone (Relatório)
            IconButton(
              icon: Icon(Icons.bar_chart,
                  color: _currentIndex == 0 ? Colors.white : Colors.grey),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            Spacer(), // Espaço entre os ícones para alinhar
            // Segundo ícone (Busca)
            IconButton(
              icon: Icon(Icons.search,
                  color: _currentIndex == 2 ? Colors.white : Colors.grey),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          setState(() {
            _currentIndex = 1; // Home central
          });
        },
        child: Icon(Icons.home, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
