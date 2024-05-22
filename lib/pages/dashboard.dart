import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tilapia_connect/controllers/Firestore.dart';
import 'package:tilapia_connect/src/index.dart';
import 'package:tilapia_connect/src/styles/containers.dart';
import 'package:tilapia_connect/src/widgets/buttons.dart';
import 'package:tilapia_connect/src/widgets/containers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future futureGetSaldo;
  late Future futureGetExtractHome;
  var db = FirebaseFirestore.instance;
  var cpfCnpj = '';
  var user = UserFirestore(false, '', '', '');
  SharedPreferences? prefs;
  bool showBalance = false;
  final loading = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  getUserFirestore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cpfCnpj = prefs.getString('cpfCnpj') ?? '';
    });
    var userInfo = db.collection("ServiceAccount").doc(cpfCnpj);
    userInfo.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print('print getUserFirestore:\n${data}');
        setState(() {
          user.firstAccess = data['FirstAccess'];
          user.name = data['Name'];
          user.email = data['Email'];
          user.phone = data['Phone'];
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
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
                          'Olá, ${user.name}',
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .07,
                      ),
                      // SizedBox(
                      //   width: width * .85,
                      //   height: 24,
                      //   child: Text(
                      //     'Saldo',
                      //     style: textWhite.copyWith(
                      //       fontSize: 16,
                      //     ),
                      //   ),
                      // ),
                      // Balance(
                      //     width: width * .85,
                      //     showBalance: showBalance,
                      //     onPressed: () {
                      //       setState(() {
                      //         showBalance = !showBalance;
                      //       });
                      //     },
                      // balance: FutureBuilder(
                      //     future: futureGetSaldo,
                      //     builder: ((BuildContext context, AsyncSnapshot snapshot) {
                      //       SaldoAndName? data = snapshot.data;
                      //       if (data?.Saldo != null) {
                      //         return Text(
                      //           showBalance
                      //               ? data?.Saldo != null
                      //                   ? getCurrency(data!.Saldo.toString())
                      //                   : ' -'
                      //               : ' -',
                      //           style: textWhite.copyWith(
                      //             fontSize: 32,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         );
                      //       } else {
                      //         return Text(
                      //           showBalance ? getCurrency('5450.20').toString() : ' -',
                      //           style: textWhite.copyWith(
                      //             fontSize: 32,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         );
                      //       }
                      //     })),
                      // balance: Text(
                      //   showBalance ? getCurrency('0').toString() : ' -',
                      //   style: textWhite.copyWith(
                      //     fontSize: 32,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // )),
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
                      height: height * .06,
                    ),
                    SizedBox(
                      width: width * .85,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EntryButton(
                            width: 190,
                            height: 35,
                            widthSizedBoxLeft: 0,
                            widthSizedBoxArrow: 35,
                            borderRadiusBoxArrow: 9,
                            text: 'Contrato de Fretes',
                            fontSize: 13,
                            loading: loading,
                            onPressed: () {
                              Navigator.pushNamed(context, '/extract');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
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
                            icon: FontAwesomeIcons.pix,
                            iconSize: 50,
                            text: 'Começo',
                            onPressed: () {
                              Navigator.pushNamed(context, '/start');
                            },
                          ),
                          SizedBox(
                            width: width * .05,
                          ),
                          ItemDashboard(
                            height: height,
                            icon: FontAwesomeIcons.gasPump,
                            iconSize: 48,
                            text: 'Abastecimento',
                            onPressed: () {
                              Navigator.pushNamed(context, '/fuel');
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
                          ItemDashboard(
                            height: height,
                            icon: FontAwesomeIcons.truckFast,
                            iconSize: 45,
                            text: 'Contratos',
                            onPressed: () {
                              Navigator.pushNamed(context, '/audit');
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
