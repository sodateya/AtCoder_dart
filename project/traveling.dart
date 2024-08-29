import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);

  int prevT = 0, prevX = 0, prevY = 0;

  for (int i = 0; i < N; i++) {
    List<int> current =
        stdin.readLineSync()!.split(' ').map(int.parse).toList();
    int t = current[0], x = current[1], y = current[2];

    int dist = (x - prevX).abs() + (y - prevY).abs();
    int timeDiff = t - prevT;

    if (dist > timeDiff || dist % 2 != timeDiff % 2) {
      print('No');
      return;
    }

    prevT = t;
    prevX = x;
    prevY = y;
  }

  print('Yes');
}


//https://atcoder.jp/contests/abs/tasks/arc089_a