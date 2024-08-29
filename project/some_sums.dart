import 'dart:io';

void main() {
  // 標準入力から値を読み取る
  final List<int> input =
      stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = input[0];
  int A = input[1];
  int B = input[2];

  int totalSum = 0;

  // 1からNまでの各数値についてチェックする
  for (int i = 1; i <= N; i++) {
    int digitSum = sumOfDigits(i);
    if (digitSum >= A && digitSum <= B) {
      totalSum += i;
    }
  }

  // 結果を出力する
  print(totalSum);
}

// 数値の各桁の和を計算する関数
int sumOfDigits(int number) {
  print(number);
  int sum = 0;
  while (number > 0) {
    sum += number % 10;
    number ~/= 10;
  }
  return sum;
}


//https://atcoder.jp/contests/abs/tasks/abc083_b
// ⭐️