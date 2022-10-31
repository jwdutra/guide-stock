import 'package:intl/intl.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  bool isValidSenha() {
    return RegExp(
      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])[0-9a-zA-Z$*&@#]{8,}$',
    ).hasMatch(this);
  }

  bool isNumeric() {
    return RegExp(r'^([0-9]){6,}$').hasMatch(this);
  }

  String pipeData() {
    var dateFormat = DateFormat("dd/MM/yyyy");

    return dateFormat.format(DateTime.parse(this));
  }

  String pipeDataHora() {
    var dateFormat = DateFormat("dd/MM/yyyy hh:mm:ss");

    return dateFormat.format(DateTime.parse(this));
  }

  String pipeDataMesAno() {
    var dateFormat = DateFormat("MM/yy");

    return dateFormat.format(DateTime.parse(this));
  }

  String pipeToMoney() {
    var dateFormat = DateFormat("MM/yy");

    return dateFormat.format(DateTime.parse(this));
  }
}
