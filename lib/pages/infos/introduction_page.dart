import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

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
                'Introdução à Criação de Tilápias',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'A tilápia é uma das espécies de peixe mais cultivadas no mundo devido à sua capacidade de adaptação a diferentes condições ambientais e sua alta taxa de crescimento. Originária da África, a tilápia se tornou popular em várias partes do mundo, especialmente em países tropicais e subtropicais.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'O cultivo de tilápias oferece várias vantagens, incluindo:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 8),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Alta resistência a doenças e condições adversas.',
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 8),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Facilidade de reprodução em cativeiro.',
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 8),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Alimentação variada, podendo incluir ração comercial e alimentos naturais.',
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.brightness_1, size: 8),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Excelente aceitação pelo mercado consumidor devido ao sabor agradável e textura da carne.',
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Este guia fornecerá informações detalhadas sobre cada aspecto importante da criação de tilápias, desde a seleção de espécies até a comercialização.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
