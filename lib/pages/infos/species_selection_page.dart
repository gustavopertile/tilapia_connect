import 'package:flutter/material.dart';

class SpeciesSelectionPage extends StatelessWidget {
  const SpeciesSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Seleção de Espécies',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Existem várias espécies de tilápias que são adequadas para a criação, cada uma com suas próprias características. As espécies mais comumente cultivadas incluem:',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '1. Tilápia do Nilo (Oreochromis niloticus)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'A Tilápia do Nilo é a espécie mais popular para a criação devido ao seu rápido crescimento, alta resistência a doenças e boa qualidade de carne. É adaptável a uma ampla gama de condições ambientais e pode ser cultivada em sistemas intensivos e extensivos.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '2. Tilápia Vermelha (Oreochromis sp.)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'A Tilápia Vermelha é conhecida por sua carne de alta qualidade e aparência atraente. É um híbrido entre diferentes espécies de tilápias e é frequentemente preferida para o mercado de peixe fresco.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '3. Tilápia Azul (Oreochromis aureus)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'A Tilápia Azul é uma espécie resistente, especialmente adequada para ambientes de água fria. Ela tem uma boa taxa de crescimento e é frequentemente usada em programas de hibridização.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'Na seleção da espécie, é importante considerar fatores como o clima local, a disponibilidade de alevinos, o tipo de sistema de cultivo planejado e as preferências do mercado.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
