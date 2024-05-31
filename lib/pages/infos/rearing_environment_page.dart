import 'package:flutter/material.dart';

class RearingEnvironmentPage extends StatelessWidget {
  const RearingEnvironmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambiente de Criação'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ambiente de Criação',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Tilápias requerem um ambiente com boa qualidade de água, temperatura adequada e níveis de oxigênio suficientes. Os principais fatores a serem considerados incluem:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '1. Qualidade da Água',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'A água deve ser limpa e livre de poluentes. Os parâmetros ideais de qualidade da água para a criação de tilápias incluem um pH entre 6,5 e 9,0, níveis de amônia abaixo de 0,02 mg/L, nitrito abaixo de 0,1 mg/L e nitrato abaixo de 100 mg/L.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '2. Temperatura',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Tilápias crescem melhor em temperaturas entre 24°C e 30°C. Temperaturas abaixo de 20°C podem retardar o crescimento e aumentar a suscetibilidade a doenças.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '3. Oxigênio Dissolvido',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Níveis adequados de oxigênio são essenciais para a saúde dos peixes. O nível de oxigênio dissolvido deve ser mantido acima de 5 mg/L para garantir uma boa taxa de crescimento e evitar estresse.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '4. Sistema de Criação',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Os sistemas de criação de tilápias podem variar desde tanques em terra até sistemas de recirculação de água e gaiolas flutuantes. A escolha do sistema depende do tamanho da operação, dos recursos disponíveis e das condições locais.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
