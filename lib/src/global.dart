// import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

bool isMainApp = false;

bool redeCredenciada = false;

RegExp validaCelular = RegExp(
    r'^((1[1|2|3|4|5|6|7|8|9])|(2[1|2|4])|(3[1|2|3|4|5|7|8])|(4[1|2|3|4|5|6])|(5[1|3|4|5])|(6[1|2|3|4|5|6|7])|(7[1|3|4|5|7|9])|(8[1|2|3|5|6|7|8|9])|(9[1|2|3|4|5|6|7|8|9]))(9)[1-9]{8}$');

RegExp validaData = RegExp(
    r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');

// LOGIN

class LoginResponse {
  bool success;
  bool redeCredenciada;
  LoginResponse(
    this.success,
    this.redeCredenciada,
  );
}

// login(cpfCnpj, senha) async {
//   var url = Uri.parse(dotenv.get('LOGIN_URL'));
//   var response = await http.post(
//     url,
//     body: {
//       'cpfOrCnpj': cpfCnpj,
//       'password': senha,
//     },
//   );
//   print(response.body);
//   print(response.statusCode);
//   if (jsonDecode(response.body)['Token'] != null) {
//     setToken(jsonDecode(response.body)['Token']);
//     setName(jsonDecode(response.body)['Name']);
//     redeCredenciada = jsonDecode(response.body)['RedeCredenciada'] == 1 ? true : false;
//     return LoginResponse(jsonDecode(response.body)['Sucesso'], redeCredenciada);
//   } else {
//     return LoginResponse(false, false);
//   }
// }

// register(name, cpfCnpj, email, phone, senha) async {
//   var url = Uri.parse(dotenv.get('REGISTER'));
//   var response = await http.post(
//     url,
//     body: {
//       'name': name,
//       'cpfOrCnpj': cpfCnpj,
//       'email': email,
//       'phone': phone,
//       'password': senha,
//     },
//   );
//   print(response.body);
//   print(response.statusCode);
//   if (response.statusCode == 404 || response.statusCode == 500) {
//     return false;
//   } else {
//     return response.body;
//   }
// }

// resetPassword(cpfCnpj) async {
//   var url = Uri.parse(dotenv.get('RESET_PASSWORD'));
//   var response = await http.post(
//     url,
//     body: {
//       'cpfOrCnpj': cpfCnpj,
//     },
//   );
//   print(response.body);
//   print(response.statusCode);
//   if (response.statusCode == 404 || response.statusCode == 500) {
//     return false;
//   } else {
//     return true;
//   }
// }

// LOGOUT
logout() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('token', '');
}

// PEGA OS DADOS DO USUÁRIO
// findMe() async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   var url = Uri.parse(dotenv.get('FIND_ME'));
//   var response = await http.get(
//     url = url,
//     headers: {
//       'Authorization': 'Bearer ${sharedPreferences.getString('token').toString()}',
//     },
//   );
//   return response.body;
// }

// VERIFICA SE O TOKEN É VÁLIDO -> SENÃO RETORNA À TELA INICIAL
// verifyToken(context) async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   var url = Uri.parse(dotenv.get('FIND_ME'));
//   var response = await http.get(
//     url = url,
//     headers: {
//       'Authorization': 'Bearer ${sharedPreferences.getString('token').toString()}',
//     },
//   );
//   if (jsonDecode(response.body)['Sucesso'] == null) {
//     print('token verificado');
//   } else {
//     Fluttertoast.showToast(
//       msg: 'O tempo limite de 5 minutos foi atingido.\nFaça login novamente.',
//       fontSize: 15,
//       backgroundColor: Colors.red,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//     );
//     Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
//   }
// }

// FORMATA OS CAMPOS DE ENTRADA DE R$
// class CurrencyInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }

//     double value = double.parse(newValue.text);

//     final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");

//     String newText = formatter.format(value / 100);

//     return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: newText.length));
//   }
// }

// Formata o valor para R$
// getCurrency(value) {
//   value = double.parse(value);
//   NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_br', name: '');
//   return formatter.format(value);
// }

class SaldoAndName {
  String? Saldo;
  String? Nome;

  SaldoAndName(this.Saldo, this.Nome);
}

bool themeDark() {
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  return isDarkMode;
}

// MagicMask cpfMask = MagicMask.buildMask('999.999.999-99');
// MagicMask cnpjMask = MagicMask.buildMask('99.999.999/9999-99');
// MagicMask cepMask = MagicMask.buildMask('99999-999');
// MagicMask phoneMask = MagicMask.buildMask('(99) 99999-9999');
