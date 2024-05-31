import 'package:flutter/material.dart';

class CommercializationPage extends StatelessWidget {
  const CommercializationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comercialização'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comercialização',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'A comercialização bem-sucedida das tilápias envolve uma série de considerações, desde o planejamento da produção até a distribuição ao consumidor final.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '1. Planejamento da Produção',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'O planejamento adequado da produção é crucial para atender às demandas do mercado. Isso inclui a coordenação dos ciclos de produção para garantir um fornecimento contínuo de peixes de qualidade ao longo do ano.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '2. Qualidade do Produto',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Manter a qualidade do produto é essencial para a satisfação do consumidor. Isso inclui boas práticas de manejo durante a criação, processamento e transporte dos peixes. A embalagem adequada e a apresentação do produto também são importantes.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '3. Mercado Alvo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Identificar e entender o mercado alvo é fundamental para o sucesso na comercialização. Diferentes mercados podem ter preferências variadas em termos de tamanho, tipo e apresentação do peixe.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '4. Logística e Distribuição',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'A logística eficiente é essencial para garantir que os peixes cheguem ao mercado em boas condições. Isso inclui o transporte adequado, armazenamento e manejo pós-colheita. O uso de transporte refrigerado e a coordenação eficiente da cadeia de suprimentos são fatores críticos.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '5. Estratégias de Marketing',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'O desenvolvimento de estratégias de marketing eficazes pode ajudar a aumentar a demanda pelos produtos de tilápia. Isso pode incluir campanhas publicitárias, promoção em pontos de venda, participação em feiras e eventos, e a criação de uma marca forte.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
