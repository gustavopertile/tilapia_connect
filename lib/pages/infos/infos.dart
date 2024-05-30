import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../src/widgets/containers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Informative extends StatefulWidget {
  const Informative({Key? key}) : super(key: key);

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
        textScaleFactor: 1.0,
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 40),
                          children: [
                            InformativeCards(
                              height: height,
                              width: width,
                              icon: FontAwesomeIcons.fishFins,
                              iconSize: 50,
                              text: 'Ração',
                              onPressed: () {
                                Navigator.pushNamed(context, '/infos');
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            InformativeCards(
                              height: height,
                              width: width,
                              icon: FontAwesomeIcons.warning,
                              iconSize: 48,
                              text: 'Avisos',
                              onPressed: () {
                                Navigator.pushNamed(context, '/documents');
                              },
                            ),
                            SizedBox(
                              width: width * .05,
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
