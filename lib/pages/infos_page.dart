import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../src/widgets/containers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'infos/introduction_page.dart';
import 'infos/species_selection_page.dart';
import 'infos/rearing_environment_page.dart';
import 'infos/feeding_page.dart';
import 'infos/water_management_page.dart';
import 'infos/sanitation_page.dart';
import 'infos/commercialization_page.dart';

class Informative extends StatefulWidget {
  const Informative({super.key});

  @override
  State<Informative> createState() => _InformativeState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _InformativeState extends State<Informative> {
  SharedPreferences? prefs;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final MediaQueryData scaleFactor = MediaQuery.of(context);
    return MediaQuery(
      data: scaleFactor.copyWith(
        textScaler: const TextScaler.linear(1.0),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height - 80,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 40),
                          children: [
                            InformativeCards(
                              height: height,
                              width: width,
                              icon: FontAwesomeIcons.file,
                              iconSize: 50,
                              text: 'Introdução',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const IntroductionPage()),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            InformativeCards(
                              height: height,
                              width: width,
                              icon: FontAwesomeIcons.fishFins,
                              iconSize: 50,
                              text: 'Seleção de Espécies',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SpeciesSelectionPage()),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            InformativeCards(
                              height: height,
                              width: width,
                              icon: FontAwesomeIcons.water,
                              iconSize: 50,
                              text: 'Ambiente de Criação',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RearingEnvironmentPage()),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            InformativeCards(
                              height: height,
                              width: width,
                              icon: FontAwesomeIcons.bowlFood,
                              iconSize: 50,
                              text: 'Alimentação',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const FeedingPage()),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            InformativeCards(
                              height: height,
                              width: width,
                              icon: FontAwesomeIcons.faucet,
                              iconSize: 50,
                              text: 'Manejo da Água',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const WaterManagementPage()),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            InformativeCards(
                              height: height,
                              width: width,
                              icon: FontAwesomeIcons.swatchbook,
                              iconSize: 50,
                              text: 'Sanidade',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SanitationPage()),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            InformativeCards(
                              height: height,
                              width: width,
                              icon: FontAwesomeIcons.moneyBill,
                              iconSize: 50,
                              text: 'Comercialização',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const CommercializationPage()),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
