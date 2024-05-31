import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tilapia_connect/pages/infos.dart';
import '../controllers/weather_service.dart';
import '../src/index.dart';
import '../src/styles/containers.dart';
import '../src/styles/text.dart';
import '../src/widgets/containers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../src/widgets/custom.dart';
import 'tilapia_summary.dart';
import 'weather_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _DashboardState extends State<Dashboard> {
  var db = FirebaseFirestore.instance;
  User? user = _auth.currentUser;

  bool showInputCity = false;

  final WeatherService _weatherService = WeatherService();
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? _weatherData;
  bool _isLoadingWeather = false;
  String city = 'Erechim';

  void _fetchWeather(cityValue) async {
    setState(() {
      _isLoadingWeather = true;
      city = cityValue;
    });

    try {
      final weatherData = await _weatherService.fetchWeather(cityValue);
      setState(() {
        _weatherData = weatherData;
        _isLoadingWeather = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingWeather = false;
      });
      AlertDialog(
        title: const Text('Erro'),
        content: const Text('Erro ao carregar clima.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather(city);
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
              height: height * .6,
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
                      Container(
                        width: width * .9,
                        height: height * .14,
                        decoration: containerWithBorderRadius.copyWith(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(.4),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: width * .85,
                              height: 24,
                              child: Text(
                                'Clima em $city',
                                style: textWhite.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            _isLoadingWeather
                                ? const CircularProgressIndicator()
                                : _weatherData != null
                                    ? Weather(
                                        width: width * .85,
                                        showInputCity: showInputCity,
                                        onPressed: () {
                                          setState(() {
                                            showInputCity = !showInputCity;
                                          });
                                        },
                                        temp: Text(
                                          '${_weatherData!['main']['temp']}°C',
                                          style: textWhite.copyWith(
                                            fontSize: 48,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        inputCity: Container(
                                          width: width * .6,
                                          padding: const EdgeInsets.all(10),
                                          decoration: containerWithBorder.copyWith(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: TextField(
                                            controller: _controller,
                                            decoration: InputDecoration(
                                              focusColor: Colors.indigoAccent,
                                              suffixIconColor: Colors.indigoAccent,
                                              fillColor: Colors.indigoAccent,
                                              hoverColor: Colors.indigoAccent,
                                              labelText: 'Digite o nome da cidade',
                                              contentPadding: const EdgeInsets.only(left: 10),
                                              suffixIcon: IconButton(
                                                icon: const Icon(Icons.search),
                                                onPressed: () => {
                                                  _fetchWeather(_controller.text),
                                                  setState(() {
                                                    showInputCity = false;
                                                  }),
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const Text('Digite uma cidade para obter o clima'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomSheet: Container(
                width: width,
                height: height * .5,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const TilapiaSummaryPage()),
                              );
                            },
                          ),
                          SizedBox(
                            width: width * .05,
                          ),
                          ItemDashboard(
                            height: height,
                            icon: FontAwesomeIcons.sun,
                            iconSize: 48,
                            text: 'Clima',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WeatherPage()),
                              );
                            },
                          ),
                          SizedBox(
                            width: width * .05,
                          ),
                          ItemDashboard(
                            height: height,
                            icon: FontAwesomeIcons.fish,
                            iconSize: 50,
                            text: 'Informativos 2 teste',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Informative()),
                              );
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
