import 'dart:io';

void main() {
  List ST = stdin.readLineSync()!.split(' ').toList();
  String S = ST[0];
  String T = ST[1];

  if (S == 'AtCoder' && T == 'Land') {
    print('Yes');
  } else {
    print('No');
  }
}
