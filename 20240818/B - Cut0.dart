import 'dart:io';

void main() {
  double N = double.parse(stdin.readLineSync()!);

  String strValue = N.toString();

  if (strValue.contains('.')) {
    strValue = strValue.replaceAll(RegExp(r'0+$'), '');

    if (strValue.endsWith('.')) {
      strValue = strValue.substring(0, strValue.length - 1);
    }
  }

  print(strValue);
}
