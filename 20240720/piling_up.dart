import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);
  if (N <= 99) {
    print(100 - N);
  } else if (N <= 199) {
    print(200 - N);
  } else {
    print(300 - N);
  }
}


// https://atcoder.jp/contests/abc363/tasks/abc363_a