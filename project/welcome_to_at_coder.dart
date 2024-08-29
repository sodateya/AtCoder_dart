import 'dart:io';

void main() {
  int A = int.parse(stdin.readLineSync()!);
  List BC = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  String S = stdin.readLineSync()!;
  int B = BC[0];
  int C = BC[1];

  final acb = A + B + C;

  print('$acb $S');
}


// https://atcoder.jp/contests/abs/tasks/practice_1