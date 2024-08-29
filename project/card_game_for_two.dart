import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);
  List<int> cards = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  cards.sort((a, b) => b.compareTo(a));

  int alice = 0;
  int bob = 0;

  for (int i = 0; i < N; i++) {
    if (i % 2 == 0) {
      alice += cards[i];
    } else {
      bob += cards[i];
    }
  }

  print(alice - bob);
}

// https://atcoder.jp/contests/abs/tasks/abc088_b