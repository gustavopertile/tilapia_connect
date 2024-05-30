import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/dashboard.dart';
import 'pages/infos/infos.dart';

import 'pages/login.dart';
import 'theme/theme_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tilápia Connect',
          themeMode: ThemeMode.system,
          theme: MyThemes.lightTheme,
          initialRoute: '/login',
          routes: {
            '/login': (context) => const Login(),
            '/dashboard': (context) => const Dashboard(),
            '/infos': (context) => const Informative(),
          },
        );
      }),
    );
  }
}
