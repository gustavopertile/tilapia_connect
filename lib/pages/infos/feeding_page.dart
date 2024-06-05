import 'package:flutter/material.dart';

class FeedingPage extends StatelessWidget {
  const FeedingPage({super.key});

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
                'Alimentação',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'A alimentação é um dos fatores mais importantes na criação de tilápias. Para garantir um crescimento saudável e eficiente, é essencial fornecer uma dieta balanceada e adequada às necessidades dos peixes em cada fase de desenvolvimento.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '1. Tipos de Ração',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'As rações comerciais para tilápias são formuladas para atender às necessidades nutricionais específicas dos peixes em diferentes estágios de vida. Existem rações para alevinos, juvenis e adultos, com diferentes níveis de proteína, energia e outros nutrientes.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '2. Frequência e Quantidade de Alimentação',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Tilápias devem ser alimentadas várias vezes ao dia em pequenas quantidades, para maximizar a absorção de nutrientes e minimizar o desperdício. A quantidade de ração deve ser ajustada de acordo com a taxa de crescimento e a biomassa dos peixes no tanque.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '3. Alimentação Natural',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Além da ração comercial, tilápias também podem se alimentar de fitoplâncton, zooplâncton e outros organismos aquáticos presentes no ambiente de criação. O enriquecimento do ambiente com esses alimentos naturais pode complementar a dieta e melhorar a saúde dos peixes.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '4. Suplementação e Aditivos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Em alguns casos, pode ser necessário suplementar a dieta das tilápias com vitaminas, minerais e outros aditivos para corrigir deficiências nutricionais e melhorar o desempenho dos peixes.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
