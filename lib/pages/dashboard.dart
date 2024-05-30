import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../src/index.dart';
import '../src/styles/containers.dart';
import '../src/styles/text.dart';
import '../src/widgets/containers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../src/widgets/custom.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _DashboardState extends State<Dashboard> {
  late Future futureGetSaldo;
  late Future futureGetExtractHome;
  var db = FirebaseFirestore.instance;
  var cpfCnpj = '';
  SharedPreferences? prefs;
  bool showBalance = false;
  final loading = ValueNotifier<bool>(false);
  User? user = _auth.currentUser;

  @override
  void initState() {
    super.initState();
  }

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
            Image.asset(
              backgroundDashboard,
              width: width,
              height: height * .45,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        // height: height * .02,
                        height: height * .05,
                      ),
                      HelloContainer(
                        width: width,
                        height: height,
                        child: Text(
                          'Olá, ${user?.email}',
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .07,
                      ),
                      SizedBox(
                        width: width * .85,
                        height: 24,
                        child: Text(
                          'Clima',
                          style: textWhite.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Weather(
                          width: width * .85,
                          showBalance: showBalance,
                          onPressed: () {
                            setState(() {
                              showBalance = !showBalance;
                            });
                          },
                          balance: Text(
                            '32º',
                            style: textWhite.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              bottomSheet: Container(
                width: width,
                height: height * .65 - 60,
                decoration: containerModal,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .08,
                    ),
                    SizedBox(
                      height: height * .18,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: width * .1,
                          ),
                          ItemDashboard(
                            height: height,
                            icon: FontAwesomeIcons.fish,
                            iconSize: 50,
                            text: 'Informativos',
                            onPressed: () {
                              Navigator.pushNamed(context, '/infos');
                            },
                          ),
                          SizedBox(
                            width: width * .05,
                          ),
                          ItemDashboard(
                            height: height,
                            icon: FontAwesomeIcons.folderOpen,
                            iconSize: 48,
                            text: 'Documentos',
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
          ],
        ),
      ),
    );
  }
}
