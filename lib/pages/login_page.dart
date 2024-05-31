import 'package:flutter/material.dart';
import 'package:tilapia_connect/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

void signIn(String email, String password, BuildContext context) async {
  try {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('Usuário não encontrado para esse e-mail.');
      AlertDialog(
        title: const Text('Usuário não encontrado'),
        content: const Text('Não foi possível encontrar um usuário com esse e-mail.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    } else if (e.code == 'wrong-password') {
      print('Senha inválida.');
      AlertDialog(
        title: const Text('Senha inválida'),
        content: const Text('Senha incorreta fornecida para esse usuário.'),
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
  } catch (e) {
    print(e);
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  final loading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;
              return SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * .2,
                    ),
                    Center(
                      child: SizedBox(
                        width: width * .6,
                        height: height * .2,
                        child: Image.asset(
                          'assets/images/fish_background.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const Center(
                      child: SizedBox(
                        child: Text('Tilápia Connect', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigoAccent)),
                      ),
                    ),
                    SizedBox(
                      height: height * .12,
                    ),
                    Form(
                      key: _formkey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * .85,
                              child: TextFormField(
                                onChanged: (value) => {
                                  email = value,
                                },
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.indigoAccent,
                                decoration: InputDecoration(
                                  hintText: 'Usuário',
                                  contentPadding: const EdgeInsets.only(left: 20),
                                  filled: true,
                                  fillColor: Colors.grey.shade300,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .07,
                            ),
                            SizedBox(
                              width: width * .85,
                              child: TextFormField(
                                onChanged: (value) => {
                                  password = value,
                                },
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                cursorColor: Colors.indigoAccent,
                                decoration: InputDecoration(
                                  hintText: 'Senha',
                                  contentPadding: const EdgeInsets.only(left: 20),
                                  filled: true,
                                  fillColor: Colors.grey.shade300,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .21,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Ink(
                                  width: width * .85,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      print('login');
                                      FocusManager.instance.primaryFocus?.unfocus();

                                      signIn(email, password, context);
                                    },
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: AnimatedBuilder(
                                        animation: loading,
                                        builder: (context, _) {
                                          return loading.value
                                              ? const SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 2,
                                                  ),
                                                )
                                              : const Text(
                                                  'Entrar',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                  ),
                                                );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
