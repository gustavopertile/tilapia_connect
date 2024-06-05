import 'package:flutter/material.dart';

class SanitationPage extends StatelessWidget {
  const SanitationPage({super.key});

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
                'Sanidade',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Manter a sanidade das tilápias é essencial para prevenir doenças e garantir uma produção eficiente. As principais práticas de sanidade incluem:',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '1. Quarentena',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'A quarentena de novos peixes antes de introduzi-los no sistema de criação principal é uma prática recomendada para prevenir a introdução de doenças. Durante a quarentena, os peixes devem ser observados para sinais de doenças e tratados conforme necessário.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '2. Vacinação e Tratamentos Preventivos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'A vacinação pode ajudar a proteger os peixes contra doenças comuns. Além disso, a administração de tratamentos preventivos, como desparasitantes e antibióticos, pode ser necessária em algumas situações.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '3. Monitoramento e Diagnóstico',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'A observação regular dos peixes para detectar sinais de doenças é crucial. Sintomas como comportamento anormal, manchas, úlceras e perda de apetite podem indicar problemas de saúde. O diagnóstico precoce e o tratamento adequado são essenciais para controlar surtos de doenças.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '4. Higiene e Limpeza',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Manter o ambiente de criação limpo e higiênico ajuda a prevenir a propagação de patógenos. Isso inclui a limpeza regular dos tanques, equipamentos e instalações de manuseio de peixes.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
