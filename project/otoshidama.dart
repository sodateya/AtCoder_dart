import 'dart:io';

void main() {
  List input = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = input[0];
  int Y = input[1];

  for (var i = 0; i <= N; i++) {
    for (var j = 0; j <= N - i; j++) {
      int k = N - i - j;
      int total = 10000 * i + 5000 * j + 1000 * k;
      if (total == Y) {
        print('$i $j $k');
        return;
      }
    }
  }
  print('-1 -1 -1');
}
//https://atcoder.jp/contests/abs/tasks/abc085_c