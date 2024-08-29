import 'dart:io';

void main() {
  List<int> ab = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int a = ab[0], b = ab[1];

  if (a * b % 2 == 0) {
    print('Even');
  } else {
    print('Odd');
  }
}

// https://atcoder.jp/contests/abs/tasks/abc086_a