import 'dart:io';

void main() {
  int A = int.parse(stdin.readLineSync()!);
  int B = int.parse(stdin.readLineSync()!);
  int C = int.parse(stdin.readLineSync()!);
  int X = int.parse(stdin.readLineSync()!);
  int count = 0;
  for (var i = 0; i <= A; i++) {
    for (var j = 0; j <= B; j++) {
      for (var k = 0; k <= C; k++) {
        int sum = 500 * i + 100 * j + 50 * k;
        if (sum == X) {
          count += 1;
        }
      }
    }
  }
  print(count);
}


// https://atcoder.jp/contests/abs/tasks/abc087_b