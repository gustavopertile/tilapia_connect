import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tilapia_connect/theme/theme_model.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  String cpfCnpj = '';
  String senha = '';
  final loading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Consumer(builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      //   child: SizedBox(
                      //     width: width,
                      //     height: height * .1,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         IconButton(
                      //           onPressed: () {
                      //             themeNotifier.isDark ? themeNotifier.isDark = false : themeNotifier.isDark = true;
                      //           },
                      //           icon: Icon(themeNotifier.isDark ? Icons.wb_sunny : Icons.nightlight_round),
                      //           color: themeNotifier.isDark ? Colors.white : Colors.black,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
                                    cpfCnpj = value,
                                  },
                                  keyboardType: TextInputType.number,
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
                                    senha = value,
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
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        Navigator.pushNamed(context, '/dashboard');
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
                              SizedBox(
                                height: height * .03,
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  "Esqueceu sua senha?",
                                  style: TextStyle(
                                    color: Colors.indigoAccent,
                                  ),
                                ),
                              )
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
        );
      }),
    );
  }
}
