import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);
  List mochiList = [];

  for (var i = 0; i < N; i++) {
    int mochi = int.parse(stdin.readLineSync()!);
    mochiList.add(mochi);
  }

  print(mochiList.toSet().length);
}


// https://atcoder.jp/contests/abs/tasks/abc085_b