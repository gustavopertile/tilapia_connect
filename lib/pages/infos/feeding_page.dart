import 'package:flutter/material.dart';

class FeedingPage extends StatelessWidget {
  const FeedingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alimentação'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alimentação',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'A alimentação é um dos fatores mais importantes na criação de tilápias. Para garantir um crescimento saudável e eficiente, é essencial fornecer uma dieta balanceada e adequada às necessidades dos peixes em cada fase de desenvolvimento.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '1. Tipos de Ração',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'As rações comerciais para tilápias são formuladas para atender às necessidades nutricionais específicas dos peixes em diferentes estágios de vida. Existem rações para alevinos, juvenis e adultos, com diferentes níveis de proteína, energia e outros nutrientes.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '2. Frequência e Quantidade de Alimentação',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Tilápias devem ser alimentadas várias vezes ao dia em pequenas quantidades, para maximizar a absorção de nutrientes e minimizar o desperdício. A quantidade de ração deve ser ajustada de acordo com a taxa de crescimento e a biomassa dos peixes no tanque.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '3. Alimentação Natural',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Além da ração comercial, tilápias também podem se alimentar de fitoplâncton, zooplâncton e outros organismos aquáticos presentes no ambiente de criação. O enriquecimento do ambiente com esses alimentos naturais pode complementar a dieta e melhorar a saúde dos peixes.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '4. Suplementação e Aditivos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Em alguns casos, pode ser necessário suplementar a dieta das tilápias com vitaminas, minerais e outros aditivos para corrigir deficiências nutricionais e melhorar o desempenho dos peixes.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
