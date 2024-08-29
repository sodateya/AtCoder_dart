import 'dart:io';

void main() {
  List ntp = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = ntp[0];
  int T = ntp[1];
  int P = ntp[2];
  List lengths = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int days = 0;
  while (true) {
    int count = lengths.where((length) => length >= T).length;

    if (count >= P) {
      print(days);
      return;
    }

    days++;
    lengths = lengths.map((length) => length + 1).toList();
  }
}

// https://atcoder.jp/contests/abc363/tasks/abc363_b