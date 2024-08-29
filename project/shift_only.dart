import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);

  List<int> A = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  int count = 0;

  while (A.every((element) => element % 2 == 0)) {
    A = A.map((element) => element ~/ 2).toList();
    count++;
  }

  print(count);
}


// https://atcoder.jp/contests/abs/tasks/abc081_b