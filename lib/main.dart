import 'package:flutter/material.dart';
import 'widgets/photo_card.dart';
import 'widgets/custom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Bottom Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
        shape: const CircularNotchedRectangle(), // Cria o recorte circular
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
            const SizedBox(width: 48), // Espaço para o botão central
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
        child: const Icon(Icons.home, color: Colors.yellow), // Ícone em amarelo
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Corpo da tela baseado no índice da BottomNavigationBar
  Widget _buildBody() {
    if (_selectedIndex == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Road Guard',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.notification_add),
                ],
              )),
          // Seção de exportar imagens
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload, size: 100, color: Colors.black),
                  // SizedBox(height: 30),
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
          const Padding(
            padding: EdgeInsets.only(left: 18, top: 4, bottom: 12, right: 8),
            child: Text(
              'Analisar Imagens',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
          style: const TextStyle(fontSize: 20),
        ),
      );
    }
  }
}

class CustomBottomNavigationScreen extends StatefulWidget {
  const CustomBottomNavigationScreen({super.key});

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
        shape: const CircularNotchedRectangle(), // Cria o recorte para o botão
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
            const Spacer(), // Espaço entre os ícones para alinhar
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
        child: const Icon(Icons.home, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
