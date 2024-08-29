import 'dart:io';

void main() {
  List s = stdin.readLineSync()!.split('').map(int.parse).toList();
  int count = 0;
  for (var i = 0; i < s.length; i++) {
    if (s[i] == 1) {
      count++;
    }
  }
  print(count);
}

// https://atcoder.jp/contests/abs/tasks/abc081_a